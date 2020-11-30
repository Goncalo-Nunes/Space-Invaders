; PROJETO - VERSÃO FINAL

terminador  EQU 0
DEFINE_LINHA    EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    EQU 601AH     ; endereço do comando para escrever um pixel
DEFINE_PAUSA_MEDIA   EQU 6062H ; endereço do comando para pausar media
DEFINE_DESPAUSA_MEDIA EQU 6064H ; endereço do comando para despausar media
DEFINE_ECRA EQU 6004H ; endereço do comando para selecionar um ecrã

DEFINE_VIDEO EQU 6048H   ; endereço para definir o video
PLAY_VIDEO EQU 605AH    ; endereço para começar o video
APAGA_ECRA     EQU 6000H     ; endere�o do comando para apagar todos os pixels do ecra selecionado
APAGA_ECRAS     EQU 6002H      ; endere�o do comando para apagar todos os pixels de todos os ecr�s
APAGA_AVISO     EQU 6040H      ; endere�o do comando para apagar o aviso de nenhum cen�rio selecionado
COR_CANETA EQU 6014H        ; endereço do comando para mudar a cor da caneta

APAGAR_IMAGEM EQU 6044H ; endereço para apagar uma imagem
MOSTRAR_IMAGEM EQU 6046H ; endereço para mostrar uma imagem

MASCARA_INICIAL EQU 01H       ; mascara (0000 0001)
MASCARA_FINAL EQU 80H         ; mascara (1000 0000)

COL_MAX EQU 63 ; coluna maxima do mediacenter
COL_MIN EQU 0 ; coluna minima do mediacenter
LIN_MAX EQU 31 ; linha maxima do mediacenter
LIN_MIN EQU 0 ; linha minima do mediacenter

DISPLAYS   EQU 0A000H ; endereço do display de 7 segmentos (periférico POUT-1)

LARGURA_NAVE EQU 5 ; largura da nave em pixeis

VERDE EQU 0F0F0H ; cor verde
VERMELHO EQU 0FF00H ; cor vemelha
AMARELO EQU 0FFF0H ; cor amarela

NAO_MOVE EQU 0
DISPARA_MISSIL EQU 5

VELOCIDADE_NAVE EQU 1
VELOCIDADE_MISSIL EQU 1
ALCANCE_MISSIL EQU 6

COR_NAVE EQU 0FFF0H
COR_MISSIL EQU 0FF0FH


ENERGIA_DECREMENTO_TEMPO EQU 5 ; percentagem de diminuição de energia devido à passagem do tempo
ENERGIA_DECREMENTO_MISSIL EQU 5 ; percentagem de diminuição de energia devido ao disparo de um missil
ENERGIA_INCREMENTO_MINERACAO EQU 10 ; percentagem de aumento de energia devido à mineração de um asteroide
ENERGIA_INCREMENTO_EXPLOSAO EQU 5 ; percentagem de aumento de energia devido à explosao de uma nave inimiga
ENERGIA_INICIAL EQU 100 ; energia inicial da nave

JOGO_CORRER EQU 1 ; estado do jogo a correr
JOGO_PAUSA EQU 0 ; estado do jogo em pausa
JOGO_TERMINAR EQU 0FFFFH ; estado do jogo terminado

TECLA_COMECAR EQU 0CH ; tecla de começar o jogo
TECLA_PAUSAR EQU 0DH ; tecla de pausar o jogo
TECLA_TERMINAR EQU 0EH ; tecla para terminar o jogo atual

TEC_LIN    EQU 0C000H  ; endereço das linhas do teclado (periférico POUT-2)
TEC_COL    EQU 0E000H  ; endereço das colunas do teclado (periférico PIN)

IMAGEM_INICIO EQU 0 ; Indice da imagem inicial
IMAGEM_PAUSA EQU 1 ; Indice da imagem de pausa
IMAGEM_GAMEOVER EQU 2 ; Indice da imagem de gameover
IMAGEM_EXPLOSAO EQU 3 ; Indice da imagem de explosao

