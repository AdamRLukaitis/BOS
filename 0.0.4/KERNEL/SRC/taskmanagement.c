#include <taskmanagement.h>
#include <i386/memory/physical.h>
#include <i386/memory/virtual.h>
#include <i386/cpu/i686.h>

typedef struct INTTasks {
	uint32_t TaskID[256];
}__attribute__ ((packed)) INTTSK_t, *INTTSK_p; // 1 KB

#define MAX_THREADS 4096
#define MAX_MSGS 2048

#define MSG_BASE	0xDF000000
#define PROGRAM_BASE 0x01000000 //16MB

uint32_t CurrentThread;

#define TF_ACTIVE	0x00000001

#define TF_WAITINT	0x00000004
#define TF_WAITMSG	0x00000008
#define TF_USESSE	0x00000010

#define TF_DEAD		0xFFFFFFFE
#define TF_REGS		0x00000080 // Use this and EAX, EBX, ECX, EDX, ESI, EDI will be saved from the previous thread when called by int handler

#define TF_LINKF	0xFFFFFC00 // if we are waiting for another thread the tread number needs to be stored here this is 22 bits so max threads can be 3FFFFF (4194303)


extern void IDTBase(void);

extern void GDTBase(void);

typedef struct ThreadEntry {
	char Name[428];
	uint32_t Flags;
	uint32_t CR3;
	regs TRegs; // 76 Bytes
	uint8_t SSEData[512]; // 512 Bytes
}__attribute__((packed)) Thread_t, *Thread_p; // 1KB

typedef struct ThreadList {
	Thread_t Thread[MAX_THREADS];
}__attribute__((packed)) ThreadMan_t, *ThreadMan_p; // 4MB

typedef struct MSGEntry {
	uint32_t SrcID;
	uint32_t DestID;
	uint32_t DataPages;
	void* Data;
}__attribute__((packed)) MSG_t, *MSG_p; // 32 Bytes

typedef struct MSGList {
	MSG_t MSG[MAX_MSGS];
}__attribute__((packed)) MSGMan_t, *MSGMan_p; // 64KB

ThreadMan_p MyThreads;
MSGMan_p MyMSGs;
INTTSK_p MyINTTasks;

void* MSGHeap;

void ThreadManager(regs *r);
void LoadThread(regs *r, uint32_t NextThread);

void TM_Handler(regs *r);
void MEM_Handler(regs *r);
void IPC_Handler(regs *r);
void API_Handler(regs *r);
uint32_t ReserveEmptyThread(void);
void ForkThread(regs *r, uint32_t NewEIP);
void ExecThread(regs *r);

bool SendMSG(regs *r, uint32_t DestID, uint32_t MSGSize);

void PIT_TEST(void);

void _TM_init()
{
#ifdef DEBUG
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	MyThreads = (ThreadMan_p) 0xE0001000;
	MyMSGs = (MSGMan_p) 0xE0401000;
	MyINTTasks = (INTTSK_p) 0xE0000000;
	void* ThreadLoc = _PMM_alloc(0x400000);
	void* MSGLoc = _PMM_alloc(0x10000);
	void* INTLoc = _PMM_alloc(0x1000);
	_VMM_map((void*)0xE0000000, INTLoc, FALSE, TRUE);
	for(uint32_t x = 0; x < 0x400000; x += 0x1000)
		_VMM_map((void*) (0xE0001000 + x), (void*)(((uint32_t)ThreadLoc) + x), FALSE, TRUE);
	for(uint32_t x = 0; x < 0x10000; x += 0x1000)
		_VMM_map((void*) (0xE0401000 + x), (void*)(((uint32_t)MSGLoc) + x), FALSE, TRUE);
	memsetd((void*)0xE0000000, 0, 0x0000104400);
	for(uint32_t x = 0; x < MAX_THREADS; x++)
		MyThreads->Thread[x].Flags = TF_DEAD;
	CurrentThread = 0;
	MSGHeap = (void*)MSG_BASE;
	MyThreads->Thread[0].Flags = 0;
	MyThreads->Thread[0].CR3 = 0;
	MyThreads->Thread[1].Flags = TF_ACTIVE;
	MyThreads->Thread[1].CR3 = 0;
	MyThreads->Thread[1].TRegs.gs = 0x10;
	MyThreads->Thread[1].TRegs.fs = 0x10;
	MyThreads->Thread[1].TRegs.es = 0x10;
	MyThreads->Thread[1].TRegs.ds = 0x10;
	// MyThreads->Thread[1].TRegs.gs = 0x23;
	// MyThreads->Thread[1].TRegs.fs = 0x23;
	// MyThreads->Thread[1].TRegs.es = 0x23;
	// MyThreads->Thread[1].TRegs.ds = 0x23;
	MyThreads->Thread[1].TRegs.eip = (uint32_t)&PIT_TEST;
	MyThreads->Thread[1].TRegs.cs = 0x8;
	MyThreads->Thread[1].TRegs.ss = 0x10;
	// MyThreads->Thread[1].TRegs.cs = 0x1B;
	// MyThreads->Thread[1].TRegs.ss = 0x23;
	MyThreads->Thread[1].TRegs.useresp = 0xFFBFB000;
	MyThreads->Thread[1].TRegs.eflags = 0x00000200;
	MyThreads->Thread[1].TRegs.esp = 0xFFBFB000;
}

