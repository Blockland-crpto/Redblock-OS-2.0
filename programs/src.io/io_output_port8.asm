
; @@@ void io_output_port8(unsigned short port, unsigned char data);

	section .text
	use16
	global	_io_output_port8

_io_output_port8:
	push	bp
	mov	bp, sp

	mov	dx, [bp + 4]
	mov	al, [bp + 6]
	
	out	dx, al

	pop	bp
	ret
