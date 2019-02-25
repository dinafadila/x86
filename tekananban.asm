extern printf
extern fflush
extern scanf
 
section .data
    input db "%d", 0
    out1 db "kempes", 10, 0
    out2 db "pas", 10, 0
    out3 db "keras", 10, 0
     
section .bss
	a resd 1

section .text
    global main
     
main:
    push a
    push input
    call scanf
    add esp, 8
    
    mov eax, [a]
    
    cmp eax, 29
    jb kempes
    
    cmp eax, 35
    jbe pas
    
    jmp keras
    
kempes:
    push out1
    call printf
    add esp, 8
    jmp exit

pas:
	push out2
	call printf
	add esp, 8
	jmp exit
	
keras:
	push out3
	call printf
	add esp,8
    
     
exit:
	push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
