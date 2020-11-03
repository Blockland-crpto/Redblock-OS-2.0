
; @@@ void io_output_port32(unsigned short port, unsigned long data);

	section .text
	use16
	global	_io_output_port32

_io_output_port32:
	push	bp
	mov	bp, sp

	mov	dx, [bp + 4]
	mov	eax, [bp + 6]
	
	out	dx, eax

	pop	bp
	ret