INDICE_OVNIS EQU 0 ; indice da interrupção responsavel pelos ovnis na tabela de interrupções
INDICE_MISSIL EQU 1 ; indice da interrupção responsavel pelo missil na tabela de interrupções
INDICE_ENERGIA EQU 2 ; indice da interrupção responsavel pela energia na tabela de interrupções

FATOR_100 EQU 100

ECRA_NAVE EQU 0
ECRA_MISSIL EQU 1
ECRA_OVNIS EQU 2
ECRA_EXPLOSAO EQU 3

PLACE 2000H

; NAVE
nave_pixeis:
  string 4h, 0Eh, 1Fh, 4h, 0Ah, terminador

nave_coordenadas:
  word 27               ; linha
  word 31               ; coluna

missil_pixeis:
  string 1, terminador

missil_coordenadas:
  WORD 0 ; linha
  WORD 0 ; coluna

missil_linha_limite: ; a linha limite do missil será igual à linha em que foi disparado menos o seu alance
  WORD 0


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
; Funcao nave - funcão das teclas da nave
; *********************************************************************************
func_nave:
  WORD -VELOCIDADE_NAVE     ; tecla 0
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

jogo: WORD JOGO_TERMINAR           ; estado do jogo (-1 = por começar, 0 = pausa , 1 = a correr)
tecla_premida: WORD -1   ; tecla premida (-1 = nao houve tecla, (0-F) = tecla do teclado )
ultima_tecla: WORD -1 ; ultima tecla premida (-1 = nao houve tecla, (0-F) = tecla do teclado )
energia: WORD ENERGIA_INICIAL  ; energia da nave
estado_missil: WORD 0 ; indica se o missil está ativo ou não




; *********************************************************************************
; Interrupções
; *********************************************************************************
tabela_interrupcoes:
  WORD relogio_ovnis ; Interrupçao 0
  WORD relogio_missil ; Interrupçao 1
  WORD relogio_energia ; Interrupçao 2

tabela_eventos:
  WORD 0 ; se =1 indica que aconteceu a interrupção 0 (relogio_ovnis)
  WORD 0 ; se =1 indica que aconteceu a interrupção 1 (relogio_missil)
  WORD 0 ; se =1 indica que aconteceu a interrupção 2 (relogio_energia)



PLACE     1000H
pilha:    TABLE 100H          ; espa�o reservado para a pilha
                              ; (200H bytes, pois s�o 100H words)
SP_inicial:                   ; este � o endere�o (1200H) com que o SP deve ser
                              ; inicializado. O 1.� end. de retorno ser�
                              ; armazenado em 11FEH (1200H-2)

PLACE 0
inicio:
  MOV  SP, SP_inicial      ; inicializa SP

  MOV BTE, tabela_interrupcoes ; inicializa a Tabela de Exceções

  MOV R1, 0
  MOV  R0, APAGA_ECRAS
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)

  MOV  R0, APAGA_AVISO
  MOV  [R0], R1            ; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)

  CALL apagar_imagem ; apaga qualquer imagem do mediacenter

  MOV R4, IMAGEM_INICIO
  CALL mostra_imagem ; mostra a imagem inicial
  MOV R4, 0


  ; permitir interrupções
  EI0
	EI1
  EI2
	EI


; ciclo principal do programa
ciclo:

  CALL teclado
  CALL nave
  CALL missil
  CALL controlo

  JMP ciclo




