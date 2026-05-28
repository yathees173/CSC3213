.model small
.stack 100h
.data
    msg db '* $'            ; Star to print
    newline db 13, 10, '$'  ; DOS-style newline (\r\n)
    n db 10                  ; Number of rows
.code
start:
    mov ax, @data
    mov ds, ax

    
    mov cl, n               ; total number of rows
    mov si,0              	; row counter (SI = 0 initially)

row_loop:
    inc si                  ; SI = current row number (1-based)
    mov di, si              ; DI = number of stars to print in this row

	print_stars:
		mov dx, offset msg
		mov ah, 09h             ; DOS print string function
		int 21h
		dec di
	jnz print_stars         ; jump not zero to print_star

    ; print newline
    mov dx, offset newline
    mov ah, 09h
    int 21h
loop row_loop           ; loop Cl times

exit_program:
    mov ax, 4C00h
    int 21h
end start
