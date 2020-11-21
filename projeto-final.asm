; PROJETO - VERSÃO FINAL



terminador  EQU 0
DEFINE_LINHA    EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    EQU 601AH     ; endereço do comando para escrever um pixel
APAGA_ECRAS     EQU 6002H      ; endere�o do comando para apagar todos os pixels de todos os ecr�s
APAGA_AVISO     EQU 6040H      ; endere�o do comando para apagar o aviso de nenhum cen�rio selecionado

MASCARA_INICIAL EQU 01H       ; mascara (0000 0001)
MASCARA_FINAL EQU 80H         ; mascara (1000 0000)

; *********************************************************************************
; * Dados
; *********************************************************************************
PLACE 2000H
nave:
  string 7, 2, 7, terminador


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

  MOV  R0, APAGA_ECRAS
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)

  MOV  R0, APAGA_AVISO
  MOV  [R0], R1            ; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)




ciclo:
  MOV R3, 10H          ; coordenada X
  MOV R4, 20H          ; coordenada Y
  MOV R1, nave
  MOV R7, 4             ; largura do objeto
  CALL desenha_objeto ; desenhar objeto
  JMP fim



; **********************************************************************
; DESENHA_OBJETO - Desenha qualquer objeto no ecrâ
;
; Argumentos:   R3 - Coordenada X
;               R4 - Coordenada Y
;               R1- Base da tabela do objeto
; **********************************************************************
desenha_objeto:
  PUSH R2
le_elemento:
  MOVB R2, [R1]           ; ler elemento da string
  CMP R2, terminador      ; verificar se já chegamos ao fim da tabela
  JZ sair_desenha_objeto              ; se sim, saimos da rotina
  CALL desenha_linha      ; desenha a linha lida da tabela
  ADD R1,1                ; proximo elemento da string
  JMP le_elemento    ; repetir até chegar ao fim da tabela
sair_desenha_objeto:
  POP R2
  RET


; **********************************************************************
; DESENHA_LINHA - Processa cada linha do objeto a ser desenhado
;
; Argumentos:   R3 - Coordenada X (linhas)
;               R4 - Coordenada Y (colunas)
;               R2- Linha a desenhar
; **********************************************************************
desenha_linha:
  PUSH R7
  PUSH R8
  PUSH R6
  MOV R7, MASCARA_INICIAL ; inicializa a mascara (0000 0001)
  MOV R8, 0 ;
le_bit:
  MOV R6, R2        ; variavel auxiliar com o valor lido da tabela
  CMP R6, R8        ; se é 0, saimos
  JZ sair_desenha_linha
  AND R6, R7        ; aplicar a mascara
  CALL desenha_pixel
  SHL R7, 1
  JMP le_bit
sair_desenha_linha:
  ADD R3,1
  POP R6
  POP R8
  POP R7
  RET



; **********************************************************************
; DESENHA_PIXEL - Desenha um pixel
;
; Argumentos:   R3 - Coordenada X (linha)
;               R4 - Coordenada Y (coluna)
;               R6-  0 pixel apagado, 1 pixel acesso
; **********************************************************************
desenha_pixel:
      PUSH  R0
      PUSH R10

      MOV R10, 0
      CMP R6, R10
      JZ desenha
      MOV R6, 1

desenha:
      MOV  R0, DEFINE_LINHA
      MOV  [R0], R3           ; seleciona a linha

      MOV  R0, DEFINE_COLUNA
      MOV  [R0], R4           ; seleciona a coluna

      MOV  R0, DEFINE_PIXEL
      MOV  [R0], R6           ; escreve o pixel com a cor da caneta na linha e coluna selecionadas

      ADD R4, 1 ; proxima coluna

      POP R10
      POP  R0
      RET

fim:
JMP fim
