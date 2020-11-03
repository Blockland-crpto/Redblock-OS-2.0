
; @@@ void io_output_port16(unsigned short port, unsigned short data);

	section .text
	use16
	global	_io_output_port16

_io_output_port16:
	push	bp
	mov	bp, sp

	mov	dx, [bp + 4]
	mov	ax, [bp + 6]
	
	out	dx, ax

	pop	bp
	ret
