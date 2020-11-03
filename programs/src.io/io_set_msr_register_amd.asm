
; @@@ void io_set_msr_register_amd(unsigned long index, unsigned long eax, unsigned long edx);

	section	.text
	use16
	global	_io_set_msr_register_amd

_io_set_msr_register_amd:
	push	bp
	mov	bp, sp
	push	edi

	mov	ecx, [bp + 4]
	mov	eax, [bp + 8]
	mov	edx, [bp + 12]
	mov	edi, 0x9c5a203a	; password for AMD private MSR
	wrmsr

	pop	edi
	pop	bp
	ret