teclado:
  PUSH R0				; Salva registos
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R5
  PUSH R6

  MOV R0, ultima_tecla			; Obt�m endere�o da mem�ria onde a  ultima tecla est� guardada
  MOV R1, tecla_premida ; Obt�m endere�o da mem�ria onde a  ultima tecla est� guardada
  MOV R1, [R1] ; Obtem o valor da variavel
  MOV [R0], R1 ; escreve na variavel ultima_tecla o valor atual da variavel tecla_premida

  MOV  R2, TEC_LIN    ; Obt�m endere�o das linhas (periferico)
  MOV  R3, TEC_COL    ; Obt�m endere�o das colunas (periferico)
  MOV  R1, 8			; Linha onde come�a a verificar o teclado

  loop_teclado:          ; Neste ciclo verificam-se todas as linhas do teclado
    MOVB [R2], R1      ; Escreve a linha a verificar no perif�rico
    MOVB R0, [R3]      ; L� do perif�rico a linha da tecla pressionada
    CMP  R0, 0         ; Verifica se h� tecla premida
    JNZ  clique        ; Se uma tecla estiver premida salta
    SHR R1, 1		   ; Calcula a pr�xima linha
    JZ sem_tecla	   ; Se j� verificou todas as linhas sai
    JMP loop_teclado   ; Salta para manter o loop

  clique:
    MOV R5, -1          ; Guarda -1 em R5 para contagem de divisoes
    conv_linha:         ; Converte linha(1,2,4,8) para (0,1,2,3) para calculos futuros
      SHR R1, 1       ; Por cada shift
      ADD R5, 1       ; Adiciona 1 para ficar 0-based
      CMP R1, 0       ; Verifica se j� chegou ao fim do loop
      JNZ conv_linha  ; Caso contr�rio continua at� R1 ser 0

    MOV R6, -1			; Guarda -1 em R6 para contagem de divisoes
    conv_coluna:	    ; Converte coluna(1,2,4,8) para (0,1,2,3) para calculos futuros
      SHR R0, 1		; Por cada shift
      ADD R6, 1       ; Adiciona 1 para ficar 0-based
      CMP R0, 0		; Verifica se j� chegou ao fim do loop
      JNZ conv_coluna ; Caso contr�rio continua at� R0 ser 0

    SHL R5,2   			; Calculo da formula 4*linha + coluna para obter tecla
    ADD R5, R6
    JMP fim_verificar_teclado

    sem_tecla:			; Se n�o houver tecla premida escreve -1 no registo que guarda a tecla
      MOV R5, -1

  fim_verificar_teclado:
    MOV R0, tecla_premida			; Obt�m endere�o da mem�ria onde a tecla est� guardada
    MOV [R0], R5			; Guarda nova tecla na vari�vel global tecla_premida

  POP R6	; Repoe registos usados
  POP R5
  POP R3
  POP R2
  POP R1
  POP R0
  RET		; Retorna



