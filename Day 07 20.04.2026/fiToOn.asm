;Print numbers from 5 to 1 using a loop.
.model small
.stack 100h
.data
    s db ' $'      

.code
main:
    mov ax, @data     
    mov ds, ax

    mov cl, 5	; loop count 5
    mov bl, 5	; start 1

print_loop:
    mov dl, bl
    add dl, 48   
	mov ah,02h	
    int 21h            

    mov dx, offset s
    mov ah, 09h        
    int 21h            

    dec bl  ;decrease number       
    loop print_loop   ;repeat until cl=0

    mov ax, 4c00h
    int 21h
end main