void killCurrentThread()
{
#ifdef DEBUG
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	MyThreads->Thread[CurrentThread].Flags = TF_DEAD;
}

void IDT_HANDLER(regs *r)
{
#ifdef DEBUG_EXTREAM
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	if(r->int_no >= 0xF0) {
		// Kernel Controlled System Calls
		switch(r->int_no) {
			case 0xF0:
				IPC_Handler(r);
				break;
			case 0xF1:
				TM_Handler(r);
				break;
			case 0xF2:
				MEM_Handler(r);
				break;
			case 0xF3:
				API_Handler(r);
				break;
			default:
				break;
		}
		return;
	}else if(r->int_no < 0x20) {
		if(r->int_no == 0x0E)
			_VMM_PageFaultManager(r);
		else {
		//ISRS From CPU
#ifdef DEBUG
	DEBUG_printf("Unhandled CPU INT: %i\nKilling Current Thread\n", r->int_no);
#endif
			// killCurrentThread(r);
			MyThreads->Thread[CurrentThread].Flags = TF_DEAD;
			ThreadManager(r);
		}
	} else {
		if(r->int_no > 0x27 && r->int_no < 0x30)
			outb(0xA0, 0x20);
		if(r->int_no > 0x1F && r->int_no < 0x30)
			outb(0x20, 0x20);
		if(MyINTTasks->TaskID[r->int_no] && (MyINTTasks->TaskID[r->int_no] < 0xFFFFFFFF)) {
			//Save Task
			memcpy(&MyThreads->Thread[CurrentThread].TRegs, r, sizeof(regs));
			if(MyThreads->Thread[CurrentThread].Flags & TF_USESSE)
				SSE_Save(&MyThreads->Thread[CurrentThread].SSEData);
			//Get New Task And Set Flags
			CurrentThread = MyINTTasks->TaskID[r->int_no];
			MyThreads->Thread[CurrentThread].Flags &= (~((uint32_t)TF_WAITINT));
			MyINTTasks->TaskID[r->int_no] = 0;
			//Load Task
			if(!(MyThreads->Thread[CurrentThread].Flags & TF_REGS))
				memcpy(r, &MyThreads->Thread[CurrentThread].TRegs, sizeof(regs));
			else { // probably the long way but whatever...
				r->gs = MyThreads->Thread[CurrentThread].TRegs.gs;
				r->fs = MyThreads->Thread[CurrentThread].TRegs.fs;
				r->es = MyThreads->Thread[CurrentThread].TRegs.es;
				r->ds = MyThreads->Thread[CurrentThread].TRegs.ds;
				r->eip = MyThreads->Thread[CurrentThread].TRegs.eip;
				r->cs = MyThreads->Thread[CurrentThread].TRegs.cs;
				r->eflags = MyThreads->Thread[CurrentThread].TRegs.eflags;
				r->useresp = MyThreads->Thread[CurrentThread].TRegs.useresp;
				r->ss = MyThreads->Thread[CurrentThread].TRegs.ss;
				r->ebp = MyThreads->Thread[CurrentThread].TRegs.ebp;
				r->esp = MyThreads->Thread[CurrentThread].TRegs.esp;
			}
			if(MyThreads->Thread[CurrentThread].Flags & TF_USESSE)
				SSE_Load(&MyThreads->Thread[CurrentThread].SSEData);
			if(MyThreads->Thread[CurrentThread].CR3)	// only set CR3 if this is not in shared space.
				setPageDir(MyThreads->Thread[CurrentThread].CR3);
			MyThreads->Thread[CurrentThread].Flags &= (uint32_t) (~TF_REGS);
			return;
		} else {
			MyINTTasks->TaskID[r->int_no] = 0xFFFFFFFF; // Mark As Fired (maybe someone will use it later)
			ThreadManager(r); // Go to another task if we made it here
		}
	}
}