nave:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8

  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  CMP R1, 1           ; se o jogo nao estiver a correr saimos
  JNZ sair_nave

  MOV R1, ECRA_NAVE
  CALL seleciona_ecra ; seleciona o ecra

  nave_energia:
    MOV R1, tabela_eventos 	; Obt�m endere�o da mem�ria onde estão guardados os eventos
    MOV R2, INDICE_ENERGIA
    SHL R2, 1 ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
    MOV R1, [R1 + R2] ; ler o valor da tabela de eventos no indice especificado
    CMP R1, 1  ; verificar se aconteceu a interropeçao responsavel pela diminuição da energia
    JNZ nave_ler_tecla ; se nao, continuamos
    CALL atender_evento_energia ; se sim, atendemos o evento e só depois continuamos

  nave_ler_tecla:
    MOV R2, tecla_premida ; Obt�m o endere�o da mem�ria onde a tecla premida est� guardada
    MOV R2, [R2]      ; verifica a tecla premida
    CMP R2, 0         ; se a tecla pressionada for menor que 0 significa que nenhuma tecla foi pressionada
    JLT sair_nave    ; logo nao temos que movimentar a nave
    MOV R3, TECLA_COMECAR ; verificar se a tecla pressionada é a de começar o jogo
    CMP R2, R3  ; se a tecla pressionada for a de começar o jogo entao desenhamos a nave pela primeira vez
    JZ lida_tecla_comecar

    SHL R2, 1         ; multiplicar R2 por 2 porque a func_nave é uma tabela de words
    MOV R3, func_nave ; base da tabela das funcionalidades da nave
    MOV R3, [R3 + R2] ; obter a funcionalidade da tecla premida
    CMP R3, NAO_MOVE ; se a tecla nao for relevante entao saimos da rotina
    JZ sair_nave
    CMP R3, DISPARA_MISSIL ; se a tecla for a de disparar o missil saltamos
    JZ nave_missil
    JMP nave_movimenta   ; caso a tecla premida nao seja nenhuma das anterioes então movimentamos a nave

  lida_tecla_comecar:
    MOV R3, 0 ; neste caso queremos a velocidade a 0, para apenas desenhar a nave

  nave_movimenta:
    CALL movimenta_nave ; movimenta a nave
    CALL desenha_nave ; desenha a nave
    JMP sair_nave ; após movimentar e desenhar, saimos

  nave_missil:
    MOV R1, estado_missil ; Obt�m o endere�o da mem�ria onde o estado do missil está guardado
    MOV R2, [R1] ; le o valor da variavel de estado
    CMP R2, 1 ; se o missil já estiver ativo, saimos
    JZ sair_nave

      nave_dispara_missil:
        MOV R2, 1
        MOV [R1], R2 ; altera a variavel de estado do missil de 0 para 1

        MOV R3, missil_coordenadas ; Obt�m o endere�o da mem�ria onde as coordenadas do missil estão guardadas
        MOV R4, nave_coordenadas ; Obt�m o endere�o da mem�ria onde as coordenas da nave estão guardadas
        MOV R8, [R4] ; obter o valor da linha da nave
        MOV [R3], R8 ; mover esse valor para a linha do missil

        MOV R8, [R4 + 2] ; obter o valor da coluna da nave
        MOV R5, LARGURA_NAVE ; obter a largura da nave
        MOV R6, 2
        DIV R5, R6 ; dividir a largura por 2
        ADD R8, R5 ; adicionar o resultado obtido, obtendo assim a coluna central da nave
        MOV [R3 + 2], R8 ; mover esse valor para a coluna do missil

  sair_nave:
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    RET


; trata do evento de diminuição de energia
atender_evento_energia:
  PUSH R0
  PUSH R1
  PUSH R2
  PUSH R5

  MOV R0, 0
  MOV R2, INDICE_ENERGIA
  SHL R2, 1   ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
  MOV R1, tabela_eventos  ; Obtem endere�o do evento da rotina 2 (relogio_energia)
  MOV [R1 + R2], R0 	; Sinaliza que esta foi tratada movendo 0 para a flag
  MOV R5, ENERGIA_DECREMENTO_TEMPO
  CALL diminuir_energia ; decrementamos a energia de acordo com o a percentagem da energia total especificada

  POP R5
  POP R2
  POP R1
  POP R0
  RET



