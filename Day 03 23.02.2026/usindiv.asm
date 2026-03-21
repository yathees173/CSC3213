.model small	
.stack 100h
.data
msg1 db "Enter the first single digit numbers: $"
msg2 db "Enter the second single digit numbers: $"
msg3 db "Division value is: $"
msg4 db "Remainder value is: $"
n1 db 0
n2 db 0
n3 db 0

.code
start:
mov ax,@data	
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

mov ah,01h	;01h keyboard function
int 21h
sub al,48	
mov n1,al

mov dl,10	
mov ah,02h
int 21h

mov dx,offset msg2
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,48
mov n2,al

mov dl,10	
mov ah,02h
int 21h

mov dx,offset msg3
mov ah,09h
int 21h
mov ah,00	
mov al,n1
div n2
mov n3,ah
mov dl,al
add dl,48	
mov ah,02h	
int 21h

mov dl,10	
mov ah,02h
int 21h
;remainder
mov dx,offset msg4
mov ah,09h
int 21h
mov dl,n3
add dl,48	
mov ah,02h	
int 21h

mov ax,4c00h
int 21h
end start

