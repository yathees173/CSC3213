;Write an assembly program to compare two numbers
; Display the greater number

.model small
.stack 100h

.data
	msg1 db "Enter first number : $"
	msg2 db "Enter second number : $"
	msg  db "Greater number is : $"
	n1 db 0
	n2 db 0

.code 
start:
	mov ax,@data
	mov ds,ax

	;get num1
	mov dx,offset msg1
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h

	sub al,48
	mov n1,al

	; newline
	mov dl,10
	mov ah,02h
	int 21h

	;get num2
	mov dx,offset msg2
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h

	sub al,48
	mov n2,al

	; newline
	mov dl,10
	mov ah,02h
	int 21h

	;compare
	mov al,n1
	mov bl,n2

	cmp al,bl
	jge FG

	mov dx,offset msg
	mov ah,09h
	int 21h

	mov dl,n2
	add dl,48
	mov ah,02h
	int 21h
	jmp exit

	FG:
		mov dx,offset msg
		mov ah,09h
		int 21h

		mov dl,n1
		add dl,48
		mov ah,02h
		int 21h

	exit:
		mov ax,4c00h
		int 21h

end start
