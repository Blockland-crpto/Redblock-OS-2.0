
; @@@ unsigned long io_read_memory32(unsigned long *offset, unsigned short segment);

; for far pointer capable system, this function shold be :
;     unsigned long io_read_memory32(unsigned long *offset_and_segment);

	section .text
	use16
	global	_io_read_memory32

_io_read_memory32:
	mov	bx, sp
	push	es

	les	bx, [ss:bx + 2]
	mov	eax, [es:bx]

	push	eax
	pop	ax
	pop	dx		; not BX register, don't confuse!

	pop	es
	ret
