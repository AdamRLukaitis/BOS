%ifndef __PXEBASEAPI_INC__INCLUDED__
%define __PXEBASEAPI_INC__INCLUDED__

[bits 16]

PXE_GET_CACHED_INFO equ 0x0071
PXE_TFTP_OPEN equ 0x0020
PXE_TFTP_READ equ 0x0022
PXE_TFTP_CLOSE equ 0x0021

; NOTE THESE ARE NOT REGISTER SAFE!

init_PXE:
	push ds
	push es
	pop ds
	xor ax, ax
	mov es, ax

	mov cx, 11; 44/4
	mov di, PXEENV
	mov si, bx
	rep movsd
	pop ds
	cmp WORD [PXEENV.Version], 0x0201
	jae .NewerPXE
	mov ax, WORD [PXEENV.RMEntryOffset]
	mov WORD [PXEAPIOffset], ax
	mov ax, WORD [PXEENV.RMEntrySegment]
	mov WORD [PXEAPISegment], ax
	jmp .Contine
	.NewerPXE:
		mov ax, WORD [PXEENV.PXEPtrSegment]
		mov si, WORD [PXEENV.PXEPtrOffset]
		mov di, PXE
		push ds
		mov ds, ax
		mov cx, 6; 24/4
		rep movsd
		pop ds
		mov ax, WORD [PXE.RMEntryOffset]
		mov WORD [PXEAPIOffset], ax
		mov ax, WORD [PXE.RMEntrySegment]
		mov WORD [PXEAPISegment], ax
	.Contine:

		mov bx, PXE_GET_CACHED_INFO
		mov di, PXENV_GET_CACHED_t
		call usePXE
		test ax, ax
		mov ax, WORD [PXENV_GET_CACHED_t.Status]
		jnz TFTP_ERROR
		mov ax, WORD [PXENV_GET_CACHED_t.BufferSeg]
		mov bx, WORD [PXENV_GET_CACHED_t.BufferOff]
		push es
		mov es, ax
	
		mov eax, DWORD [es:bx + 20]
		mov DWORD [ServerIP], eax
		mov eax, DWORD [es:bx + 24]
		mov DWORD [RelayIP], eax

		pop es
		ret

;ds:si = filename
TFTP_OPEN:
	push si
	mov eax, DWORD [ServerIP]
	mov DWORD [PXENV_TFTP_OPEN_t.SIP], eax
	mov eax, DWORD [RelayIP]
	mov DWORD [PXENV_TFTP_OPEN_t.GIP], eax
	mov di, PXENV_TFTP_OPEN_t.Filename
	.SetFileName:
		lodsb
		stosb
		test al, al
		jnz .SetFileName
	mov WORD [PXENV_TFTP_OPEN_t.Port], 0x4500
	mov WORD [PXENV_TFTP_OPEN_t.PacketSize], 0x200 ; 512 byte packets
	mov di, PXENV_TFTP_OPEN_t
	mov bx, PXE_TFTP_OPEN
	call usePXE
	pop si
	test ax, ax
	mov ax, WORD [PXENV_TFTP_OPEN_t.Status]
	jnz TFTP_ERROR
	ret

TFTP_CLOSE:
	mov di, PXENV_TFTP_CLOSE_t
	mov bx, PXE_TFTP_CLOSE
	call usePXE
	test ax, ax
	mov ax, WORD [PXENV_TFTP_CLOSE_t.Status]
	jnz TFTP_ERROR
	ret

;ds:di = buffer
;RET AX = PACKET SIZE RECIVED
TFTP_READ_PACKET:
	mov WORD [PXENV_TFTP_READ_t.BufferOff], di
	mov WORD [PXENV_TFTP_READ_t.BufferSeg], ds
	mov di, PXENV_TFTP_READ_t
	mov bx, PXE_TFTP_READ
	call usePXE
	test ax, ax
	mov ax, WORD [PXENV_TFTP_OPEN_t.Status]
	jnz TFTP_ERROR
	mov ax, WORD [PXENV_TFTP_READ_t.BufferSize]
	ret

; DS:DI = PACKET
; BX = PXE Opcode
usePXE:
	push ds
	push di
	push bx
	call far [PXEAPI]
	add sp, 6
	ret

