; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

leaw $R1, %A
movw (%A), %D
leaw $R0, %A
movw (%A), %S
leaw $R2, %A
subw %D, %S, (%A)