missil:
  PUSH R0
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R9

  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  CMP R1, 1           ; se o jogo nao estiver a correr saimos
  JNZ sair_missil

  MOV R1, estado_missil ; Obt�m o endere�o da mem�ria onde o estado do missil está guardado
  MOV R2, [R1] ; le o valor da variavel de estado
  CMP R2, 1 ; verificar se o mssil está ativo
  JNZ sair_missil ; se nao estiver saimos

  MOV R0, tabela_eventos ; Obt�m o endere�o da mem�ria onde os eventos estão guardados
  MOV R1, INDICE_MISSIL
  SHL R1, 1 ; multiplicar o indice por 2 porque estamos a aceder a uma tabela de words
  MOV R2, [R0 + R1] ; le o valor da flag correspondente ao missil
  CMP R2, 0 ; se estiver a 0 saimos
  JZ sair_missil
  MOV R2, 0
  MOV [R0 + R1], R2 ; se nao estiver a 0, alteramos o valor para 0


  missil_movimenta:
    MOV R0, missil_coordenadas  ; Obt�m o endere�o da mem�ria onde as coordenadas do missil estão guardadas
    MOV R1, [R0] ; ler o valor da linha do missil
    SUB R1, VELOCIDADE_MISSIL ; subtrair à linha a velocidade do missil para obter um movimento vertical ascendente
    MOV [R0], R1 ; escreve a nova linha na memoria

    MOV R2, ALCANCE_MISSIL ; Obt�m o endere�o da mem�ria onde a linha limite do missil está guardada
    CMP R1, R2 ; se a linha do missil for menor ou igual ao seu limite entao o missil deixa de estar ativo
    JLE missil_desativar ; desativa o missil

  missil_desenha:
    MOV R1, ECRA_MISSIL
    CALL seleciona_ecra ; seleciona o ecra do missil
    CALL apagar_ecra

    MOV R6, COR_MISSIL
    CALL alterar_cor_caneta ; altera a cor da caneta

    MOV R0, missil_coordenadas
    MOV R3, [R0]
    MOV R9, [R0+2]
    MOV R6, 1
    CALL desenha_pixel
    JMP sair_missil


  missil_desativar:
    MOV R1, ECRA_MISSIL
    CALL seleciona_ecra ; seleciona o ecra do missil

    MOV R4, estado_missil ; Obt�m o endere�o da mem�ria onde o estado do missil está guardado
    MOV R5, 0
    MOV [R4], R5 ; altera o estado do missil para 0 (inativo)
    CALL apagar_ecra ; apaga o ecra do missil para dar lugar ao missil desenhado na nova posicao

  sair_missil:
    POP R9
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET







controlo:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5

  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  MOV R2, tecla_premida ; base da tabela da tecla premida
  MOV R2, [R2]      ; le a tecla premida

  MOV R4, ultima_tecla ; base da tabela 'ultima tecla'
  MOV R4, [R4]  ; le o valor da ultima tecla premida
  CMP R2, R4 ; se a tecla atual for igual à tecla antiga significa que nao deixámos de pressionar a tecla
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
  JMP sair_controlo ; caso seja uma tecla irrelevante, saimos

  comecar:
    CMP R1, JOGO_CORRER ; verificar se o jogo já está a correr
    JZ sair_controlo ; se sim, saimos da rotina
    MOV R3, JOGO_CORRER ;
    CALL inicializar    ; inizialiar tudo com o seu valor original
    CALL tocar_video    ; toca o video
    JMP modificar_estado ; salta para modificar o estado do jogo

  pausar:
    CMP R1, JOGO_CORRER
    JZ pausa_jogo   ; se o jogo esta a correr mudamos o seu estado para pausa
    CMP R1, JOGO_PAUSA
    JZ despausa_jogo ; se o jogo esta em pausa mudamos o seu estado para correr
    JMP sair_controlo
    pausa_jogo:
      MOV R3, JOGO_PAUSA
      CALL pausa_media ; pausa os recursos multimedia
      MOV R4, IMAGEM_PAUSA ; define a imagem a mostar, neste caso a imagem de pausa
      CALL mostra_imagem ; mostra a imagem selecionada
      JMP modificar_estado ; salta para modificar o estado do jogo
    despausa_jogo:
      CALL despausa_media ; despausa os recursos multimedia
      CALL apagar_imagem ; apaga a imagem de foreground
      MOV R3, JOGO_CORRER
      JMP modificar_estado ; salta para modificar o estado do jogo

  terminar:
    MOV R4, IMAGEM_GAMEOVER
    CALL mostra_imagem ; mostra a imagem de gameover
    CALL pausa_media ; pausa recursos multimedia
    MOV R3, JOGO_TERMINAR
    JMP modificar_estado ; define o estado do jogo como terminado

  modificar_estado:
    CALL alterar_estado_jogo ; modifica a variavel de estado do jogo para o novo valor

  sair_controlo:
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    RET





desenha_nave:
  PUSH R1
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R11

  MOV R6, COR_NAVE
  CALL alterar_cor_caneta

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
  RET



