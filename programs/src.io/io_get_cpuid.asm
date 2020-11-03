
; @@@ void io_get_cpuid(unsigned long index, unsigned long *eax, unsigned long *ebx, unsigned long *ecx, unsigned long *edx);

	section	.text
	use16
	extern	__heap_top
	global	_io_get_cpuid

_io_get_cpuid:
	push	bp
	mov	bp, sp
	push	di
	
	mov	eax, [bp + 4]
	cpuid

	mov	di, [bp + 8]	; get pointer on the stack
	or	di, di
	jz	.1		; NULL pointer, do nothing
	cmp	di, __heap_top	; judge DS/SS
	jb	.0
	db	0x36		; SS prefix
.0:
	mov	[di], eax
.1:
	mov	di, [bp + 10]	; get pointer on the stack
	or	di, di
	jz	.3		; NULL pointer, do nothing
	cmp	di, __heap_top	; judge DS/SS
	jb	.2
	db	0x36		; SS prefix
.2:
	mov	[di], ebx
.3:
	mov	di, [bp + 12]	; get pointer on the stack
	or	di, di
	jz	.5		; NULL pointer, do nothing
	cmp	di, __heap_top	; judge DS/SS
	jb	.4
	db	0x36		; SS prefix
.4:
	mov	[di], ecx
.5:
	mov	di, [bp + 14]	; get pointer on the stack
	or	di, di
	jz	.7		; NULL pointer, do nothing
	cmp	di, __heap_top	; judge DS/SS
	jb	.6
	db	0x36		; SS prefix
.6:
	mov	[di], edx
.7:
	pop	di
	pop	bp
	ret
