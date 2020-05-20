.model tiny
.code
org 100h
locals @@

Start:		mov di, offset Msg
		mov al, '!'

		call strrchr
		Ret

;-------------------------------------------------
;Enter:		di - address of line
;		al- symbol which we find
;Result:	df = 0
;		di - address of last symbol, which is equal
;			symbol which we find
;Destroy:	cx, al, bx
;-------------------------------------------------
strrchr		proc

		mov cx, 1000h
		cmp byte ptr [di], 0
		je @@ThatAll

		cld
		mov al, 0
		repne scasb
		dec di

		mov bx, cx
		mov cx, 1000h
		sub cx, bx

		std
		mov al, byte ptr [Symb]
		repne scasb
		inc di

		cld
		jmp @@En

@@ThatAll:	mov di, 0
@@En:		Ret
		endp

Msg		db 'Hello! How are you?$', 0

Symb		db 'H'

end		Start