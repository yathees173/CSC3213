.model small	
.stack 100h
.data
msg1 db "Enter the first single digit numbers: $"
msg2 db "Enter the second single digit numbers: $"
msg3 db "Multiplication value is: $"
n1 db 0
n2 db 0
;n3 db ?

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
mov al,n1	
mul n2
mov dl,al
add dl,48	
mov ah,02h	
int 21h


mov ax,4c00h
int 21h
end start

