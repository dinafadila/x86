extern printf
extern fflush
extern scanf
      
section .data
    input db "%f %f", 0
    output db "%f", 10, 0
          
section .bss
    satu resd 1		;bil1
    dua resd 1		;bil2
    result resd 1		;resultakhir
    result1 resd 1	;result kuadrat bil1
    result2 resd 1	;result kuadrat bil2
     
section .text
    global main
          
main:
    push dua			;scanf("%f %f",&satu,&dua)
    push satu
    push input
    call scanf
     
    fld dword[satu]		;satu masuk sto
    fld dword[satu]		;satu masuk st1
    fmulp				;ngaliin sto*st1
    fstp dword[result1]       ;copy atau pop hasilnya ke result1
     
    fld dword[dua]            ;dua masuk sto
    fld dword[dua]            ;dua masuk st1
    fmulp                     ;ngaliin sti*st1
    fstp dword[result2]       
     
    fld dword[result1]  ;diload ke sto
    fld dword[result2]  ;diload ke st1
    faddp               ;nambahin sto dan st1,hasilnya disimpan kembali ke ST0
     
    fsqrt                    ;Menghitung akar kuadrat dari ST0, hasilnya disimpan kembali ke ST0
    fstp qword[result]
     
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
