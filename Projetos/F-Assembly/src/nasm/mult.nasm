; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $0,%A
movw (%A), %D
leaw $4, %A
movw (%A), %S

loop:

	leaw $1,%A
	addw %S,(%A), %S
	decw %D
	
	leaw $END, %A
	je %D
	nop

	leaw $loop, %A
	jmp
	nop

END:
	
	leaw $3,%A
	movw %S,(%A)

