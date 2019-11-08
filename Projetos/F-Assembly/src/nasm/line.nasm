; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD
;  - Valide no hardawre
;  - Bata uma foto!


 leaw $0, %A
  movw %A, %D
  notw %D


  leaw $18794, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  
  leaw $18795, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  leaw $18796, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)

  leaw $18797, %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)
  incw %A
  movw %D, (%A)