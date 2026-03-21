.model small	
.stack 100h

.data
msg db "number is $" ;$:understand the string part is end
n1 db 2

.code
start:
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov dl,10	;next line
mov ah,02h
int 21h

mov dl,n1	;dl=2
add dl,48	;dl=dl+48=50
mov ah,02h	;ah:functiom register
int 21h

mov ax,4c00h
int 21h
end start