
; @@@ void io_set_msr_register(unsigned long index, unsigned long eax, unsigned long edx);

	section	.text
	use16
	global	_io_set_msr_register

_io_set_msr_register:
	push	bp
	mov	bp, sp

	mov	ecx, [bp + 4]
	mov	eax, [bp + 8]
	mov	edx, [bp + 12]
	wrmsr

	pop	bp
	ret
