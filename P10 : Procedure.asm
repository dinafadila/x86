global main
extern scanf, printf, fflush

section .data
    output     db      '%d', 10, 0
    input 		db 		'%d', 0

section .bss
	a resd 4
	
section .text
	global main

    pow:
                push    ebp                     ; save old ebp
                mov     ebp, esp                ; this new ebp (as reference to parameter and local variable)
                
                mov     eax, [ebp+8]            ; eax = a
                mul     dword [ebp+8]      		; eax = eax * a
                
                push    eax                     ; printf("%d\n", eax)
                push    output
                call    printf
                add     esp, 8
                
                mov     esp, ebp                ; deallocate local variables
                pop     ebp                     ; restore old ebp
                ret

    main:
                push   	a
                push	input                 
                call 	scanf
                add 	esp, 8
                
                mov 	ecx, [a]
				        cmp 	ecx, 0   
				        je 		exit
                
                push 	dword[a]
                call    pow                   
                add     esp, 4
                
                mov 	esi, dword[a]	;check apakah 0 ?
                cmp  	esi, 0
				        je 		exit
                jmp   main
                
                
exit:
				push 0
				call fflush
				mov eax, 1
				mov ebx, 0
				int 0x80

