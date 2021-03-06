#ifndef				VIRTUAL_MEM_H_INCLUDED
	#define				VIRTUAL_MEM_H_INCLUDED

	#include <BOSBOOT.h>
	#include <taskmanagement.h>

	#define PAGESIZE 0x00001000
	#define ENTPERTBL 0x00000400
	#define VMMFRAME 0xFFFFF000

	typedef struct PageTable_PageDir {
		uint32_t Entry[ENTPERTBL];
	}__attribute__((packed)) VMM_t, *VMM_p;

	extern void VMMBase(void);

	void _VMM_init(BootInfo_p BOOTINF);
	void _VMM_map(void*, void*, bool, bool);
	void _VMM_umap(void*);
	void *_VMM_getPhys(void*);
	extern uint32_t getPageDir(void);
	extern void setPageDir(uint32_t);
	void *getCR2(void);

	void *_VMM_getTable(void* Virt);
	void _VMM_umapTable(void* Virt);
	void _VMM_setTable(void *Virt, void *Table, bool User, bool Write);

	void *_VMM_copyPDir(void);
	void _VMM_setCOW(void);
	void _VMM_setCOWOther(void* PDIR);
	void *_VMM_newPDir(void);
	void _VMM_mapOther(void* PDIR, void* Virt, void* Phys, bool User, bool Write);
	void _VMM_umapOther(void* PDIR, void* Virt);
	void *_VMM_getPhysOther(void* PDIR, void* Virt);

#endif