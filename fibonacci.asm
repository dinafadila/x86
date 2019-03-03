
;panggil bantuan bahasa C (scanf, printf, fflush)
extern scanf
extern printf
extern fflush               ;untuk menyimpan nilai sementara

section .data
	input db "%d", 0
	output db "%d", 10, 0   ;new line

section .bss
    a resd 1	            ;declare variable

section .text
	global main

main:
    push a			        ;scanf("%d %d", &a, &b), kalo asm emang scanfnya kebolak
    push input 	            ;"%d"
    call scanf 	            ;panggil scanf
    add esp, 8          	;4 dikali dengan banyaknya push(ada 3) ;reason dikali 4? karena untuk bytes

    mov eax, 0
    mov ebx, 1
    mov ecx, [a]
    mov edx, 0

 LOP:
    mov edx, 0
    add edx,eax
    add edx,ebx

    mov eax,ebx
    mov ebx,edx
    loop LOP


 ;output
    push eax  		        ;print eax
    push output	            ;"%d"
    call printf         	;panggil printf
    add esp, 8 	            ;4 dikali dengan banyaknya push(ada 2) ;reason dikali 4?karena untuk bytes

exit:
    push 0			        ;fungsi exit buat ngebersihin
    call fflush
    ;return 0
    mov eax, 1
    mov ebx, 0
    int 0x80


