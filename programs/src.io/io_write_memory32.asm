
; @@@ void io_write_memory32(unsigned long *offset, unsigned short segment, unsigned long data);

; for far pointer capable system, this function shold be:
;     void io_write_memory32(unsigned long *offset_and_segment, unsigned long data);

	section .text
	use16
	global	_io_write_memory32

_io_write_memory32:
	push	bp
	mov	bp, sp
	push	es

	les	bx, [bp + 4]
	mov	eax, [bp + 8]
	
	mov	[es:bx], eax

	pop	es
	pop	bp
	ret
