
; @@@ void io_get_msr_register_amd(unsigned long ecx, unsigned long *eax, unsigned long *edx);

	section	.text
	use16
	extern	__heap_top
	global	_io_get_msr_register_amd

_io_get_msr_register_amd:
	push	bp
	mov	bp, sp
	push	edi

	mov	ecx, [bp + 4]
	mov	edi, 0x9c5a203a	; password for AMD private MSR
	rdmsr

	mov	bx, [bp + 8]	; get pointer on the stack
	or	bx, bx
	jz	.1		; NULL pointer, do nothing
	cmp	bx, __heap_top	; judge DS/SS
	jb	.0
	db	0x36		; SS prefix
.0:
	mov	[bx], eax
.1:
	mov	bx, [bp + 10]	; get pointer on the stack
	or	bx, bx
	jz	.3		; NULL pointer, do nothing
	cmp	bx, __heap_top	; judge DS/SS
	jb	.2
	db	0x36		; SS prefix
.2:
	mov	[bx], edx
.3:
	pop	edi
	pop	bp
	ret
