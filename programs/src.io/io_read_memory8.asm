
; @@@ unsigned char io_read_memory8(unsigned char *offset, unsigned short segment);

; for far pointer capable system, this function shold be :
;     unsigned char io_read_memory8(unsigned char *offset_and_segment);

	section .text
	use16
	global	_io_read_memory8

_io_read_memory8:
	mov	bx, sp
	push	es

	les	bx, [ss:bx + 2]
	mov	al, [es:bx]

	pop	es
	ret
