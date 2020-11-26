; PROJETO - VERSÃO FINAL

terminador  EQU 0
DEFINE_LINHA    EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    EQU 601AH     ; endereço do comando para escrever um pixel
DEFINE_PAUSA_MEDIA   EQU 6062H ; endereço do comando para pausar media
DEFINE_DESPAUSA_MEDIA EQU 6064H ; endereço do comando para despausar media

DEFINE_VIDEO EQU 6048H   ; endereço para definir o video
PLAY_VIDEO EQU 605AH    ; endereço para começar o video
APAGA_ECRA     EQU 6000H     ; endere�o do comando para apagar todos os pixels do ecra selecionado
APAGA_ECRAS     EQU 6002H      ; endere�o do comando para apagar todos os pixels de todos os ecr�s
APAGA_AVISO     EQU 6040H      ; endere�o do comando para apagar o aviso de nenhum cen�rio selecionado
COR_CANETA EQU 6014h        ; endereço do comando para mudar a cor da caneta

APAGAR_IMAGEM EQU 6044H ; endereço para apagar uma imagem
MOSTRAR_IMAGEM EQU 6046H ; endereço para mostrar uma imagem

MASCARA_INICIAL EQU 01H       ; mascara (0000 0001)
MASCARA_FINAL EQU 80H         ; mascara (1000 0000)

COL_MAX EQU 63
COL_MIN EQU 0
LIN_MAX EQU 31

LARGURA_NAVE EQU 5

VERDE EQU 0F0F0H
VERMELHO EQU 0FF00H
AMARELO EQU 0FFF0H

NAO_MOVE EQU 0
DISPARA_MISSIL EQU 5
VELOCIDADE_NAVE EQU 1

ENERGIA EQU 5
ENERGIA_INICIAL EQU 100

JOGO_CORRER EQU 1
JOGO_PAUSA EQU 0

TECLA_COMECAR EQU 0CH
TECLA_PAUSAR EQU 0DH
TECLA_TERMINAR EQU 0EH

IMAGEM_PAUSA EQU 0

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

; EXPLOSAO
explosao:
  string 0AH, 15H, 0AH, 15H, 0AH, terminador


; *********************************************************************************
; Funcao nave
; *********************************************************************************
func_nave:
  WORD -VELOCIDADE_NAVE      ; tecla 0
  WORD DISPARA_MISSIL       ; tecla 1
  WORD VELOCIDADE_NAVE      ; tecla 2
  WORD NAO_MOVE             ; tecla 3
  WORD NAO_MOVE             ; tecla 4
  WORD NAO_MOVE             ; tecla 5
  WORD NAO_MOVE             ; tecla 6
  WORD NAO_MOVE             ; tecla 7
  WORD NAO_MOVE             ; tecla 8
  WORD NAO_MOVE             ; tecla 9
  WORD NAO_MOVE             ; tecla A
  WORD NAO_MOVE             ; tecla B
  WORD NAO_MOVE             ; tecla C
  WORD NAO_MOVE             ; tecla D
  WORD NAO_MOVE             ; tecla E
  WORD NAO_MOVE             ; tecla F

; *********************************************************************************
; Variaveis de estado
; *********************************************************************************

jogo: WORD 1           ; estado do jogo (-1 = por começar, 0 = pausa , 1 = a correr)

tecla_premida: WORD 0H   ; tecla premida (-1 = nao houve tecla, (0-F) = tecla do teclado )
ultima_tecla: word -1 ; ultima tecla premida (-1 = nao houve tecla, (0-F) = tecla do teclado )

energia: word ENERGIA_INICIAL  ; energia da nave


evento_int: WORD 0   ; se =1 indica que aconteceu a interrupção do relogio energia


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








; ciclo principal do programa
ciclo:
  CALL teclado
  CALL nave
  CALL controlo
  JMP ciclo




teclado:
  RET


nave:
  PUSH R1
  PUSH R2
  PUSH R3


  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  CMP R1, 1           ; se o jogo nao estiver a correr saimos
  JNZ sair_nave
nave_energia:
  MOV R1, evento_int
  MOV R1, [R1]
  CMP R1, 1  ; verificar se aconteceu a interropeçao responsavel pela energia
  JNZ nave_ler_tecla ; se nao, saimos
  CALL diminuir_energia
nave_ler_tecla:
  MOV R2, tecla_premida
  MOV R2, [R2]      ; verifica a tecla premida
  CMP R2, 0         ; se a tecla pressionada for a tecla 0 entao movimentamos a nave para a esquerda
  SHL R2, 1         ; multiplicar R2 por 2 porque a func_nave é uma tabela de words
  MOV R3, func_nave ; base da tabela das funcionalidades da nave
  MOV R3, [R3 + R2] ; obter a funcionalidade da tecla premida

  CMP R3, NAO_MOVE ; se a tecla nao for relevante entao saimos
  JZ sair_nave
  CMP R3, DISPARA_MISSIL ; se a tecla dor a de disparar o missil procedemos como tal
  JZ nave_dispara_missil
  ; caso a tecla nao seja nenhuma das anterioes então movimentamos a nave
  CALL movimenta_nave ; movimenta a nave
  CALL desenha_nave
  JMP sair_nave
nave_dispara_missil:

sair_nave:
  POP R3
  POP R2
  POP R1
  RET



