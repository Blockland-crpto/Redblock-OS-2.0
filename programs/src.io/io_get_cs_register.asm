
; @@@ unsigned short io_get_cs_register(void);

	section	.text
	use16
	global	_io_get_cs_register

_io_get_cs_register:
	mov	ax, cs
	ret