;input ax = error code
TFTP_ERROR:
	push ERROR.halt ; Push return address.
	cmp ax, 0x01
	je .PXEE01
	cmp ax, 0x32
	je .PXEE32
	cmp ax, 0x35
	je .PXEE35
	cmp ax, 0x36
	je .PXEE36
	cmp ax, 0x38
	je .PXEE38
	cmp ax, 0x39
	je .PXEE39
	cmp ax, 0x3A
	je .PXEE3A
	cmp ax, 0x3B
	je .PXEE3B
	cmp ax, 0x3C
	je .PXEE3C
	cmp ax, 0x3F
	je .PXEE3F
	mov si, TFTP_ERROR_CODES.PXEExx
	call puts
	jmp PrintHex
	.PXEE01:
		mov si, TFTP_ERROR_CODES.PXEE01
		jmp puts
	.PXEE32:
		mov si, TFTP_ERROR_CODES.PXEE32
		jmp puts
	.PXEE35:
		mov si, TFTP_ERROR_CODES.PXEE35
		jmp puts
	.PXEE36:
		mov si, TFTP_ERROR_CODES.PXEE36
		jmp puts
	.PXEE38:
		mov si, TFTP_ERROR_CODES.PXEE38
		jmp puts
	.PXEE39:
		mov si, TFTP_ERROR_CODES.PXEE39
		jmp puts
	.PXEE3A:
		mov si, TFTP_ERROR_CODES.PXEE3A
		jmp puts
	.PXEE3B:
		mov si, TFTP_ERROR_CODES.PXEE3B
		jmp puts
	.PXEE3C:
		mov si, TFTP_ERROR_CODES.PXEE3C
		jmp puts
	.PXEE3F:
		mov si, TFTP_ERROR_CODES.PXEE3F
		jmp puts

PXEENV:
	.Signature db 0, 0, 0, 0, 0, 0
	.Version dw 0
	.Length db 0
	.CheckSum db 0
	.RMEntry:
	.RMEntryOffset dw 0
	.RMEntrySegment dw 0
	.PMOffset dd 0
	.PMSelector dw 0
	.StackSeg dw 0
	.StackSize dw 0
	.BCCodeSeg dw 0
	.BCCodeSize dw 0
	.BCDataSeg dw 0
	.BCDataSize dw 0
	.UNDIDataSeg dw 0
	.UNDIDataSize dw 0
	.UNDICodeSeg dw 0
	.UNDICodeSize dw 0
	.PXEPtr:
	.PXEPtrOffset dw 0
	.PXEPtrSegment dw 0

PXE:
	.Signature db 0, 0, 0, 0
	.Length db 0
	.CheckSum db 0
	.Revision db 0
	.Reserved db 0
	.UNDIROMID dd 0
	.BCROMID dd 0
	.RMEntry:
	.RMEntryOffset dw 0
	.RMEntrySegment dw 0
	.PMEntry dd 0


PXENV_GET_CACHED_t:
	.Status dw 0
	.PacketType dw 3
	.BufferSize dw 0x1000
		.BufferOff dw 0x1000 
		.BufferSeg dw 0
	.BufferLimit dw 0

PXENV_TFTP_OPEN_t:
	.Status dw 0
	.SIP dd 0
	.GIP dd 0
	.Filename times 128 db 0
	.Port dw 0
	.PacketSize dw 0

PXENV_TFTP_READ_t:
	.Status dw 0
	.PacketNumber dw 0
	.BufferSize dw 0
	.BufferOff dw 0
	.BufferSeg dw 0

PXENV_TFTP_CLOSE_t:
	.Status dw 0

PXEAPI:
PXEAPIOffset dw 0
PXEAPISegment dw 0

ServerIP dd 0
RelayIP dd 0

TFTP_ERROR_CODES:
	.PXEE01 db "PXE-E01: TFTP error - File not found. or Access violation.", 0
	.PXEE32 db "PXE-E32: TFTP open timeout.", 0
	.PXEE35 db "PXE-E35: TFTP read timeout.", 0
	.PXEE36 db "PXE-E36: Error received from TFTP server.", 0
	.PXEE38 db "PXE-E38: TFTP cannot open connection.", 0
	.PXEE39 db "PXE-E39: TFTP cannot read from connection.", 0
	.PXEE3A db "PXE-E3A: TFTP too many packages.", 0
	.PXEE3B db "PXE-E3B: TFTP error - File not found.", 0
	.PXEE3C db "PXE-E3C: TFTP error - Access violation.", 0
	.PXEE3F db "PXE-E3F: TFTP packet size is invalid.", 0
	.PXEExx db "UNKNOWN ERROR! ", 0


%endif