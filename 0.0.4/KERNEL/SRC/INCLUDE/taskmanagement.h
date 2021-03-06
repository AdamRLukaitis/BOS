#ifndef				TASKMANAGEMENT_H_INCLUDED
	#define				TASKMANAGEMENT_H_INCLUDED

	#include <KLIB.h>
	#include <BOSBOOT.h>

	// #define TM_COOPERATIVE // Uncomment for Cooperative Multitasking

	typedef struct registers	{
		uint32_t gs, fs, es, ds;
		uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax;
		uint32_t int_no, err_code;
		uint32_t eip, cs, eflags, useresp, ss;    
	} __attribute__((packed)) regs; //76 Bytes

	void _TM_init(BootInfo_p BOOTINF);
	// void IDT_HANDLER(regs *r);
	extern void killCurrentThread(regs *r);
	
#endif