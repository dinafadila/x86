global main

section .data
											;shrib.com/astagangeshrib
											;buat file test.txt dahulu, isinya bebas
											;contoh : DEF
											;setelah dirun, nanti file test.txt menjadi
											;DEF
											;HELLO
	filename	db	"test.txt", 0
	hello		db 	"HELLO", 10, 0
	
section .bss
	fileno			resd	1
	buffer		resb	10

section .text

	main:
			; open(filename, flags)
			mov		eax, 5          ; nomor syscall open
			mov		ebx, filename   ; nama file
			mov		ecx, 2			; O_RDWR
			int		0x80
			
			mov		[fileno], eax	; simpan hasil return
			
			; read(fd, buffer, count)
			mov		eax, 3			; nomor syscall read
			mov		ebx, [fileno]	; manggil hasil return
			mov		ecx, buffer		; menentukan pointer input
			mov		edx, 4			; batas ukuran karakter yang dibaca
			int		0x80
			
			; update (append) file
			mov 	eax, 4			; nomor syscall update
			mov		ebx, [fileno]	; menaruh hasil update di alamat hasil return yg awal
			mov		ecx, hello		; mengupdate test.txt dengan tambahan tulisan hello
			mov 	edx, 6			; batas ukuran karakter yg diupdate
			int 	0x80
			
			; fork()
			mov 	eax, 2			; membuat duplikasi proses
			int		0x80
			
			mov 	eax, 2			; sama, jadi duplikasi secara 2 kali berturut2
			int		0x80
			
			; write(fd, buffer, count)
			mov 	eax, 4			; manggil syscall write
			mov		ebx, 1			; menaruh hasil update di terminal (1 = stdout, 0 = stdin, 2 = stderr)
			mov		ecx, buffer		; menentukan pointer awal mulai
			mov 	edx, 4			; batas ukuran karakter yang ditulis
			int 	0x80
			
			; close(fd)
			mov		eax, 6			; manggil syscall close
			mov		ebx, [fileno]	; alamat yang mau diclose
			int		0x80
			
			; exit(0)
			mov 	eax, 1			; manggil syscall exit
			mov		ebx, 0			; menunjukkan return zero (return (0))
			int		0x80
			
