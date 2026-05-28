;print fibonnachi series
;f0=0, f1=1
;fn =fn-1+fn-2

.model small
.stack 100h
.data
	m db " $"
	n db 0
	n1 db 0
	n2 db 1
	r db 0		
.code
start:
	mov ax,@data 
	mov ds,ax
	
	mov dl,n1
	call intt
	
	mov dx,offset m
	mov ah,09h
	int 21h
	
	mov dl,n2
	call intt
	
	mov dx,offset m
	mov ah,09h
	int 21h
	
	mov cl,10
	mov al,0
	mov bl,1
	
	lsta:
		mov dl,al
		add dl,bl
		mov n,dl
		
		cmp dl,10
		jge tens
		
		call intt
		jmp next
		
		tens:
			cmp dl,100
			mov ah,00
			mov al,dl
			mov dl,10
			div dl
			mov r,ah
			mov dl,al
			call intt 
		
			mov dl,r
			call intt
		
		next:
			mov al,bl
			mov bl,n
			
			mov dx,offset m
			mov ah,09h
			int 21h	
		
	loop lsta
	
	mov ax,4c00h
	int 21h
	
	proc intt
		add dl,48
		mov ah,02h
		int 21h
	ret
	endp

end start