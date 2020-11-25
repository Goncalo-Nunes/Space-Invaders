; PROJETO - VERSÃO FINAL

terminador  EQU 0
DEFINE_LINHA    EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    EQU 601AH     ; endereço do comando para escrever um pixel
DEFINE_VIDEO EQU 6048H
PLAY_VIDEO EQU 605AH
APAGA_ECRA     EQU 6000H     ; endere�o do comando para apagar todos os pixels do ecra selecionado
APAGA_ECRAS     EQU 6002H      ; endere�o do comando para apagar todos os pixels de todos os ecr�s
APAGA_AVISO     EQU 6040H      ; endere�o do comando para apagar o aviso de nenhum cen�rio selecionado
COR_CANETA EQU 6014h        ; endereço do comando para mudar a cor da caneta

MASCARA_INICIAL EQU 01H       ; mascara (0000 0001)
MASCARA_FINAL EQU 80H         ; mascara (1000 0000)

COL_MAX EQU 63
LIN_MAX EQU 31

LARGURA_NAVE EQU 5

VERDE EQU 0F0F0H
VERMELHO EQU 0FF00H
AMARELO EQU 0FFF0H


; *********************************************************************************
; * Objetos
; *********************************************************************************
PLACE 2000H

; NAVE
nave_pixeis:
  string 4h, 0Eh, 1Fh, 4h, 0Ah, terminador

nave_coordenadas:
  word 27               ; linha
  word 31               ; coluna

; ASTEROIDES
asteroide_3:
  string 2H, 7FH, 2FH, terminador

asteroide_4:
  string 6H, 0FH, 0FH, 6H, terminador

asteroide_5:
  string 0EH, 1FH, 1FH, 1FH, 0EH, terminador


; NAVE INIMIGA
nave_inimiga_3:
  string 5H, 2H, 5H, terminador

nave_inimiga_4:
  string 9H, 6H, 6H, 9H, terminador

nave_inimiga_5:
  string 11H, 0AH, 4H, 0AH, 11H, terminador

;EXPLOSAO
explosao:
  string 0AH, 15H, 0AH, 15H, 0AH, terminador




; *********************************************************************************
; Variaveis de estado
; *********************************************************************************

jogo: WORD 1            ; estado do jogo (-1 = por começar, 0 = pausa , 1 = a correr)

tecla_premida: WORD 1   ; tecla premida (-1 = nao houve tecla, (0-F) = tecla do teclado )


PLACE     1000H
pilha:    TABLE 100H          ; espa�o reservado para a pilha
                              ; (200H bytes, pois s�o 100H words)
SP_inicial:                   ; este � o endere�o (1200H) com que o SP deve ser
                              ; inicializado. O 1.� end. de retorno ser�
                              ; armazenado em 11FEH (1200H-2)

PLACE 0
inicio:
  MOV  SP, SP_inicial      ; inicializa SP para a palavra a seguir
                         ; � �ltima da pilha

  MOV R1, 0
  MOV  R0, APAGA_ECRAS
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)

  MOV  R0, APAGA_AVISO
  MOV  [R0], R1            ; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)

  MOV  R0, DEFINE_VIDEO
  MOV  [R0], R1            ; define o video a tocar

  MOV  R0, PLAY_VIDEO
  MOV  [R0], R1            ; Toca o video



ciclo:
  CALL teclado
  CALL nave
  JMP ciclo




teclado:
  RET


nave:
  PUSH R1
  MOV R1, jogo
  MOV R1, [R1]        ; le o estado do jogo
  CMP R1, 1           ; se o jogo nao estiver a correr saimos
  JNZ sair_nave
  ;CALL desenha_nave
  CALL movimenta_nave ; movimenta a nave
  CALL desenha_nave ; desenha a nave
sair_nave:
  POP R1
  RET



movimenta_nave:
  PUSH R2
  PUSH R5
  PUSH R6
  PUSH R7
  MOV R2, tecla_premida
  MOV R2, [R2]      ; verifica a tecla premida
  CMP R2, 0         ; se a tecla pressionada for a tecla 0 entao movimentamos a nave para a esquerda
  JZ movimenta_nave_esquerda
  CMP R2, 2         ; se a tecla pressionada for a tecla 2 entao movimentamos a nave para a esquerda
  JZ movimenta_nave_direita
  JMP sair_movimenta_nave ; sair da rotina