void ThreadManager(regs *r)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	//Save Current Thread
	/*memcpy(&MyThreads->Thread[CurrentThread].TRegs, r, sizeof(regs));
	if(MyThreads->Thread[CurrentThread].Flags & TF_USESSE)
		SSE_Save(&MyThreads->Thread[CurrentThread].SSEData);
*/
	//Calculate Next Thread
	//... Temperary, Use Ring
	uint32_t NewThread = 0;
	for(NewThread = (CurrentThread + 1); ; NewThread++) {
		if((MyThreads->Thread[NewThread].Flags & TF_ACTIVE)) {
			// CurrentThread = NewThread;
			//Load New Thread
			/*memcpy(r, &MyThreads->Thread[CurrentThread].TRegs, sizeof(regs));
			if(MyThreads->Thread[CurrentThread].Flags & TF_USESSE)
				SSE_Load(&MyThreads->Thread[CurrentThread].SSEData);
			if(MyThreads->Thread[CurrentThread].CR3)
				setPageDir(MyThreads->Thread[CurrentThread].CR3);*/
			break;
		}
		if(NewThread >= MAX_THREADS)
			NewThread = 0xFFFFFFFF; // that way when we loop it will be 0.
		if((NewThread == CurrentThread) && !(MyThreads->Thread[NewThread].Flags & TF_ACTIVE)) {
			NewThread = 0;	// Load Idle Thread.
			break;
		}
	}
	LoadThread(r, NewThread);
}

void LoadThread(regs *r, uint32_t NextThread)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif

	//Save Current Thread
	memcpy(&MyThreads->Thread[CurrentThread].TRegs, r, sizeof(regs));
	if(MyThreads->Thread[CurrentThread].Flags & TF_USESSE)
		SSE_Save(&MyThreads->Thread[CurrentThread].SSEData);

	//Set New Thread as Current Thread
	CurrentThread = NextThread;
	
	//Load New Thread
	memcpy(r, &MyThreads->Thread[CurrentThread].TRegs, sizeof(regs));
	if(MyThreads->Thread[CurrentThread].Flags & TF_USESSE)
		SSE_Load(&MyThreads->Thread[CurrentThread].SSEData);
	if(MyThreads->Thread[CurrentThread].CR3)
		setPageDir(MyThreads->Thread[CurrentThread].CR3);
}

void TM_Handler(regs *r)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	/*This will be installed on INT 0xF1
	INPUT AL:	00h - kill
				01h - fork
				02h - exec
				03h - yield
				80h - request SSE/FPU
				81h - ioperm

	AL = 00h:	No Input Needed

	AL = 01h:	EDX = EIP of thread

	AL = 02h:	EBX = Start of executable
				ECX = Size of executable
				EDX = Start EIP

	AL = 03h:	No Input Needed

	AL = 80h:	No Input Needed

	Output:
	AL = 00h:	NONE

	AL = 01h:	New Thread Added

	AL = 02h:	New Task Added

	AL = 03h:	Task switched

	AL = 80h:	Task Manager Now Saves And Restores SSE/FPU Registers.
	*/
	uint8_t Function_Number = (uint8_t) (r->eax & 0xFF);
	switch(Function_Number) {
		case 0x00:
			MyThreads->Thread[CurrentThread].Flags = TF_DEAD;
			break;
		case 0x01:	// Fork
			ForkThread(r, r->edx);
			break;
		case 0x02:	// EXEC
			ExecThread(r);
			break;
		case 0x03:	// Yeild (so this is correct.)
			break;
		case 0x80:
			MyThreads->Thread[CurrentThread].Flags |= TF_USESSE;
			return;
		case 0x81:
			MyThreads->Thread[CurrentThread].TRegs.eflags |= 0x00003000;
			return;
		default:
			r->eax = 0;
	}
	ThreadManager(r);
}

