;write an Assembly program to input three marks,
;calculate the average,
;and print if the student passed (average >= 50).


.model small
.stack 100h
.data
    msg1 db 'Enter Mark 1: $'
    msg2 db 'Enter Mark 2: $'
    msg3 db 'Enter Mark 3: $'
    msgPass db 10, 'Student Passed$'
    msgFail db 10, 'Student Failed$'

    m1 db 0
    m1t db 0
    m1o db 0
    m2 db 0
	m2t db 0
	m2o db 0
	m3 db 0
	m3t db 0
	m3o db 0
	total db 0
	avg db 0

.code
start:
    mov ax, @data
    mov ds, ax

    ;get mark1
    mov dx, offset msg1
    mov ah, 09h
    int 21h
	
	;read 1st digit
	mov ah,01h	;5+48=53
	int 21h
	
	sub al,48	;al=53 al=al-48=5
	mov m1t,al	;al=m1t=5
	
	;read 2nd digit
	mov ah,01h	;6+48=54
	int 21h
	
	sub al,48
	mov m1o,al	;m1o=6
	
	mov bl,10	;bl=10
	mov al,m1t	;al=5
	mul bl	;al=al*bl=50
	add al,m1o	;56
	mov m1,al	;m1=56
	
	;nextline
	mov dl,10	
	mov ah,02h
	int 21h
	
	;get mark2
    mov dx, offset msg2
    mov ah, 09h
    int 21h
	
	;read 1st digit
	mov ah,01h
	int 21h
	
	sub al,48
	mov m2t,al
	
	;read 2nd digit
	mov ah,01h
	int 21h
	
	sub al,48
	mov m2o,al
	
	mov bl,10
	mov al,m2t
	mul bl
	add al,m2o
	mov m2,al
	
	;nextline
	mov dl,10	
	mov ah,02h
	int 21h
	
	;get mark3
    mov dx, offset msg1
    mov ah, 09h
    int 21h
	
	;read 1st digit
	mov ah,01h
	int 21h
	
	sub al,48
	mov m3t,al
	
	;read 2nd digit
	mov ah,01h
	int 21h
	
	sub al,48
	mov m3o,al
	
	mov bl,10
	mov al,m3t
	mul bl
	add al,m3o
	mov m3,al
	
	;calc 3 mark total
	mov al,m1	;al=m1=56
	add al,m2	;
	add al,m3
	mov total,al
	
	;calc avg
	mov al,total
	mov bl,3
	div bl
	mov avg,al
	
	;compare 
	cmp al,50
	jl FAIL
	
	PASS:
		mov dx,offset msgPass
		mov ah,09h
		int 21h
		jmp EXIT
		
	FAIL:
		mov dx,offset msgFail
		mov ah,09h
		int 21h
	
	EXIT:
		mov ax,4c00h
		int 21h
	
end start
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
