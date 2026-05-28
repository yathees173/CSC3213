;print English alphabet Small Letters
;a to z
;a=97 z=122

.model small
.stack 100h
.data
	n1 db 97
	spa db " $"
.code 
start:
	mov ax,@data
	mov ds,ax
	
	mov cl,26
	mov bl,0
	
	losta:
		mov dl,n1
		add dl,bl
		mov ah,02h
		int 21h
		
		mov dx,offset spa
		mov ah,09h
		int 21h
		
		inc bl
	loop losta
		
	mov ax,4c00h
	int 21h
	
	end
	
	

