.model tiny
.code
org 100h

Start:		mov di, offset Msg
		mov ax, ds
		mov es, ax
		mov al, ' '
		mov cx, 14d

		call memset

		mov ah, 09h
		int 21h

		Ret

Msg:		db 'True or lie - What do you choose?$'

;-------------------------------------------------
;Enter:		cx - count of symbols
;		al - symbol
;		es:di - address of line, which we change
;Destroy:	di, cx
;Return:	dx - address of line, which we change
;-------------------------------------------------
memset		proc

		mov dx, cx

		rep stosb

		sub di, dx
		mov dx, di
		
		Ret
		endp

end		Start