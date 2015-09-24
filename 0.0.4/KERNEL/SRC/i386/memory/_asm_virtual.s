[bits 32]

[global getPageDir]
[global setPageDir]
[global getCR2]
[global PageDirectoryBase]
[global _VMM_PageFaultHandler]
[global _VMM_umap_UNSAFE]
[global _VMM_map_UNSAFE]

[extern killCurrentThread]
[extern KILL_SYSTEM]

[extern _PMM_alloc]
[extern ClearMessageSystem]

getPageDir:
	mov eax, cr3
	ret

setPageDir:
	push eax
	mov eax, [esp + 8]
	mov cr3, eax
	pop eax
	ret

getCR2:
	mov eax, cr2
	ret


; NOTE: These are only to be used by page fault and thread memory handlers...
; NOT C COMPLIENT!!!


_VMM_PageFaultHandler:
;xchg bx, bx
	; Should only get here in user mode.
	mov eax, DWORD [esp + 60]					; Store Error Code r->err_code
	mov edx, cr2								; Store Fault Address cr2
	and edx, 0xFFFFF000							; Change to beginning of page.

	bt eax, 2									; Is User Bit Set?
	jnc KILL_SYSTEM								; No? Kernel Page Fault, Kill System.

	cmp edx, 0xE0000000							; Is the fault in Kernel Space?
	jge killCurrentThread						; Yes? Kill Current Thread

	cmp edx, 0xD0000000							; Is the fault in IPC Message Area?
	jge .MessageSystem							; Yes? Go to Message Area Handler

	cmp edx, 0xCF800000							; Is the fault in the User Stack?
	jge .StackSpace								; Yes? Go to Stack Space Handler.

	bt eax, 1									; Is this a write error?
	jnc killCurrentThread						; No? Kill current thread. We do not know what to do.

	bt eax, 0									; Is this page present?
	jnc killCurrentThread						; No? Kill current thread. We do not know what to do.

	.CopyOnWrite:

		push edx
		push 0x1000
		call _PMM_alloc							; Allocate a new page
		mov ecx, eax
		mov ebx, 1
		mov eax, 1
		xor edx, edx
		call _VMM_map_UNSAFE
		pop edx
		pop edx
		push ecx

		xor edi, edi
		mov esi, edx
		mov ecx, 0x400
		rep movsd								; Copy Data from read-only page.
		pop ecx
		xor eax, eax
		mov ebx, 1

		call _VMM_map_UNSAFE
		xor edx, edx
		call _VMM_umap_UNSAFE
		ret										; Return to thread.

	.StackSpace:
		bt eax, 0								; Is the page present?
		jc .CopyOnWrite							; Yes? This is a Copy On Write.
		push edx
		push 0x1000
		call _PMM_alloc							; Allocate a new page.
		mov ecx, eax

		xor eax, eax
		mov ebx, 1
		pop edx
		pop edx
		call _VMM_map_UNSAFE
		mov edi, edx

		mov ecx, 0x400
		jmp .clearmem

	.MessageSystem:
;xchg bx, bx
;push 0x12345678
;add esp, 4

		bt eax, 1
		jnc killCurrentThread					; Thread attempted to read non present message

		bt eax, 0
		jnc .msgsysmap
		call ClearMessageSystem
		.msgsysmap:
			push edx
			push 0x1000
			call _PMM_alloc							; Allocate a new page.
			mov ecx, eax

			xor eax, eax
			mov ebx, 1
			pop edx
			pop edx
			call _VMM_map_UNSAFE
			mov edi, edx

			mov ecx, 0x400
		.clearmem:
			mov DWORD [edi], 0
			add edi, 4
			dec ecx
			jnz .clearmem
		ret	

_VMM_map_UNSAFE:
	;eax KERNEL Flag
	;ecx Physical
	;edx Virtual
	;ebx WriteFlag
	mov ebp, edx
	shr ebp, 22
	shl ebp, 2
	mov edi, DWORD [PageDirectoryBase]
	add edi, ebp
	bt DWORD [edi], 0
	jc .MapPage

	push eax
	push edx
	push ecx
	push 0x1000
	call _PMM_alloc
	pop edx
	pop ecx
	or eax, 1
	test ebx, ebx
	jz .ReadOnly
	or eax, 2
	.ReadOnly:
	mov DWORD [edi], eax
	mov DWORD [edi + 0x400000], eax
	mov edx, edi
	sub edx, DWORD [PageDirectoryBase]
	shl edx, 12
	add edx, DWORD [PageDirectoryBase]
	invlpg [edx]
	pop edx
	pop eax
	test eax, eax
	jnz .KernelOnly
	or DWORD [edi], 4
	.KernelOnly:

	.MapPage:
	bt DWORD [edi + 0x400000], 0
	jc .contmap
	mov ebp, DWORD [edi]
	mov DWORD [edi + 0x400000], ebp
	.contmap:
	push edi
	sub edi, DWORD [PageDirectoryBase]
	shr edi, 2
	;page table number in edi
	inc edi
	shl edi, 12
	add edi, DWORD [PageDirectoryBase]

	mov esi, edx
	and esi, 0x3FF000
	shr esi, 12
	shl esi, 2
	add esi, edi
	pop edi
	test eax, eax
	jnz .KOnly
	or ecx, 4
	bt DWORD [edi], 2
	jc .KOnly
	or DWORD [edi], 4
	.KOnly:
	test ebx, ebx
	jz .ROnly
	or ecx, 2
	bt DWORD [edi], 1
	jc .ROnly
	or DWORD [edi], 2
	.ROnly:
	or ecx, 1

	mov DWORD [esi], ecx
	invlpg [edx]
	ret

_VMM_umap_UNSAFE:
	mov edi, edx
	shr edi, 22
	inc edi
	shl edi, 12
	add edi, DWORD [PageDirectoryBase]
	mov esi, edx
	and esi, 0x3FF000
	shr esi, 12
	shl esi, 2
	add esi, edi
	mov DWORD [esi], 0
	invlpg [edx]
	ret

PageDirectoryBase dd 0xFFBFF000