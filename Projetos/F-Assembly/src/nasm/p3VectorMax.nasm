;
; Buscar pelo valor máximo de um vetor e atualizar a RAM 2 com ele
;
; Assuma que:
;    - O endereço 0 da RAM indica a posição inicial de um vetor
;    - O endereço 1 da RAM indica o tamanho do vetor
;    - O vetor é uma região contínua da RAM
;
; Exemplo:
;
;      ----x  RAM[ 0] : 4
;      |      RAM[ 1] : 5   x----
;  comeco     RAM[ 2] : MAX     |
;      |      RAM[ 3] : 1       |
;      -----> RAM[ 4] : 15   ---|---
;             RAM[ 5] : 11      |
;             RAM[ 6] : 15      | Tamanho do vetor = 5
;             RAM[ 7] : 20      |
;             RAM[ 8] : 12   ---|---
;             RAM[ 9] : 0
;             RAM[10] : 11
;             RAM[11] : 2
;===============================================

