;jump function (n=5 Hai to Bye)

.model small
.stack 100h

.data
msg db "Enter a number : $"
msg1 db "Even Number",10,"$"
msg2 db "Odd Number",10,"$"
n1 db 2

.code 
start:
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov ah,01h ;5->5+48=53->al=53
int 21h

sub al,48 ;al=al-48=53-48=5
mov dl,n1    ;mov ah,00; mov bl,2; div bl; cmp ah,0
mov ah,00
div dl
mov al,ah
cmp al,0	;compare al=0

mov dl,10
mov ah,02h
int 21h

je Lb1yes	;jump equal, Label
jne Lb1no	;jump not equal

Lb1yes:
	mov dx,offset msg1
	mov ah,09h
	int 21h
	jmp Endnn	;exit
	
Lb1no:
	mov dx,offset msg2
	mov ah,09h
	int 21h

Endnn:	;exit 
	mov ax,4c00h
	int 21h
	
end start