; **********************************************************************
; SELECIONA_ECRA - Espefica um determinado ecrã
;
; Argumentos:   R1 - Ecrâ
;
; **********************************************************************
seleciona_ecra:
  PUSH R0
  MOV  R0, DEFINE_ECRA
  MOV  [R0], R1            ; seleciona o ecrã
  POP R0
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
  CALL apagar_imagem ; apagar qualquer imagem do mediacenter
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
  MOV [R1], R3     ; guarda o novo valor na variavel de estado
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
  CALL apagar_imagem
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
; MOSTRA_IMAGEM - Altera a cor da caneta
;
; Argumentos: R6 - Cor da caneta
;
; **********************************************************************
alterar_cor_caneta:
  MOV  R0, COR_CANETA
  MOV  [R0], R6          ; altera a cor da caneta
  RET


; **********************************************************************
; MOVIMENTA_NAVE - movimenta a nave de acordo com a tecla pressionada
;
; Argumento: R3 - Velocidade da nave
;
; **********************************************************************
movimenta_nave:
  PUSH R1
  PUSH R2
  PUSH R5
  PUSH R6
  PUSH R7

  MOV R1, ECRA_NAVE
  CALL seleciona_ecra ; seleciona o ecra

  verifica_limites:
    MOV R7, COL_MAX       ; limite direito do ecra (coluna 63)
    SUB R7, LARGURA_NAVE           ; subtrair a largura da nave
    MOV R5, nave_coordenadas  ; base da tabela das coordenadas
    MOV R6, [R5 + 2]      ; obter a coluna onde se situa a nave
    CMP R6, R7         ; comparar com a coluna máxima
    JGT pode_virar_esquerda ; se chegamos à coluna maxima, a unica opçao é andar para a esquerda

    MOV R7, COL_MIN
    CMP R6, R7      ; comparar com a coluna minima
    JLE pode_virar_direita ; se chegamos à coluna minima, a unica opçao é andar para a direita

    JMP altera_posicao ; se nao estivermos a tocar nos limites do ecra entao alteramos a posicao da nave

    pode_virar_esquerda:
      CMP R3, 0 ; verificar se a velocidade é menor que 0, nesse caso estamos a tentar andar para a esquerda
      JLT altera_posicao ; se sim, alteramos a posicao
      JMP sair_movimenta_nave ; caso contrario saimos da rotina e nao movimentamos a nave

    pode_virar_direita:
      CMP R3, 0 ; verificar se a velocidade é maior que 0, nesse caso estamos a tentar andar para a direita
      JGT altera_posicao ; se sim, alteramos a posicao
      JMP sair_movimenta_nave ; caso contrario saimos da rotina e nao movimentamos a nave

  altera_posicao:
    ; caso geral
    ADD R6, R3   ; adicionar a velocidade à posicao atual
    MOV [R5 + 2], R6  ; escreve a nova posicao na memoria
    CALL apagar_ecra  ; apaga o ecra para dar lugar ao objeto desenhado na nova posicao

  sair_movimenta_nave:
    POP R7
    POP R6
    POP R5
    POP R2
    POP R1
    RET














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



; **********************************************************************
; DIMINUIR_ENERGIA- Diminui a energia de acordo com a percentagem da
;                   energia inicial especificada
;
; Argumento:   R5 - percentagem do valor inicial a diminuir
;
; **********************************************************************
diminuir_energia:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R6
  PUSH R7

  MOV R1, energia  ; base da tabela da energia
  MOV R2, [R1] ; le o valor de energia

  MOV R6, ENERGIA_INICIAL
  MOV R7, FATOR_100
  MUL R6, R5 ; multiplicar a energia inicial pelo valor de diminuição
  DIV R6, R7 ; dividir o resultado por 100

  SUB R2, R6; diminui a energia


  MOV [R1], R2 ; guarda o novo valor na memoria
  CALL atualiza_display ; atualiza os displays com o novo valor da energia
  CMP R2, 0 ; se o valor da energia for 0 então perdemos o jogo
  JZ gameover
  JMP sair_diminuir_energia

    gameover:
      MOV R3, JOGO_TERMINAR
      CALL alterar_estado_jogo ; altera o estado de jogo
      MOV R4, IMAGEM_GAMEOVER
      CALL mostra_imagem

  sair_diminuir_energia:
    POP R7
    POP R6
    POP R4
    POP R3
    POP R2
    POP R1
    RET



