segment .data
    msg db 'Hello x86',10
     
segment .text
global main
main :
    mov eax,4    ; write
    mov ebx,1    ; stdout
    mov ecx,msg
    mov edx,10   ; len
    int 80h
 
;exit(0)
mov eax, 1
mov ebx, 40
int 80h
