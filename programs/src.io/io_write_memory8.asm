
; @@@ void io_write_memory8(unsigned char *offset, unsigned short segment, unsigned char data);

; for far pointer capable system, this function shold be:
;     void io_write_memory8(unsigned char *offset_and_segment, unsigned char data);

	section .text
	use16
	global	_io_write_memory8

_io_write_memory8:
	push	bp
	mov	bp, sp
	push	es

	les	bx, [bp + 4]
	mov	al, [bp + 8]
	
	mov	[es:bx], al

	pop	es
	pop	bp
	ret
