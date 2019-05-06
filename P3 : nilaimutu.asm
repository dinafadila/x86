global main
extern printf, scanf, fflush 
  
section .data ;variable yang dideklarasiin
    nilai db "%d %d %d %d",0
    x dd 4 ; kalo nilai pakenya dd
    A db "A",10,0
    B db "B",10,0 ;10,0 new line
    C db "C",10,0
    D db "D",10,0
    E db "E",10,0
      
section .bss ;variabel yang bakal di scanf
    a resd 1
    b resd 1
    c resd 1
    d resd 1
      
section .text
	global main ;bakal ngeeksekusi label main


main :
;eax,ebx,ecx,edx,cdi,
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
      
    mov ebx,80
    cmp eax,ebx
    JAE L1 
    
    mov ebx,60
    cmp eax,ebx
    JAE L2
    
    mov ebx,50
    cmp eax,ebx
    JAE L3
    
    mov ebx,40
	cmp eax,ebx
	JAE L4
	
	mov ebx,0
	cmp eax,ebx
	JAE L5    
            		 
    L1:
		push A
		call printf
		add esp,4
		JMP exit 
	
	 
	L2: 
		push B
		call printf
		add esp,4
		JMP exit 
		
		
	L3:
		push C
		call printf
		add esp,4
		JMP exit
			
		
	L4:
		push D
		call printf
		add esp,4
		JMP exit

	
		
	L5:
		push E
		call printf
		add esp ,4
		JMP exit
			
      
    exit:
    push 0
    call fflush
    add esp, 4
    mov eax, 1
    mov ebx, 0
    int 0x80

