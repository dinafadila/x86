;---------------------test iq--------------------------
extern scanf
extern printf
extern fflush               
 
section .data
    input db "%d", 0
    dav db "Davinchi", 10, 0   ;new line
    hab db "Habibi",10,0
    nor db "Normies",10,0
    wib db "Wibu",10,0
    sep db "IQ apa nomor sepatu",10,0
    
    
 
section .bss
    a resd 1                ;declare variable
 
section .text
    global main
 
main:
    push a                  ;scanf("%d %d", &a, &b), kalo asm emang scanfnya kebolak
    push input              ;"%d"
    call scanf              ;panggil scanf
    add esp, 8              ;4 dikali dengan banyaknya push(ada 3) ;reason dikali 4? karena untuk bytes
	
	mov eax, [a]
	cmp eax, 201
	jae dav1

	cmp eax, 151
	jae hab1
	
	cmp eax, 101
	jae nor1
	
	cmp eax, 51
	jae wib1

	cmp eax, 0
	jae sep1

 
dav1:
    push dav                ;print eax            ;"%d"
    call printf             ;panggil printf
    add esp, 4              ;4 dikali dengan banyaknya push(ada 2) ;reason dikali 4?karena untuk bytes
    JMP exit
    
hab1:
    push hab                ;print eax             ;"%d"
    call printf             ;panggil printf
    add esp, 4
    JMP exit
    
nor1:
    push nor               ;print eax           ;"%d"
    call printf             ;panggil printf
    add esp,4 
    JMP exit

wib1:
	push wib                ;print eax            ;"%d"
    call printf             ;panggil printf
    add esp, 4
    JMP exit

sep1:
	push sep               ;print eax            ;"%d"
    call printf             ;panggil printf
    add esp, 4
    JMP exit

exit:
    push 0
    call fflush
    add esp,4
 
    mov eax, 1
    mov ebx, 0
    int 0x80
    
 ;---------------------ganjil genap---------------------
 
extern scanf
extern printf
extern fflush               
 
section .data
    input db "%d", 0
    x db 2
    GNP db "GENAP", 10,0
    GJL db "GANJIL",10,0
 
section .bss
    a resd 1                ;declare variable
 
section .text
    global main
 
main:
    push a                  ;scanf("%d %d", &a, &b), kalo asm emang scanfnya kebolak
    push input              ;"%d"
    call scanf              ;panggil scanf
    add esp, 8              ;4 dikali dengan banyaknya push(ada 3) ;reason dikali 4? karena untuk bytes
	
	mov eax, [a]
	cdq
	div dword[x] 			;EDX=EAX%X, 
	cmp edx,0
	JE GNP1
	JNE GJL1

 
GNP1:
    push GNP                ;print eax            ;"%d"
    call printf             ;panggil printf
    add esp, 4              ;4 dikali dengan banyaknya push(ada 2) ;reason dikali 4?karena untuk bytes
    JMP exit
    
GJL1:
    push GJL                ;print eax             ;"%d"
    call printf             ;panggil printf
    add esp, 4
    JMP exit
   

exit:
    push 0
    call fflush
    add esp,4
 
    mov eax, 1
    mov ebx, 0
    int 0x80

;----------------prima tidak------------------;
extern scanf
extern printf
extern fflush               
 
section .data
    input db "%d", 0
    prima db "prima", 10,0
    tidak db "tidak",10,0
 
section .bss
    a resd 1                ;declare variable
 
section .text
    global main
 
main:
    push a                  ;scanf("%d %d", &a, &b), kalo asm emang scanfnya kebolak
    push input              ;"%d"
    call scanf              ;panggil scanf
    add esp, 8              ;4 dikali dengan banyaknya push(ada 3) ;reason dikali 4? karena untuk bytes
	
	mov ebx, [a]
	sub ebx,1 ;batas akhir
	mov ecx,1	; batas awal
	
	cek:
	cmp ebx,ecx
	JE prim
	cdq
	div ecx 			;EDX=EAX%X, 
	cmp eax,0
	inc ecx
	JMP tida
	loop cek

prim:
    push prima               ;print eax            ;"%d"
    call printf             ;panggil printf
    add esp, 4              ;4 dikali dengan banyaknya push(ada 2) ;reason dikali 4?karena untuk bytes
    JMP exit
    
tida:
    push tidak              ;print eax             ;"%d"
    call printf             ;panggil printf
    add esp, 4
    JMP exit
   

exit:
    push 0
    call fflush
    add esp,4
 
    mov eax, 1
    mov ebx, 0
    int 0x80


