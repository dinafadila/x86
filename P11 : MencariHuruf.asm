extern printf
extern fflush
extern scanf
     
section .data
    input db "%s %s", 0
    fmtprint db "%d", 10, 0
    no db "tidak ada", 10, 0
    
         
section .bss
	string1 resb 51		;panjang string ditambah nul
	cari resb 2			;panjang string yg dicari ditambah nul
        
section .text
    global main
         
main:
	cld					;biar ngebaca string dari depan
	push cari		
	push string1
	push input
	call scanf
	
	mov ecx, 50			;buat menyimpan counter
	mov edi, str1		;
	mov al, [cari]		;
	repne scasb			;
	
	
	mov eax, 50
	sub eax, ecx
	mov ebx, 0
	cmp ecx, ebx
	je langsung
	
	push eax
	push fmtprint
	call printf
	jmp exit

langsung:
	push no
	call printf
	jmp exit
	
exit:
	push 0
	call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
