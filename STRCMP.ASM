.model tiny
.code
org 100h
locals @@

Start:		mov bx, offset Msg1
		mov di, offset Msg2
		call strcmp

		Ret

Msg1:	db 'I AM BIG!', 0
Msg2:	db 'i am small!', 0
Msg3:	db 'I AM BIGGER!', 0

;-------------------------------------------------
;Enter:		bx - address of first line
;		di - address of second line
;Result:	al - difference between first different symbols
;			or 0 if they are equal
;Destroy:	bx, di
;-------------------------------------------------
strcmp		proc
do:		mov al, byte ptr [bx]
		mov dl, byte ptr [di]

		cmp al, dl
		jne @@en
		cmp al, 0
		je @@en
		inc bx
		inc di
		jmp do

@@en:		sub al, dl
		Ret
		endp

end	Start