
; @@@ unsigned short io_get_ds_register(void);

	section	.text
	use16
	global	_io_get_ds_register

_io_get_ds_register:
	mov	ax, ds
	ret
