global main
extern printf, scanf, fflush
  
section .data
    nilai db "%d %d %d %d",0
    hasil db "%d", 10,0;
    x db 4
      
section .bss
    a resd 1
    b resd 1
    c resd 1
    d resd 1
      
section .text
main :
    push a
    push b
    push c
    push d
    push nilai
    call scanf
    add esp, 20 ;5 kali push 5x4 = 20
      
    mov eax, [a]
    add eax, [b]
    add eax, [c]
    add eax, [d]
                       
    cdq                          
    div dword [x]
    push eax
      
    push hasil
    call printf
    add esp,8
      
    push 0
    call fflush
    add esp,4
      
    ;exit
    mov eax, 1
    mov ebx, 0
    int 0x80
