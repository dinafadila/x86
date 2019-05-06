global main
extern printf, fflush
 
section .data
    msg db 'Hello world!', 10
   
section .text
 
main:
    push msg 
    call printf
    add esp, 4
     
    push 0
    call fflush
    add esp, 4
     
    ;exit
    mov eax,1
    mov ebx,0
    int 0x80
