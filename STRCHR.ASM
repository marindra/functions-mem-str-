.model tiny
.code
locals @@
org 100h

Start:		mov al, '9'
		mov bx, offset Msg

		call strchr
		Ret

Msg:		db '123456890', 00h

;-------------------------------------------------
;Enter:		al - symbol, which we try to find
;		bx - address of line, in which we find
;Result:	bx - address of first symbol in line, which we find
;			or 0h, if there is no such symbol in line
;-------------------------------------------------
strchr		proc

		cmp byte ptr [bx], 00h
		je @@Hlp
		cmp byte ptr [bx], al
		je @@Find
		inc bx
		jmp strchr

@@Hlp:		mov bx, 00h
@@Find:		Ret
		endp
end		Start