.model tiny
.code
org 100h

Start:		mov si, offset MsgFr
		mov di, offset MsgTo
		mov cx, 4d
		mov ax, ds
		mov es, ax

		call memcpy

		mov dx, di
		mov ah, 09h
		int 21h

		Ret

MsgFr:		db 'True$'
MsgTo:		db 'Lie , I choose it$'

;-------------------------------------------------
;Enter:		si - address of line, from which we copy
;		di - address of line, into which we copy
;		cx - count of character which we copy
;		es - segment, where second line is
;Destroy:	al, si, cx
;Result:	di - address of begginning line, into which we copy
;-------------------------------------------------
memcpy		proc

		push di

		rep movsb

		pop di
		Ret
		endp

end		Start