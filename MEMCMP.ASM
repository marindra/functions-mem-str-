.model tiny
.code
org 100h

Start:		mov si, offset Msg1
		mov di, offset Msg2
		mov cx, 6d
		mov ax, ds
		mov es, ax

		call memcmp

		Ret

Msg1:		db 'ABCbbc$'
Msg2:		db 'ABCABC$'

;-------------------------------------------------
;Enter:		si - address of beginning of Msg1
;		di - address of beginning of Msg2
;		es - segment, where Msg2 is
;		cx - count of numbers, which we  will compare
;Return		al - say which line is bigger. It is
;			difference between last symbols in lines or
;			first different symbols. If first line is bigger
;			al will be > 0
;		df = 0
;Destroy	si, di
;-------------------------------------------------
memcmp		proc

		cld
		repe cmpsb
		dec si
		dec di
		
		mov al, byte ptr [si]
		sub al, byte ptr [di]
		Ret
		endp

end		Start