; **********************************************************************
; ATUALIZA_DISPLAY - Atualiza o display com um novo valor
;
; Argumento:   R2 - Valor a ser mostrado no display
;
; **********************************************************************
atualiza_display:
  PUSH R0
  PUSH R6
  PUSH R9
  PUSH R11

  MOV R9, FATOR_100
  converter_hex_para_dec:
  MOV R0, R2                                 ; mover numero resultante das operações de incremento e decremnto para R0
  CMP R9, 0
  JZ atualiza                                ; se o fator for 0, atualizamos o display
  MOD R0, R9                                 ; Dividir contador pelo fator
  MOV R10, 10                                ; fator de decrescimo do fator utilizado na obtenção de cada digito
  DIV R9, R10                                ; divisão do fator por 10 para conseguir obter o digito seguinte do numero
  MOV R6, R0                                 ; mover o numero para R6,o registo que vai conter cada digito do numero
  DIV R6, R9                                 ; obtenção de cada digito pela divisão inteira pelo fator
  SHL R11, 4                                 ; R11 vai conter o resultado da transformação e neste passo shiftamos 4 bits para a esquerda de modo a que cada digito represente as centenas dezenas e unidades respetivamente
  OR R11, R6                                 ; somamos o digito ao resultado
  CMP R9, 1                                  ; se o fator chegar a 1 já temos o nosso nº hexadecimal transformado em decimal
  JNZ converter_hex_para_dec                 ; caso contrário repetimos o processo

  atualiza:
    MOV R0, DISPLAYS
    MOV [R0], R11     ; mostra o valor nos displays

  POP R11
  POP R9
  POP R6
  POP R0
  RET




; **********************************************************************
; PAGAR_ECRA - Apaga o ecrâ selecionado
;
; Argumento:   R1 - Ecrã
;
; **********************************************************************
apagar_ecra:
  PUSH R0
  MOV  R0, APAGA_ECRA
  MOV  [R0], R1            ; apaga o ecrâ selecionado
  POP R0
  RET


apagar_ecras:
  PUSH R0
  PUSH R1
  MOV R1, 1
  MOV  R0, APAGA_ECRAS
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)
  POP R1
  POP R0
  RET








































;*********************************************************************************
;* Rotinas Interrup��o
;*********************************************************************************

relogio_ovnis:
  PUSH R0  ; Salva registos
  PUSH R1
  PUSH R2

  MOV R0, 1
  MOV R2, INDICE_OVNIS
  SHL R2, 1   ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
  MOV R1, tabela_eventos  ; Obtem endere�o do evento da rotina 0 (relogio_ovnis)
  MOV [R1 + R2], R0 	; Sinaliza que esta ocorreu movendo 1 para a flag

  POP R2
  POP R1	; Repoe registos
  POP R0
  RFE

relogio_missil:
  PUSH R0  ; Salva registos
  PUSH R1
  PUSH R2

  MOV R0, 1
  MOV R2, INDICE_MISSIL
  SHL R2, 1   ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
  MOV R1, tabela_eventos  ; Obtem endere�o do evento da rotina 1 (relogio_missil)
  MOV [R1 + R2], R0 	; Sinaliza que esta ocorreu movendo 1 para a flag

  POP R2
  POP R1	; Repoe registos
  POP R0
  RFE

relogio_energia:
  PUSH R0  ; Salva registos
  PUSH R1
  PUSH R2

  MOV R0, 1
  MOV R2, INDICE_ENERGIA
  SHL R2, 1   ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
  MOV R1, tabela_eventos  ; Obtem endere�o do evento da rotina 2 (relogio_energia)
  MOV [R1 + R2], R0 	; Sinaliza que esta ocorreu movendo 1 para a flag

  POP R2
  POP R1	; Repoe registos
  POP R0
  RFE
