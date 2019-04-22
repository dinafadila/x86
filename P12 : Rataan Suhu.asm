extern printf
extern fflush
extern scanf
       
section .data
    input db "%f", 0
    banyak db "%d", 0
    output db "%.1f", 10, 0
    sum dq 0.0       
           
section .bss
	n resd 1
	bil resd 1
	result resd 1
      
section .text
    global main
           
main:
	push n			;buat baca banyaknya bilangan
    	push banyak
    	call scanf
    
   	mov edi, [n]	
	fld qword[sum]		;buat sum=0, masuk st0
	
.loop:
	push bil		;baca terus bilangannya sampai 3 kali
	push input
	call scanf
	add esp, 8
	
	fadd dword[bil]		;nambah bilangan st0 + st1, sum=sum+bil; hasilnya ke st0
	
	sub edi, 1		;buat ngurangin edi
	cmp edi, 0
	jne .loop		;kalo edinya belom 0 balik ke .loop


	fidiv dword[n]		;Membagi ST0 dengan integer pada memori, hasilnya disimpan ke ST0
	fst qword[result]
	
	push dword[result+4]
	push dword[result]
	push output
	call printf

exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
