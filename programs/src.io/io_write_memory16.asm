
; @@@ void io_write_memory16(unsigned short *offset, unsigned short segment, unsigned short data);

; for far pointer capable system, this function shold be:
;     void io_write_memory16(unsigned short *offset_and_segment, unsigned short data);

	section .text
	use16
	global	_io_write_memory16

_io_write_memory16:
	push	bp
	mov	bp, sp
	push	es

	les	bx, [bp + 4]
	mov	ax, [bp + 8]
	
	mov	[es:bx], ax

	pop	es
	pop	bp
	ret
