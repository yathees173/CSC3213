.model small	
.stack 100h

.data
msg5 db "Num 1 is: $"
msg6 db "Num 2 is: $"
msg1 db "Addition of num1 and num2: $" ;$:understand the string part is end
msg2 db "Subraction of num2 and num1: $"
msg3 db "Multiplication of num1 and num2: $"
msg4 db "Division of num2 and num1: $"
msg db ",rem: $"
n1 db 2
n2 db 3
n3 db 0

.code
start:
mov ax,@data
mov ds,ax

mov dx,offset msg5
mov ah,09h
int 21h
mov dl,n1
add dl,48
mov ah,02h
int 21h

;next line
mov dl,10	
mov ah,02h
int 21h

mov dx,offset msg6
mov ah,09h
int 21h
mov dl,n2
add dl,48
mov ah,02h
int 21h
;next line
mov dl,10	
mov ah,02h
int 21h

;addition
mov dx,offset msg1
mov ah,09h
int 21h
mov dl,n1	;dl=2
add dl,n2
add dl,48	;dl=dl+48=50
mov ah,02h	;ah:functiom register
int 21h

;next line
mov dl,10	
mov ah,02h
int 21h

;Substraction
mov dx,offset msg2
mov ah,09h
int 21h
mov dl,n2	;dl=2
sub dl,n1
add dl,48	;dl=dl+48=50
mov ah,02h	;ah:functiom register
int 21h
;next line
mov dl,10	
mov ah,02h
int 21h

;Multiplication
mov dx,offset msg3
mov ah,09h
int 21h
mov al,n1	;dl=2
mul n2
mov dl,al
add dl,48	;dl=dl+48=50
mov ah,02h	;ah:functiom register
int 21h
;next line
mov dl,10	
mov ah,02h
int 21h

;Division
mov dx,offset msg4
mov ah,09h
int 21h
mov ah,00	;dl=2
mov al,n2
div n1
mov n3,ah
mov dl,al
add dl,48	;dl=dl+48=50
mov ah,02h	;ah:functiom register
int 21h
;remainder
mov dx,offset msg
mov ah,09h
int 21h
mov dl,n3
add dl,48	
mov ah,02h	
int 21h
;next line
mov dl,10	
mov ah,02h
int 21h

mov ax,4c00h
int 21h
end start