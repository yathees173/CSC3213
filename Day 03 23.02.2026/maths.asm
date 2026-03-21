.model small	
.stack 100h
.data
n1 db 2
n2 db 1
.code
start:
mov ax,@data	;ax is 16 bit register[ax=ah+al]
mov ds,ax

mov dl,n1	;dx=dh+dl
add dl,n2	;n1+n2
add dl,48	;ascii value dl=dl+48=3+48=51
mov ah,02h	
int 21h

mov ax,4c00h
int 21h
end start