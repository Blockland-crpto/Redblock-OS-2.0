
; @@@ unsigned long io_input_port32(unsigned short port);

	section .text
	use16
	global	_io_input_port32

_io_input_port32:
	mov	bx, sp
	mov	dx, [ss:bx + 2]

	in	eax, dx

	push	eax
	pop	ax
	pop	dx		; not BX register, don't confuse!
	
	ret
