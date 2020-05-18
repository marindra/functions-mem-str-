.model tiny
.code
org 100h
locals @@

Start:		mov bx, offset MsgFrom
		mov di, offset MsgTo

		call strcpy

		Ret

;-------------------------------------------------
;Enter:		bx - address of line from we copy
;		di - address of line into which we copy
;Destroy:	al, bx
;Result:	di - address of beginning line into which we copy
;-------------------------------------------------
strcpy		proc
		push di

@@do:		mov al, byte ptr [bx]
		mov byte ptr [di], al
		cmp al, 0
		je @@all
		inc bx
		inc di
		jmp @@do

@@all:		pop di
		Ret
		endp

MsgFrom		db 'Let''s copy it!$', 0, '$'
MsgTo		db 'Sorry! Error!', 0
end	Start