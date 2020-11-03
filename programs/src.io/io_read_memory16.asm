
; @@@ unsigned short io_read_memory16(unsigned short *offset, unsigned short segment);

; for far pointer capable system, this function shold be :
;     unsigned short io_read_memory16(unsigned short *offset_and_segment);

	section .text
	use16
	global	_io_read_memory16

_io_read_memory16:
	mov	bx, sp
	push	es

	les	bx, [ss:bx + 2]
	mov	ax, [es:bx]

	pop	es
	ret
