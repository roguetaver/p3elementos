; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD
;  - Valide no hardawre
;  - Bata uma foto!

leaw $0, %A
movw %A, %D
notw %D
movw %D, (%A)


leaw $17405, $A
movw %D, (%A)


leaw $17425, $A
movw %D, (%A)


leaw $17445, $A
movw %D, (%A)


leaw $17465, $A
movw %D, (%A)


leaw $17485, $A
movw %D, (%A)


leaw $17505, $A
movw %D, (%A)


leaw $17525, $A
movw %D, (%A)


leaw $17545, $A
movw %D, (%A)


leaw $17565, $A
movw %D, (%A)


leaw $17585, $A
movw %D, (%A)


leaw $17605, $A
movw %D, (%A)


leaw $17625, $A
movw %D, (%A)


leaw $17645, $A
movw %D, (%A)


leaw $17665, $A
movw %D, (%A)


leaw $17685, $A
movw %D, (%A)


leaw $17705, $A
movw %D, (%A)