.model tiny
.code
org 100h
locals @@

Start:		mov ax, ds
		mov es, ax

		mov al, 'A'		;We will find symbol al in Msg
		mov di, offset Msg
		mov cx, 3d		;We will scan less than cx+1 symb

		call memchr

		Ret

;-------------------------------------------------
;Enter:		es - address of segment, where line is
;		di - address of line
;		cx - max count of symbols, which memchr can read
;		al - symbol, which we find
;Destroy:	cx
;Return:	di - pointer of symbol which we find
;-------------------------------------------------
memchr		Proc

		inc cx
		cld
		repne scasb
		dec di
		cmp cx, 0
		jnz @@Next

		mov di, 0h

@@Next:		Ret
		endp

Msg:		db 'bcdeA$'

end		Start