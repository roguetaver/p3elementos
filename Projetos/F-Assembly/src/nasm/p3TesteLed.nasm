; Testa escrita e leitura dos LEDs

  leaw $0, %A
  notw %A
  movw %A, %D

  leaw %21184, %A
  movw %D, (%A)
  nop

  movw (%A), %S

  leaw $0, %A
  movw %S, (%A)
