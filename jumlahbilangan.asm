n fflush
 
segment .data
    nilai db "%d",0
    hasil db "%d",0xa,0
     
segment .bss
    a resd 1
     
segment .text
global main
main:
    push a ;5
    push nilai
    call scanf
    add esp,8
     
    mov ecx, [a] ;5
    mov eax, 0 ; sebagai sum=0 jadinya sum=sum+ecx
     
L1:
    add eax, ecx ; ecx sebagai i jadinya sum=sum+i
    loop L1 ;di looping sistemnya ngedecrement  0+5=5+4=9+3=12+2=14+1=15
     
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
