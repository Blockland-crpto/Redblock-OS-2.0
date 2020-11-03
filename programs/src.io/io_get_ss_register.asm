
; @@@ unsigned short io_get_ss_register(void);

	section	.text
	use16
	global	_io_get_ss_register

_io_get_ss_register:
	mov	ax, ss
	ret
