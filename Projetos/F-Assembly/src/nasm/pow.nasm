; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $1, %A 
movw (%A), %S 
movw %S, %D 
movw %D, %A 
decw %S
WHILE:
	leaw $1, %A
	addw %D, (%A), %D
	decw %S
	leaw %WHILE, %A
	jg %S
nop
leaw $0, %A
movw %D, (%A)