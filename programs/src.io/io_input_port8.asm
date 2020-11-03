
; @@@ unsigned char io_input_port8(unsigned short port);

	section .text
	use16
	global	_io_input_port8

_io_input_port8:
	mov	bx, sp
	mov	dx, [ss:bx + 2]

	in	al, dx

	ret
