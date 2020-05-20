.model tiny
.code
org 100h

Start:		mov di, offset Msg
		xor cx, cx

		call strlen

		Ret

;-------------------------------------------------
;Enter:		cx = 0
;		di - address of line
;Result:	cx - count of symbols in line (without
;			last symbol = 0) 
;Destroy:	al, di
;-------------------------------------------------
strlen		proc

		mov al, byte ptr [di]
		inc cx
		inc di
		cmp al, 00h
		jne strlen
		dec cx
		Ret
		endp

Msg:	db 'Here are 19 symbols', 00h

end		Start