controlo:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5

  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  MOV R2, tecla_premida
  MOV R2, [R2]      ; verifica a tecla premida
  CMP R1, R2        ; comparar o estado do jogo com a tecla premida
  JZ sair_controlo ; se for igual saimos

  MOV R4, ultima_tecla ; base da tabela 'ultima tecla'
  MOV R4, [R4]  ; le o valor da variavel
  CMP R2, R4 ; se o valor das variaveis for igual significa que nao deixamos de pressionar a teclas
  JZ sair_controlo ; nesse caso saimos

  MOV R5, TECLA_COMECAR
  CMP R2, R5
  JZ comecar          ; verificar se a tecla premida foi a tecla de começar
  MOV R5, TECLA_PAUSAR
  CMP R2, R5
  JZ pausar           ; verificar se a tecla premida foi a tecla de pausar
  MOV R5, TECLA_TERMINAR
  CMP R2, R5
  JZ terminar         ; verificar se a tecla premida foi a tecla de terminar
  JMP sair_controlo

comecar:
  MOV R3, JOGO_CORRER
  CALL inicializar    ; inizialiar tudo com o seu valor original
  CALL tocar_video    ; toca o video
  JMP modificar_estado

pausar:
  CMP R1, JOGO_CORRER
  JZ pausa_jogo   ; se o jogo esta a correr mudamos o seu estado para pausa
  CMP R1, JOGO_PAUSA
  JZ despausa_jogo ; se o jogo esta em pausa mudamos o seu estado para correr
  JMP sair_controlo
  pausa_jogo:
    MOV R3, JOGO_PAUSA
    CALL pausa_media
    MOV R4, IMAGEM_PAUSA
    CALL mostra_imagem
    JMP modificar_estado
  despausa_jogo:
    CALL despausa_media
    CALL apagar_imagem
    MOV R3, JOGO_CORRER
    JMP modificar_estado

terminar:
  MOV R3, -1
  JMP modificar_estado

modificar_estado:
  CALL alterar_estado_jogo
sair_controlo:
  POP R5
  POP R4
  POP R3
  POP R2
  POP R1
  RET



; **********************************************************************
; INICIALIZAR - INICIALIZA O JOGO
; **********************************************************************
inicializar:
  PUSH R1
  PUSH R2
  MOV R1, energia  ; base da tabela da energia
  MOV R2, ENERGIA_INICIAL ; inicializa r2 com a energia inicial
  MOV [R1], R2 ; guarda o valor na memoria
  POP R2
  POP R1
  RET


; **********************************************************************
; ALTERAR_ESTADO_JOGO - Altera o estado do jogo
;
; Argumentos:   R3 - Novo estado de jogo
;
; **********************************************************************
alterar_estado_jogo:
  PUSH R1
  PUSH R2
  MOV R1, jogo        ; base da tabela jogo
  MOV [R1], R3     ; guarda
  POP R2
  POP R1
  RET

; **********************************************************************
; PAUSA_MEDIA - pausa a reprodução de todos os ficheiros video / audio
; **********************************************************************
pausa_media:
  PUSH R0
  MOV  R0, DEFINE_PAUSA_MEDIA
  MOV  [R0], R1           ; o valor de R1 nao é importante
  POP R0
  RET

; **********************************************************************
; DESPAUSA_MEDIA - despausa a reprodução de todos os ficheiros video / audio
; **********************************************************************
despausa_media:
  PUSH R0
  MOV  R0, DEFINE_DESPAUSA_MEDIA
  MOV  [R0], R1           ; o valor de R1 nao é importante
  POP R0
  RET


; **********************************************************************
; tocar_video - Toca o video
; **********************************************************************
tocar_video:
  PUSH R0
  PUSH R1
  MOV R1, 0
  MOV  R0, DEFINE_VIDEO
  MOV  [R0], R1            ; define o video a tocar

  MOV  R0, PLAY_VIDEO
  MOV  [R0], R1            ; Toca o video
  POP R1
  POP R0
  RET

; **********************************************************************
; MOSTRA_IMAGEM - Mostra uma determinada imagem
;
; Argumentos: R4 - Numero da Imagem a mostrar
;
; **********************************************************************
mostra_imagem:
  PUSH R0
  MOV  R0, MOSTRAR_IMAGEM
  MOV  [R0], R4           ; Mostra a imagem no cenario frontal
  POP R0
  RET

; **********************************************************************
; APAGAR_IMAGEM - Apaga o cenario frontal
; **********************************************************************
apagar_imagem:
  PUSH R0
  MOV  R0, APAGAR_IMAGEM
  MOV  [R0], R4           ; apaga a imagem, o valor de R4 não é importante
  POP R0
  RET

; **********************************************************************
; MOVIMENTA_NAVE - movimenta a nave de acordo com a tecla pressionada
; **********************************************************************
movimenta_nave:
  PUSH R2
  PUSH R5
  PUSH R6
  PUSH R7

  MOV R7, COL_MAX       ; limite direito do ecra (coluna 63)
  SUB R7, LARGURA_NAVE           ; subtrair a largura da nave
  MOV R5, nave_coordenadas  ; base da tabela das coordenadas
  MOV R6, [R5 + 2]      ; obter a coluna onde se situa a nave
  CMP R6, R7         ; comparar com a coluna máxima
  JGT sair_movimenta_nave ;limitar o movimento da nave no lado direito do ecra

  MOV R7, COL_MIN
  CMP R6, R7      ; comparar com a coluna minima
  JLE sair_movimenta_nave ;l imitar o movimento da nave no lado esquerdo do ecra
  ADD R6, R3   ; adicionar a velocidade à posicao atual
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


diminuir_energia:
PUSH R1
PUSH R2

MOV R1, energia  ; base da tabela da energia
MOV R2, [R1] ; le o valor de energia
SUB R2, ENERGIA ; diminui a energia
MOV [R1], R2 ; guarda o novo valor na memoria

POP R2
POP R1
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
