; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
;  Encontra o resto da divisão entre RAM[2] e RAM[1] e o salva em RAM[0].



leaw $1, %A
movw (%A), %S
loop_div:
leaw $2, %A
subw %S, (%A), %S
leaw $loop_div, %A
jge %S
nop
leaw $2, %A
addw %S, (%A), %S
leaw $0, %A
movw %S, (%A)