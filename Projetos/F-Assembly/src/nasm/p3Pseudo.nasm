;---------------------------------------------------------
; Transcreva o pseudocódigo a seguir para assembly do Z01.1:
;
; WHILE(True):
;    if ( RAM[1] == 1 && RAM[2] == 2 ):
;        RAM[5] = 1
;    else
;        RAM5[5] = !RAM[1]
;
;---------------------------------------------------------


WHILE:
leaw $1 ,%A
movw %A , %D
subw (%A) , %D , %S
leaw $IF1 , %A
je %S
nop
ELSE:
leaw $1 , %A
movw (%A) , %D
notw %D
leaw $5, %A
movw %D, (%A)
leaw $LOOP , %A
jmp
nop
IF1:
leaw $2 , %A
movw %A ,%D
subw (%A) , %D , %S
leaw $IF2 , %A
je %S
nop
leaw $ELSE, %A
jmp
nop
LOOP:
leaw $WHILE , %A
jmp
nop
IF2:
leaw $1 , %A
movw %A, %D
leaw $5, %A
movw %D , (%A)
leaw $WHILE , %A
jmp
nop

