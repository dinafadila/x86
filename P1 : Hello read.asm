segment .data
    msg db 'Hello '
    input
     
segment .text
global main
main :
    mov eax,3    ; read
    mov ebx,0    ; stdin
    mov ecx,input
    mov edx,10   ; len
    int 0x80
 
 
    mov eax,4    ; write
    mov ebx,1    ; stdout
    mov ecx,msg
    mov edx,10   ; len
    int 80h
 
;exit(0)
mov eax, 1
mov ebx, 40
int 80h
