;Sum of first 5 numbers
.model small
.stack 100h
.data
msg db 'Sum = $'
newline db 13,10,'$'
r db ?
.code
main:
    mov ax, @data
    mov ds, ax

    mov cl, 5      
    mov bl, 1      
    mov al, 0      

	sum_loop:
		add al, bl     
		inc bl         
    loop sum_loop  

    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov ah,00
    mov bl, 10      
    div bl          
    mov r,ah            
    mov dl,al
	add dl,48
    mov ah, 02h
    int 21h

    mov dl, r      
    add dl, 48     
    mov ah, 02h
    int 21h

    mov dx, offset newline
    mov ah, 09h
    int 21h

mov ax, 4c00h
int 21h
end main
