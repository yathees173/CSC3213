;loop
.model small
.stack 100h
.data
  msg db "Hello world $"
  n db 5
.code

start:
  mov ax,@data
  mov ds,ax
  
  mov cl,n	 ;using the count register cl and moving n to cl
  lstart:	;label
	  mov dx,offset msg 
	  mov ah,09h
	  int 21h
	  
	  mov dl,10
	  mov ah,02h
	  int 21h
  loop lstart ; looping back to start, automatically dec cl
  
  mov ax,4c00h
  int 21h
  
  end start