movimenta_nave_esquerda:
  MOV R7, 0             ; limite esquerdo do ecra (coluna 0)
  MOV R5, nave_coordenadas
  MOV R6, [R5 + 2]      ; obter as coordenadas da nave
  CMP R6, R7            ; limitar o movimento da nave no lado esquerdo do ecra
  JLE sair_movimenta_nave
  SUB R6, 1             ; subtrair uma coluna à posicao atual
  JMP altera_posicao
movimenta_nave_direita:
  MOV R7, COL_MAX       ; limite direito do ecra (coluna 63)
  SUB R7, LARGURA_NAVE           ; subtrair a largura da nave
  MOV R5, nave_coordenadas
  MOV R6, [R5 + 2]
  CMP R6, R7          ;limitar o movimento da nave no lado direito do ecra
  JGT sair_movimenta_nave
  ADD R6, 1   ; adicionar uma coluna à posicao atual
  JMP altera_posicao
altera_posicao:
  MOV [R5 + 2], R6  ; escreve a nova posicao na memoria
  CALL apagar_ecra  ;apaga o ecra para dar lugar ao objeto desenhado na nova posicao
sair_movimenta_nave:
  POP R7
  POP R6
  POP R5
  POP R2
  RET







desenha_nave:
  PUSH R1
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R11
  MOV R5, nave_coordenadas
  MOV R3, [R5]          ; coordenada X
  MOV R4, [R5 + 2]         ; coordenada Y
  MOV R1, nave_pixeis
  MOV R11, LARGURA_NAVE        ; largura da nave
  CALL desenha_objeto ; desenhar objeto
  POP R11
  POP R5
  POP R4
  POP R3
  POP R1






; **********************************************************************
; DESENHA_OBJETO - Desenha qualquer objeto no ecrâ
;
; Argumentos:   R3 - Coordenada X
;               R4 - Coordenada Y
;               R7 - largura
;               R1- Base da tabela do objeto
; **********************************************************************
desenha_objeto:
  PUSH R2
  PUSH R10
  PUSH R11
le_elemento:
  MOVB R2, [R1]           ; ler elemento da string
  CMP R2, terminador      ; verificar se já chegamos ao fim da tabela
  JZ sair_desenha_objeto              ; se sim, saimos da rotina
  CALL desenha_linha      ; desenha a linha lida da tabela
  ADD R1,1                ; proximo elemento da string
  JMP le_elemento    ; repetir até chegar ao fim da tabela
sair_desenha_objeto:
  POP R11
  POP R10
  POP R2
  RET


; **********************************************************************
; DESENHA_LINHA - Processa cada linha do objeto a ser desenhado
;
; Argumentos:   R3 - Coordenada X (linhas)
;               R4 - Coordenada Y (colunas)
;               R11 - largura do objeto
;               R2- Linha a desenhar
; **********************************************************************
desenha_linha:
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9
  PUSH R11

  MOV R9, R4  ; variavel auxiliar com o valor da largura
  MOV R7, MASCARA_INICIAL ; inicializa a mascara (0000 0001)
  MOV R8, 0 ;
le_bit:
  CMP R11,0
  JZ sair_desenha_linha
  MOV R6, R2        ; variavel auxiliar com o valor lido da tabela
  CMP R6, R8        ; se é 0, saimos
  JZ sair_desenha_linha
  AND R6, R7        ; aplicar a mascara
  CALL desenha_pixel
  SHL R7, 1
  SUB R11, 1        ; subtrair 1
  JMP le_bit
sair_desenha_linha:
  ADD R3,1  ; proxima linha
  MOV R10, R4

  POP R11
  POP R9
  POP R8
  POP R7
  POP R6
  RET



; **********************************************************************
; DESENHA_PIXEL - Desenha um pixel
;
; Argumentos:   R3 - Coordenada X (linha)
;               R9 - Coordenada Y (coluna)
;               R6-  0 pixel apagado, 1 pixel acesso
; **********************************************************************
desenha_pixel:
      PUSH  R0

      MOV R10, 0
      CMP R6, R10
      JZ desenha
      MOV R6, 1
desenha:
      MOV  R0, DEFINE_LINHA
      MOV  [R0], R3           ; seleciona a linha

      MOV  R0, DEFINE_COLUNA
      MOV  [R0], R9           ; seleciona a coluna

      MOV  R0, DEFINE_PIXEL
      MOV  [R0], R6           ; escreve o pixel com a cor da caneta na linha e coluna selecionadas

      ADD R9, 1 ; proxima coluna


      POP  R0
      RET



apagar_ecra:
  PUSH R0
  PUSH R1
  MOV R1, 1
  MOV  R0, APAGA_ECRA
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)
  POP R1
  POP R0
  RET
