global main
extern printf, scanf, fflush
  
section .data
    nilai db "%d %d %d %d",0
    lulus db "lulus",10,0
    tidak db "tidak",10,0
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
      
    mov ebx,40   ; masukin nilai 40 ke ebx
    cmp eax,ebx	 ; membandingkan ebx dan eax
    JAE L1       ; lebih besar sama dengan
    JB L2		 ; lebih kecil
    
    L1:
		push lulus ; kalo lebih dari 40 ngeprint lulus
		call printf
		add esp,4
		JMP exit ; biar abis udah jalanin L1 dia langsung ke exit gak ke L2
	
	L2:
		push tidak
		call printf
		add esp,4 ; L2 gak butuh exit soalnya dibawahnya udah langsung exit
      
      
    exit:
    push 0
    call fflush
    add esp, 4
    mov eax, 1
    mov ebx, 0
    int 0x80
