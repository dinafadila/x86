global main
extern printf, scanf, fflush 
  
section .data ;variable yang dideklarasiin
    nilai db "%d",0
    kempes db "kempes",10,0
    pas db "pas",10,0 ;10,0 new line
    keras db "keras",10,0
      
section .bss ;variabel yang bakal di scanf
    a resd 1
      
section .text
	global main ;bakal ngeeksekusi label main


main :
    push a
    push nilai
    call scanf
    add esp, 20 ;5 kali push 5x4 = 20
      
    mov eax, [a]
      
    mov ebx,29   ; masukin nilai 40 ke ebx
    cmp eax,ebx	 ; membandingkan ebx dan eax
    JAE L1       ; lebih besar sama dengan
    JB L2		 ; lebih kecil
    
    L1:
		mov ebx,35   ; masukin nilai 40 ke ebx
		cmp eax,ebx	 ; membandingkan ebx dan eax
		JAE L3       ; lebih besar sama dengan
		JB L4		 ; lebih kecil
	
	L2:
		push kempes
		call printf
		add esp,4 ; L2 gak butuh exit soalnya dibawahnya udah langsung exit
		JMP exit
	
	L3:
		push keras
		call printf
		add esp,4 ; L2 gak butuh exit soalnya dibawahnya udah langsung exit
		JMP exit
	
	L4:
		push pas
		call printf
		add esp,4 ; L2 gak butuh exit soalnya dibawahnya udah langsung exit
		JMP exit
      
			
      
    exit:
    push 0
    call fflush
    add esp, 4
    mov eax, 1
    mov ebx, 0
    int 0x80
