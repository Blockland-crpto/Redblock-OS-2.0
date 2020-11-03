
; @@@ void io_get_tsc_counter(unsigned long *low32, unsigned long *high32);

	section	.text
	use16
	extern	__heap_top
	global	_io_get_tsc_counter

_io_get_tsc_counter:
	push	bp
	mov	bp, sp

	rdtsc

	mov	bx, [bp + 4]	; get pointer on the stack
	or	bx, bx
	jz	.1		; NULL pointer, do nothing
	cmp	bx, __heap_top	; judge DS/SS
	jb	.0
	db	0x36		; SS prefix
.0:
	mov	[bx], eax
.1:
	mov	bx, [bp + 6]	; get pointer on the stack
	or	bx, bx
	jz	.3		; NULL pointer, do nothing
	cmp	bx, __heap_top	; judge DS/SS
	jb	.2
	db	0x36		; SS prefix
.2:
	mov	[bx], edx
.3:
	pop	bp
	ret
