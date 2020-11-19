; PROJETO - VERSÃO FINAL
terminador  EQU 0
; *********************************************************************************
; * Dados
; *********************************************************************************
PLACE     1000H
pilha:    TABLE 100H          ; espa�o reservado para a pilha
                              ; (200H bytes, pois s�o 100H words)
SP_inicial:                   ; este � o endere�o (1200H) com que o SP deve ser
                              ; inicializado. O 1.� end. de retorno ser�
                              ; armazenado em 11FEH (1200H-2)


inicio:
  MOV  BTE, tab            ; inicializa BTE (registo de Base da Tabela de Exce��es)
  MOV  SP, SP_inicial      ; inicializa SP para a palavra a seguir
                         ; � �ltima da pilha

  MOV  R0, APAGA_ECRAS
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)

  MOV  R0, APAGA_AVISO
  MOV  [R0], R1            ; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)



nave:
  string 7, 2, 7, terminador


desenha_objeto:
  PUSH R1
  PUSH R2
  MOV R1, nave
le_prox_elemento:
  MOVB R2, [R1]
  CMP R2, terminador
  JZ fim
  CALL desenha_linha
  ADD R1,1
  JMP le_prox_elemento


; **********************************************************************
; DESENHA_LINHA - DESCRICAO
;
; Argumentos:   Rx - Coordenada X
;               Rx- Coordenada Y
;               Rx- Linha a desenhar
;
; **********************************************************************
desenha_linha:
  ret

fim:
JMP fim