void MEM_Handler(regs *r)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	/*This will be installed on INT 0xF2
	INPUT AL:	00h - Request New Page
				01h - Un Map Virtual Address And Free Physical
				80h - Map Physical Address... (SECURITY HOLE I KNOW!)
				81h - Un Map Virtual Address

	AL = 00h:	EDX = Virtual Address
				EBX = 0x01 = Write 0x00 = read

	AL = 01h:	EDX = Virtual Address

	AL = 80h:	ECX = Physical Address
				EDX = Virtual Address
				EBX = 0x01 = Write 0x00 = Read

	AL = 81h:	EDX = Virtual Address

	*/
	uint8_t Function_Number = (uint8_t) (r->eax & 0xFF);
	switch(Function_Number) {
		case 0x00:
			_VMM_map((void*)r->edx, _PMM_alloc(PAGESIZE), TRUE, (bool)r->ebx);
			break;
		case 0x01:
			_PMM_free(_VMM_getPhys((void*)r->edx), PAGESIZE);
		case 0x81:
			_VMM_umap((void*)r->edx);
			break;
		case 0x80:
			_VMM_map((void*)r->edx, (void*)r->ecx, TRUE, (bool)r->ebx);
			break;
		default:
			r->eax = 0;
	}
	return;
}

void IPC_Handler(regs *r)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	/*This will be installed on INT 0xF0
	INPUT AL:	01h - wait for messgae
				02h - send message
				80h - wait for INT
				81h - wait for INT get regs from caller

	AL = 01h:	EBX = Sorce Task ID (0 for any)

	AL = 02h:	EDX = Destination Task ID
				ECX = Size Of Data

	AL = 80h	EBX = INT Number
				
	OUTPUT:
	AL = 00h:	Filled Data Buffer [DS:EDX]
				ECX = Size of Data Buffer Filled
				EAX = 1 on success and 0 on fail

	AL = 01h:	Thread starts running again on a message recieved...

	AL = 02h:	Thread Stops running

	AL = 80h/81h:Thread starts again on INT or continues if fired but not handled.*/
	uint8_t Function_Number = (uint8_t) (r->eax & 0xFF);
	switch(Function_Number) {
		case 0x01:
			MyThreads->Thread[CurrentThread].Flags &= (uint32_t)(~(TF_ACTIVE));
			MyThreads->Thread[CurrentThread].Flags |= TF_WAITMSG;
			MyThreads->Thread[CurrentThread].Flags &= (uint32_t)(~TF_LINKF);
			MyThreads->Thread[CurrentThread].Flags |= (r->ebx << 10);
			break;
		case 0x02: // Send Message
			if(!SendMSG(r, r->edx, r->ecx))
				r->eax = 0;
			return;
		case 0x81:
			MyThreads->Thread[CurrentThread].Flags |= TF_REGS;
		case 0x80:
			if(MyINTTasks->TaskID[r->ebx] == 0xFFFFFFFF) {
				MyINTTasks->TaskID[r->ebx] = 0;
				return;
			} else {
				MyINTTasks->TaskID[r->ebx] = CurrentThread;
				MyThreads->Thread[CurrentThread].Flags &= (uint32_t)(~(TF_ACTIVE));
				MyThreads->Thread[CurrentThread].Flags |= TF_WAITINT;
			}
			break;
		default:
			r->eax = 0;
	}
	ThreadManager(r);
}

