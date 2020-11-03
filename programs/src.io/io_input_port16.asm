
; @@@ unsigned short io_input_port16(unsigned short port);

	section .text
	use16
	global	_io_input_port16

_io_input_port16:
	mov	bx, sp
	mov	dx, [ss:bx + 2]

	in	ax, dx

	ret
