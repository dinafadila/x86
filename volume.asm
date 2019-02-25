extern scanf
extern printf
extern fflush

segment .data
	nilai db "%d %d %d",0
	hasil db "%d",0xa,0
	
segment .bss
	p resd 1
	l resd 1
	t resd 1
	
segment .text
global main
main:
	push p ;5
	push l
	push t
	push nilai
	call scanf
	add esp,8
	
	mov eax, [p]
	mov ebx, [l]
	mov ecx, [t]
	
	mul ebx ;kenapa mulai dari ebx soalnya mul itu otomatis mulai dari eax dan disimpan di eax
	mul ecx

print:
	push eax
	push hasil
	call printf
	add esp, 8

exit:
	push 0
    call fflush
    add esp,4
 
    mov eax, 1
    mov ebx, 0 
    int 0x80