void API_Handler(regs *r)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	/*This will be installed on INT 0xF3
	INPUT AL:	00h - Request API Function Location
				01h - Add API Function
	*/
	uint8_t Function_Number = (uint8_t) (r->eax & 0xFF);
}

bool SendMSG(regs *r, uint32_t DestID, uint32_t MSGSize)
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	if(MSGSize > 0x10000000)
		return FALSE; //ERROR
	if((MyThreads->Thread[DestID].Flags & TF_WAITMSG) &&
		(((MyThreads->Thread[DestID].Flags >> 10) == CurrentThread) || (!(MyThreads->Thread[DestID].Flags >> 10)))) {
		
		uint32_t Pages = (MSGSize / 0x400000);
		if(MSGSize % 0x400000)
			Pages++;

		void* TempPageAddress[Pages];

		for(uint32_t x = 0; x < Pages; x++) {
			TempPageAddress[x] = _VMM_getTable((void*)(0xD0000000 + (x * 0x400000)));
			_VMM_umapTable((void*)(0xD0000000 + (x * 0x400000)));
		}
		LoadThread(r, DestID);
		for(uint32_t x = 0; x < Pages; x++)
			_VMM_setTable((void*)(0xD0000000 + (x * 0x400000)), TempPageAddress[x], TRUE, FALSE);
		return TRUE;
	}
	return FALSE;
}

void PIT_TEST()
{
#ifdef DEBUG_FULL
	DEBUG_printf("BOS v. 0.0.4\t%s\tCompiled at %s on %s Line %i\tFunction \"%s\"\n", __FILE__, __TIME__, __DATE__, (__LINE__ - 3), __func__);
#endif
	uint32_t c = 0;
	while(true) {
		__asm__ __volatile__ ( "int $0xF0" : : "a" (0x80), "b" (0x20));
		__asm__ __volatile__ ( "int $0xF2" : : "a" (0x80), "b" (1), "c" (0xC0004000), "d" (0x05000000));
		//	AL = 81h:	EDX = Virtual Address
			/*AL = 80h:	ECX = Physical Address
				EDX = Virtual Address
				EBX = 0x01 = Write 0x00 = Read*/
		memsetd((void*)(0x05000000), c++, 1024);
		__asm__ __volatile__ ( "int $0xF2" : : "a" (0x81), "d" (0x05000000));
		DEBUG_printf("PIT FIRED\n");
	}
}

uint32_t ReserveEmptyThread()
{
	for(uint32_t x = 0; x < MAX_THREADS; x++)
		if(MyThreads->Thread[x].Flags == TF_DEAD) {
			MyThreads->Thread[x].Flags = 0;
			return x;
		}
	return 0;
}

void ForkThread(regs *r, uint32_t NewEIP)
{
	uint32_t NewThreadID;
	if(NewThreadID = ReserveEmptyThread()) {
		uint32_t NewPageDir = (uint32_t) _VMM_CopyDirectory();
		memcpy((void*)((uint32_t)(&MyThreads->Thread[NewThreadID].SSEData)), (void*)((uint32_t)(&MyThreads->Thread[CurrentThread].SSEData)), 512);
		memcpy((void*)((uint32_t)(&MyThreads->Thread[NewThreadID].TRegs)), (void*)((uint32_t)(&MyThreads->Thread[CurrentThread].TRegs)), sizeof(regs));
		MyThreads->Thread[NewThreadID].TRegs.eip = NewEIP;
		MyThreads->Thread[NewThreadID].CR3 = NewPageDir;
		MyThreads->Thread[NewThreadID].Flags = MyThreads->Thread[CurrentThread].Flags;
		LoadThread(r, NewThreadID);
		_VMM_setUserCopyOnWrite();
	}
}

void ExecThread(regs *r)
{
	uint32_t NewThreadID;
	if(NewThreadID = ReserveEmptyThread()) {
		uint32_t NewPageDir = (uint32_t) _VMM_NewDirectory();
		
		//....
		/*
		.TEXT (START / SIZE)
		.DATA (START / SIZE)
		.BSS (START / SIZE)
		EIP Entry Point

		EBX
		ECX
		EDX
		ESI
		EDI
		*/
	}
}
