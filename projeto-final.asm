; PROJETO - VERSÃO FINAL

terminador  EQU 0
DEFINE_LINHA    EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    EQU 601AH     ; endereço do comando para escrever um pixel
DEFINE_PAUSA_MEDIA   EQU 6062H ; endereço do comando para pausar media
DEFINE_DESPAUSA_MEDIA EQU 6064H ; endereço do comando para despausar media
DEFINE_ECRA EQU 6004H ; endereço do comando para selecionar um ecrã
DEFINE_VIDEO EQU 6048H   ; endereço para definir o video
PLAY_VIDEO EQU 605AH    ; endereço para começar o video ou som
LOOP_VIDEO EQU 605CH   ; endereço para começar em loop o video ou som
STOP_VIDEO EQU 6066H ; endereço para terminar o video ou som
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
NAVE_COLUNA_INICIAL EQU 31
NAVE_LINHA_INICIAL EQU 27

VERDE EQU 0F0F0H ; cor verde
VERMELHO EQU 0FF00H ; cor vemelha
AMARELO EQU 0FFF0H ; cor amarela

NAO_MOVE EQU 0
DISPARA_MISSIL EQU 5

VELOCIDADE_NAVE EQU 1 ; velocidade da nave
VELOCIDADE_MISSIL EQU 1 ; velocidade do missil
ALCANCE_MISSIL EQU 12 ; linha limite do missil

COR_NAVE EQU 0FFF0H ; cor da nave
COR_MISSIL EQU 0FF0FH ; cor do missil
COR_ASTEROIDE EQU 0F0F0H ; cor do asteroide
COR_NAVE_INIMIGA EQU 0FF00H ; cor nave inimiga
COR_OVNI EQU 0F999H ; cor do ovni distante
COR_EXPLOSAO EQU 0F0DFH ; cor da explosao

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
TECLA_CREDITOS EQU 0FH

TEC_LIN    EQU 0C000H  ; endereço das linhas do teclado (periférico POUT-2)
TEC_COL    EQU 0E000H  ; endereço das colunas do teclado (periférico PIN)

IMAGEM_PAUSA EQU 0 ; Indice da imagem de pausa
IMAGEM_GAMEOVER EQU 1 ; Indice da imagem de gameover
IMAGEM_EXPLOSAO EQU 2 ; Indice da imagem de explosao

INDICE_OVNIS EQU 0 ; indice da interrupção responsavel pelos ovnis na tabela de interrupções
INDICE_MISSIL EQU 1 ; indice da interrupção responsavel pelo missil na tabela de interrupções
INDICE_ENERGIA EQU 2 ; indice da interrupção responsavel pela energia na tabela de interrupções

FATOR_1000 EQU 1000
FATOR_100 EQU 100

ECRA_NAVE EQU 0 ; ecra da nave
ECRA_MISSIL EQU 1 ; ecra do missil
ECRA_EXPLOSAO EQU 2 ; ecra da explosao

VIDEO EQU 0 ; indice do video
SOM_MISSIL EQU 1 ; indice do som do missil
SOM_EXPLOSAO_INIMIGO EQU 2 ; indice do som da explosao da nave inimiga
SOM_EXPLOSAO_NAVE EQU 3 ; indice do som da explosao da nave
SOM_MINERACAO EQU 4 ; indice do som de mineração
SOM_GAMEOVER EQU 5 ; indice do som de gameover
MUSICA EQU 6 ; indice da musica
VIDEO_CREDITOS EQU 7 ; indice dos créditos
VIDEO_INTRO EQU 8 ; indice do video inicial

OVNI_INDICE_TABELA_DESENHOS EQU 0 ; indice da tabela de desenhos do ovni
OVNI_INDICE_DESENHO EQU 1 ; indice do desenho atual do ovni
OVNI_INDICE_COR EQU 2 ; indice da cor do ovni
OVNI_INDICE_LINHA EQU 3 ; indice da linha do ovni
OVNI_INDICE_COLUNA EQU 4 ; indice da coluna do onvi
OVNI_INDICE_ESTADO EQU 5 ; indice do estado do ovni
OVNI_INDICE_TIPO EQU 6 ; indice do tipo do onvi
OVNI_INDICE_VEL_VERTICAL EQU 7 ; indice da velocidade vertical do ovni
OVNI_INDICE_VEL_LATERAL EQU 8 ; indice da velocidade lateral do onvi
OVNI_INDICE_ALTURA EQU 9 ; indice da altura do onvi
OVNI_INDICE_LARGURA EQU 10 ; indice da largura do ovni
OVNI_INDICE_ECRA EQU 11 ; indice do ecrâ do onvi

OVNI_NUMERO_DESENHOS EQU 5 ; numero total de desenhos do ovni
OVNI_COLUNA_INICIAL EQU 29 ; coluna inicial do ovni
OVNI_LINHA_INICIAL EQU 0 ; linha incial do ovni
LINHAS_EVOLUCAO_OVNI EQU 3 ; numero de linhas que o ovni demora a evoluir
NUMERO_OVNIS EQU 3 ; numero de ovni


PLACE 2000H

; NAVE
nave_pixeis:
  string 4h, 0Eh, 1Fh, 4h, 0Ah, terminador

nave_coordenadas:
  word NAVE_LINHA_INICIAL             ; linha
  word NAVE_COLUNA_INICIAL            ; coluna

missil_pixeis:
  string 1, terminador

missil_coordenadas:
  WORD 0 ; linha
  WORD 0 ; coluna


; Pixeis dos ovnis no tamanho 1 e 2
pixeis_ovni_1:
  string 1h, terminador
pixeis_ovni_2:
  string 3h, 3h, terminador

; ASTEROIDES
pixeis_asteroide_3:
  string 2H, 7H, 2H, terminador

pixeis_asteroide_4:
  string 6H, 0FH, 0FH, 6H, terminador

pixeis_asteroide_5:
  string 0EH, 1FH, 1FH, 1FH, 0EH, terminador


; NAVE INIMIGA
pixeis_nave_inimiga_3:
  string 5H, 2H, 5H, terminador

pixeis_nave_inimiga_4:
  string 9H, 6H, 6H, 9H, terminador

pixeis_nave_inimiga_5:
  string 11H, 0AH, 4H, 0AH, 11H, terminador


; EXPLOSAO
explosao:
  string 0AH, 15H, 0AH, 15H, 0AH, terminador

;tabela com os desenhos dos asteroides
desenho_asteroide:
  WORD pixeis_ovni_1
  WORD pixeis_ovni_2
  WORD pixeis_asteroide_3
  WORD pixeis_asteroide_4
  WORD pixeis_asteroide_5

; tabela com os desenhos das naves inimigas
desenho_nave_inimiga:
  WORD pixeis_ovni_1
  WORD pixeis_ovni_2
  WORD pixeis_nave_inimiga_3
  WORD pixeis_nave_inimiga_4
  WORD pixeis_nave_inimiga_5

; objeto ovni
ovni_1:
  WORD 0 ; tabela de desenhos do ovni
  WORD 0 ; desenho atual do ovni
  WORD COR_OVNI ; cor do ovni
  WORD 0 ; linha
  WORD 0 ; coluna
  WORD 0 ; indica se está ativo ou inativo (0 = inativo, 1 = ativo)
  WORD 0 ; indica se é asteroide ou nave inimaga (-1 = nave inimga, 1 = asteroide)
  WORD 1 ; velocidade vertical
  WORD 0 ; velocidade lateral
  WORD 1 ; altura do ovni
  WORD 1 ; largura do ovni
  WORD 3 ; ecra do onvi

ovni_2:
  WORD 0 ; tabela de desenhos do ovni
  WORD 0 ; desenho atual do ovni
  WORD COR_OVNI ; cor do ovni
  WORD 0 ; linha
  WORD 0 ; coluna
  WORD 0 ; indica se está ativo ou inativo (0 = inativo, 1 = ativo)
  WORD 0 ; indica se é asteroide ou nave inimaga (-1 = nave inimga, 1 = asteroide)
  WORD 1 ; velocidade vertical
  WORD 0 ; velocidade lateral
  WORD 1 ; altura do ovni
  WORD 1 ; largura do ovni
  word 4 ; ecra do onvi

ovni_3:
  WORD 0 ; tabela de desenhos do ovni
  WORD 0 ; desenho atual do ovni
  WORD COR_OVNI ; cor do ovni
  WORD 0 ; linha
  WORD 0 ; coluna
  WORD 0 ; indica se está ativo ou inativo (0 = inativo, 1 = ativo)
  WORD 0 ; indica se é asteroide ou nave inimaga (-1 = nave inimga, 1 = asteroide)
  WORD 1 ; velocidade vertical
  WORD 0 ; velocidade lateral
  WORD 1 ; altura do ovni
  WORD 1 ; largura do ovni
  WORD 5 ; ecra do ovni


ovnis: ; tabela dos ovnis
  WORD ovni_1
  WORD ovni_2
  WORD ovni_3


; funcionalidades da nave
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
energia: WORD 0 ; energia da nave
estado_missil: WORD 0 ; indica se o missil está ativo ou não (0 = inativo, 1 = ativo)
contador_aleatorio: WORD 0 ; contador que permite gerar um número pseudo-aleatório


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
SP_inicial:                   ; este � o endere�o (1200H) com que o SP deve ser inicializado


PLACE 0
inicio:
  MOV  SP, SP_inicial      ; inicializa SP
  MOV BTE, tabela_interrupcoes ; inicializa a Tabela de Exceções

  MOV  R0, APAGA_AVISO
  MOV  [R0], R1            ; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)
  CALL apagar_imagem ; apaga qualquer imagem do mediacenter
  CALL apagar_ecras ; apagar ecras
  MOV R2,ENERGIA_INICIAL
  CALL atualiza_display

  MOV R9, VIDEO_INTRO
  CALL loop_media ; mostra o video incial


ecra_inicial:
  CALL gerador
  CALL teclado
  MOV R10, tecla_premida
  MOV R10, [R10]
  MOV R11, TECLA_COMECAR
  CMP R10, R11
  JNZ ecra_inicial

  MOV R9, VIDEO_CREDITOS
  CALL termina_media
  MOV R9, VIDEO_INTRO
  CALL termina_media
  CALL desenha_nave
  MOV R3, JOGO_CORRER
  CALL alterar_estado_jogo
  MOV R9, VIDEO
  CALL tocar_media   ; toca o video
  MOV R9, MUSICA
  CALL tocar_media ; toca a musica

  ; permitir interrupções
  EI0
  EI1
  EI2
  EI

  CALL inicializar ; inicializar o jogo






; ciclo principal do programa onde são chamados os processos cooperativos
ciclo:
  CALL teclado
  CALL nave
  CALL ovni
  CALL missil
  CALL controlo
  CALL gerador
  JMP ciclo



; **********************************************************************
; teclado - Processo cooperativo responsalvel por ler o periférico teclado
;           e armazenar a ultima tecla pressinada numa variável
; **********************************************************************
teclado:
  PUSH R0
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R5
  PUSH R6

  MOV R0, ultima_tecla			; obtém endereço da memória onde a ultima tecla está guardada
  MOV R1, tecla_premida ; obtém endereço da memória onde a tecla premida está guardada
  MOV R1, [R1] ; Obtem a tecla premida
  MOV [R0], R1 ; escreve na variavel ultima_tecla o valor atual da variavel tecla_premida

  MOV  R3, TEC_COL    ; obtém o endereço das colunas
  MOV  R2, TEC_LIN    ; obtém o endereço das linhas
  MOV  R1, 8			; premeira linha a verificar

  ciclo_teclado:  ; percorrer todas as linhas do teclado
    MOVB [R2], R1 ; escreve a linha a verificar no periférico
    MOVB R0, [R3] ; lê a linha da tecla pressionada
    CMP  R0, 0 ; verifica se alguma tecla foi premida
    JNZ tecla_pressionada ; se sim, salta
    SHR R1, 1	; dividir por dois a linha atual para obter a proxima linha
    JZ sem_tecla ; se já chegamos à ultima linha a verificar entao saltamos pois nao houve tecla premida
    JMP ciclo_teclado ; volta ao inicio do ciclo

  tecla_pressionada:
    MOV R5, -1          ; guarda -1 em R5 para contagem de divisoes
    converter_linha:   ; converte a linha (1,2,4,8) para (0,1,2,3)
      SHR R1, 1       ; dividir por 2
      ADD R5, 1       ; conta o numero de divisoes
      CMP R1, 0       ; se ainda nao chegamos a 0 saltamos para o inicio do ciclo
      JNZ converter_linha

    MOV R6, -1			; guarda -1 em R6 para contagem de divisoes
    converter_coluna:	   ; converte a coluna (1,2,4,8) para (0,1,2,3)
      SHR R0, 1		; divir por 2
      ADD R6, 1   ; conta o numero de divisoes
      CMP R0, 0		; se ainda nao chegamos a 0 saltamos para o inicio do ciclo
      JNZ converter_coluna

    ; calcula a tecla premida através da formula  tecla = 4*linha + coluna
    SHL R5,2 ; multiplicar por 4
    ADD R5, R6 ; adicionar a coluna
    JMP fim_verificar_teclado

    sem_tecla: ; -1 indica que nao houve tecla premida
      MOV R5, -1

  fim_verificar_teclado:
    MOV R0, tecla_premida			; Obtém endereço da memória onde a tecla está guardada
    MOV [R0], R5			; guarda a tecla obtida na memória

  POP R6
  POP R5
  POP R3
  POP R2
  POP R1
  POP R0
  RET


; **********************************************************************
; nave - Processo cooperativo responsalvel por desenhar e movimentar a nave
;        e disparar o missil
; **********************************************************************
nave:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9

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
    JNZ nave_ler_tecla ; se nao, saltamos
    ; caso contrário
    MOV R0, 0
    MOV R2, INDICE_ENERGIA
    SHL R2, 1   ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
    MOV R1, tabela_eventos  ; Obtem endere�o do evento da rotina 2 (relogio_energia)
    MOV [R1 + R2], R0 	; Sinaliza que esta foi tratada movendo 0 para a flag
    MOV R5, ENERGIA_DECREMENTO_TEMPO
    CALL diminuir_energia ; decrementamos a energia de acordo com o a percentagem da energia total especificada

  nave_ler_tecla:
    MOV R2, tecla_premida ; Obt�m o endere�o da mem�ria onde a tecla premida est� guardada
    MOV R2, [R2]      ; verifica a tecla premida
    CMP R2, 0         ; se a tecla pressionada for menor que 0 significa que nenhuma tecla foi pressionada
    JLT sair_nave    ; logo nao temos que movimentar a nave

    SHL R2, 1         ; multiplicar R2 por 2 porque a func_nave é uma tabela de words
    MOV R3, func_nave ; base da tabela das funcionalidades da nave
    MOV R3, [R3 + R2] ; obter a funcionalidade da tecla premida
    CMP R3, NAO_MOVE ; se a tecla nao for relevante entao saimos da rotina
    JZ sair_nave
    CMP R3, DISPARA_MISSIL ; se a tecla for a de disparar o missil saltamos
    JZ nave_missil
    JMP nave_movimenta   ; caso a tecla premida nao seja nenhuma das anterioes então movimentamos a nave


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

        MOV R5, ENERGIA_DECREMENTO_MISSIL
        CALL diminuir_energia ; diminuir a energia pois disparamos um missil
        MOV R9, SOM_MISSIL
        CALL tocar_media ; toca som do missil

  sair_nave:
    POP R9
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    RET


;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;
; Rotinas Auxiliares da Nave
;
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
; DESENHA_NAVE - desenha a nave nas suas coordenadas
; **********************************************************************
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
; ovni - Processo cooperativo responsalvel por desenhar, movimentar,
;       verificar colisoes e ativar os ovnis
; **********************************************************************
ovni:
  PUSH R0
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9
  PUSH R10
  PUSH R11

  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  CMP R1, 1           ; se o jogo nao estiver a correr saimos
  JNZ sair_ovni


  MOV R0, tabela_eventos ; Obt�m o endere�o da mem�ria onde os eventos estão guardados
  MOV R1, INDICE_OVNIS
  SHL R1, 1 ; multiplicar o indice por 2 porque estamos a aceder a uma tabela de words
  MOV R2, [R0 + R1] ; le o valor da flag correspondente ao ovni
  CMP R2, 0 ; se estiver a 0 saimos
  JZ sair_ovni

  MOV R2, 0
  MOV [R0 + R1], R2 ; se nao estiver a 0, alteramos o valor para 0

  MOV R1, ECRA_EXPLOSAO
  CALL apagar_ecra

  MOV R11, ovnis
  MOV R3, 0
  MOV R4, NUMERO_OVNIS
  SHL R4, 1
  ciclo_ovnis: ; percorre todos os ovnis, ativa-os se nao estiverem ativados e move-os, desenha-os e verifica colisoes se estiverem ativos
    CALL gerador
    MOV R0, [R11 + R3] ; obter o ovni
    ADD R3, 2
    CMP R3, R4 ; verificar se já percorremos os ovnis todos
    JGT sair_ovni ; se sim, saltamos
    MOV R5, OVNI_INDICE_ECRA
    SHL R5, 1
    MOV R1, [R10 + R5]
    CALL seleciona_ecra ; seleciona o ecra do ovni
    MOV R5, OVNI_INDICE_ESTADO
    SHL R5, 1 ; multiplicar o indice por dois porque estamos a aceder a uma tabela de words
    MOV R2, [R0 + R5] ; obtem o estado do ovni (inativo ou ativo)
    CMP R2, 0 ; se estiver inativo então temos que ativar o ovni e gerar valores para a velocidade e tipo do ovni
    JZ ativa
    CALL movimenta_ovni ; movimenta o ovni
    CALL evolucao_ovni ; lida com a evolucao do ovni
    CALL desenha_ovni ; desenha o ovni
    CALL deteta_colisao_ovni ; deteta colisao com a nave, missil e saida do ecra
    JMP ciclo_ovnis ; volta ao inicio do ciclo

  ativa: ; ativa o ovni
    MOV R2, 1
    CALL alterar_estado_ovni ; altera o estado para 1 (ativado)
    CALL reseta_ovni ; altera os dados do ovni para os originais
    CALL gerar_ovni ; gera um novo tipo e velocidade lateral
    JMP ciclo_ovnis ; volta ao inicio do ciclo

  sair_ovni:
    POP R11
    POP R10
    POP R9
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET

;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;
; Rotinas Auxiliares do Ovni
;
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

; **********************************************************************
; MOVIMENTA_OVNI- Movimenta um determinado ovni
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
movimenta_ovni:
  PUSH R2
  PUSH R3
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9

  ; guardar em registos os indices correspondentes aos dados do ovni
  MOV R6, OVNI_INDICE_VEL_LATERAL
  SHL R6, 1
  MOV R7, OVNI_INDICE_VEL_VERTICAL
  SHL R7, 1
  MOV R8, OVNI_INDICE_COLUNA
  SHL R8, 1
  MOV R9, OVNI_INDICE_LINHA
  SHL R9, 1


  ; movimento lateral
  MOV R2, [R0 + R6] ; obter o valor da velocidade lateral
  MOV R3, [R0 + R8] ; obter a coluna em que se situa o ovni

  ADD R2, R3 ; adicionar à coluna o valor da velocidade
  MOV [R0 + R8], R2 ; guardar o valor obtido na memoria, movendo assim o ovni lateralmente

  ; movimento vertical
  MOV R2, [R0 + R7] ; obter o valor da velocidade lateral
  MOV R3, [R0 + R9] ; obter a linha em que se situa o ovni

  ADD R2, R3 ; adicionar à linha o valor da velocidade
  MOV [R0 + R9], R2 ; guardar o valor obtido na memoria, movendo assim o ovni verticalmente

  POP R9
  POP R8
  POP R7
  POP R6
  POP R3
  POP R2

  RET


; **********************************************************************
; EVOLUCAO_OVNI-  Trata da evolucao de um determinado ovni, dando-lhe cor,
;                 desenho apropriado, altura e largura
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
evolucao_ovni:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R6

  MOV R9, OVNI_INDICE_LINHA
  SHL R9, 1
  MOV R1, [R0 + R9] ; obter a linha em que se situa o ovni
  MOV R3, R1 ; variavel auxiliar com o valor da linha do ovni
  MOV R2, LINHAS_EVOLUCAO_OVNI
  ADD R2, 1
  MOD R1, R2 ; se a divisao inteira da linha atual pelo numero de linhas que leva o ovni a evoluir for 0 entao passamos ao proximo desenho
  JZ proximo_desenho
  JMP sair_evolucao_ovni

    proximo_desenho:
      MOV R4, OVNI_INDICE_DESENHO
      SHL R4, 1
      MOV R7, OVNI_INDICE_LARGURA
      SHL R7, 1
      MOV R8, OVNI_INDICE_ALTURA
      SHL R8, 1

      DIV R3, R2 ; obter o numero do proximo desenho
      MOV R6, R3 ; variavel auxiliar com o numero do proximo desenho
      CMP R3, OVNI_NUMERO_DESENHOS
      JGE sair_evolucao_ovni ; se já estamos no ultimo desenho então saltamos
      SHL R3, 1 ; multiplicar por dois porque vamos aceder a uma tabela de words
      MOV R1, [R0] ; obter a tabela de desenhos do ovni
      MOV R2, [R1 + R3] ; obter o proximo desenho
      MOV [R0 + R4], R2 ;  modificar o desenho atual pelo seguinte
      MOV R9, [R0 + R7] ; obter a largura atual
      ADD R9, 1 ; incrementar a largura
      MOV [R0 + R7], R9 ; guardar o valor na memoria
      MOV R9, [R0 + R8] ; obter a altura atual
      ADD R9, 1 ; incrementar a altura
      MOV [R0 + R8], R9 ; guardar o valor na memoria
      CMP R6, 2 ; quando deixa de ser um ovni e passa a ser um asteroide ou nave inimiga, mudamos a cor
      JZ mudar_cor
      JMP sair_evolucao_ovni

        mudar_cor: ; mudar a propriedade da cor do ovni consoante o seu tipo
          MOV R4, OVNI_INDICE_COR
          SHL R4, 1
          MOV R1, OVNI_INDICE_TIPO
          SHL R1, 1
          MOV R2, [R0 + R1]
          CMP R2, -1
          JZ nave_inimiga ; se for uma nave inimiga então saltamos para atribuir a cor da nave inimiga
          MOV R6, COR_ASTEROIDE ; caso contrário a cor será a do asteroide
          MOV [R0 + R4], R6
          JMP sair_evolucao_ovni

            nave_inimiga:
              MOV R6, COR_NAVE_INIMIGA
              MOV [R0 + R4], R6

  sair_evolucao_ovni:
    POP R6
    POP R4
    POP R3
    POP R2
    POP R1
    RET


; **********************************************************************
; DESENHA_OVNI-  Desenha um determinado ovni
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
  desenha_ovni:
    PUSH R1
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R8
    PUSH R9
    PUSH R10
    PUSH R11

    ; guardar em registos os indices correspondentes aos dados do ovni
    MOV R5, OVNI_INDICE_DESENHO
    SHL R5, 1
    MOV R8, OVNI_INDICE_COLUNA
    SHL R8, 1
    MOV R9, OVNI_INDICE_LINHA
    SHL R9, 1
    MOV R10, OVNI_INDICE_LARGURA
    SHL R10, 1

    MOV R1, OVNI_INDICE_ECRA
    SHL R1, 1
    MOV R1, [R0 + R1]
    CALL apagar_ecra ; apaga o ecra do ovni para dar lugar ao novo desenha na posicao atualizada

    MOV R4, OVNI_INDICE_COR
    SHL R4, 1
    MOV R6, [R0 + R4] ; obter a cor do ovni
    CALL alterar_cor_caneta ; mudar a cor da caneta para a cor do ovni

    MOV R3, [R0 + R9]         ; coordenada Y
    MOV R4, [R0 + R8]      ; coordenada X
    MOV R1, [R0 + R5]      ; desenho do ovni
    MOV R11, [R0 + R10]   ; largura do ovni
    CALL desenha_objeto ; desenhar objeto

    POP R11
    POP R10
    POP R9
    POP R8
    POP R6
    POP R5
    POP R4
    POP R3
    POP R1
    RET


; **********************************************************************
; ATIVA_OVNI-  altera o estado de um determinado ovni
;
; Argumentos:   R0 - base da tabela do ovni
;               R2 - Estado do ovni
;
; **********************************************************************
alterar_estado_ovni:
  PUSH R1
  PUSH R2

  MOV R1, OVNI_INDICE_ESTADO
  SHL R1, 1
  MOV [R0 + R1], R2 ; mudar o estado do ovni

  POP R2
  POP R1
  RET


; **********************************************************************
; RESETA_OVNI-  reseta os valores do ovni para os originais
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
reseta_ovni:
  PUSH R1
  PUSH R2

  ; LINHA
  MOV R1, OVNI_INDICE_LINHA
  SHL R1, 1
  MOV R2, OVNI_LINHA_INICIAL
  MOV [R0 + R1], R2

  ; COLUNA
  MOV R1, OVNI_INDICE_COLUNA
  SHL R1, 1
  MOV R2, OVNI_COLUNA_INICIAL
  MOV [R0 + R1], R2

  ; LARGURA
  MOV R1, OVNI_INDICE_LARGURA
  SHL R1, 1
  MOV R2, 1
  MOV [R0 + R1], R2

  ; ALTURA
  MOV R1, OVNI_INDICE_ALTURA
  SHL R1, 1
  MOV R2, 1
  MOV [R0 + R1], R2

  ; DESENHO
  MOV R1, OVNI_INDICE_DESENHO
  SHL R1, 1
  MOV R2, pixeis_ovni_1
  MOV [R0 + R1], R2

  ; COR
  MOV R1, OVNI_INDICE_COR
  SHL R1, 1
  MOV R2, COR_OVNI
  MOV [R0 + R1], R2

  POP R2
  POP R1
  RET

; **********************************************************************
; gerar_ovni-  gera novos valores pseudo-aleatórios para a velocidade lateral e tipo do ovni
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
gerar_ovni:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8

  MOV R5, OVNI_INDICE_TIPO
  SHL R5, 1
  MOV R7, OVNI_INDICE_TABELA_DESENHOS
  SHL R7, 1

  MOV R1, contador_aleatorio
  MOV R1, [R1] ; ler o valor do contador
  MOV R2, R1
  MOV R3, 3
  MOD R2, R3 ; obter um numero entre 0 e 2
  SUB R2, 1 ; subtrair 1 para obter um numero entre -1 e 1

  MOV R4, OVNI_INDICE_VEL_LATERAL
  SHL R4, 1
  MOV [R0 + R4], R2 ; guardar o valor obtido na velocidade lateral do asteroide

  MOV R3, 4
  MOD R1, R3 ; obter um numero entre 0 e 3
  JZ asteroide ; se for 0 então o ovni será um asteroide, caso contrário será uma nave inimiga
  MOV R6, -1
  MOV [R0 + R5], R6 ; defenir o tipo do ovni como nave_inimiga (-1)

  MOV R8, desenho_nave_inimiga
  MOV [R0 + R7], R8 ; definir a tabela de desenhos do ovni com os desenhos da nave inimiga
  JMP sair_gerar_asteroide

    asteroide:
      MOV R6, 1
      MOV [R0 + R5], R6 ; defenir o tipo do ovni como asteroide (1)

      MOV R8, desenho_asteroide
      MOV [R0 + R7], R8 ; definir a tabela de desenhos do ovni com os desenhos do asteroide

sair_gerar_asteroide:
  POP R8
  POP R7
  POP R6
  POP R5
  POP R4
  POP R3
  POP R2
  POP R1
  RET


; **********************************************************************
; deteta_colisao_ovni-  deteta colisoes com outros objetos e deteta a saida do ecra
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
deteta_colisao_ovni:
  CALL verifica_limites_ovni
  CALL verifica_colisao_missil
  CALL verifica_colisao_nave
  RET


; **********************************************************************
; verifica_limites_ovni-  verifica se o ovni saiu dos limites do ecra
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
verifica_limites_ovni:
  PUSH R1
  PUSH R2
  PUSH R3

  MOV R1, OVNI_INDICE_LINHA
  SHL R1, 1
  MOV R2, [R0 + R1] ; obter linha do ovni
  MOV R3, LIN_MAX
  CMP R2, R3
  JLT sair_verifica_limites_ovni
  MOV R2, 0
  CALL alterar_estado_ovni ; altera o estado do ovni para 0

  sair_verifica_limites_ovni:
  POP R3
  POP R2
  POP R1
  RET


; **********************************************************************
; verifica_colisao_missil-  verifica se o missil colidiu com  o ovni
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
verifica_colisao_missil:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R11


  MOV R1, estado_missil
  MOV R1, [R1]
  CMP R1, 0 ; verificar se o missil está ativado ou nao
  JZ sair_verifica_colisao_missil ; se nao estiver saimos

  MOV R1, OVNI_INDICE_LINHA
  SHL R1, 1
  MOV R2, [R0 + R1] ; obter a linha superior do ovni
  MOV R1, OVNI_INDICE_COLUNA
  SHL R1, 1
  MOV R3, [R0 + R1] ; obter a coluna do lado esquerdo esquerdo do ovni
  MOV R1, OVNI_INDICE_ALTURA
  SHL R1, 1
  MOV R4, [R0 + R1] ; obter a altura do ovni
  MOV R5, R4 ; variavel auxiliar com o valor da altura do ovni
  MOV R6, missil_coordenadas
  MOV R7, [R6] ; obter a linha do missil
  MOV R8, [R6 + 2] ; obter a coluna do missil

  MOV R1, OVNI_INDICE_LARGURA
  SHL R1, 1
  MOV R1, [R0 + R1] ; obter a altura do ovni
  ADD R1, R3

  ADD R5, R2 ; adicionar a largura e a linha do ovni para obter a linha inferior
  CMP R7, R5 ; compara linha inferior
  JGT sair_verifica_colisao_missil
  CMP R7, R2 ; compara linha superior
  JLT sair_verifica_colisao_missil
  CMP R3, R8 ; compara coluna esquerda
  JGT sair_verifica_colisao_missil
  CMP R1, R8 ; compara coluna direita
  JLT sair_verifica_colisao_missil

  MOV R1, OVNI_INDICE_TIPO
  SHL R1, 1
  MOV R3, [R0 + R1] ; obter o tipo do ovni
  CMP R3, -1 ; verifica o tipo do ovni que colidiu com a nave
  JZ missil_colidiu_nave_inimiga
  JMP explode_ovni

  missil_colidiu_nave_inimiga:
    MOV R5, ENERGIA_INCREMENTO_EXPLOSAO
    CALL aumentar_energia

  explode_ovni:
    MOV R9, SOM_EXPLOSAO_INIMIGO
    CALL tocar_media
    CALL desativar_missil ; desativa o missil
    MOV R2, 0
    CALL alterar_estado_ovni

    MOV R2, OVNI_INDICE_ECRA
    SHL R2, 1
    MOV R1, [R0 + R2]
    CALL apagar_ecra ; apaga o ecra onde o ovni está desenhado

    MOV R1, ECRA_EXPLOSAO
    CALL seleciona_ecra ; seleciona o ecra da explosao
    MOV R6, COR_EXPLOSAO
    CALL alterar_cor_caneta ; altera acor da caneta para a da explosao

    MOV R1, OVNI_INDICE_LINHA
    SHL R1, 1
    MOV R3, [R0 + R1] ; coordenada Y
    MOV R1, OVNI_INDICE_COLUNA
    SHL R1, 1
    MOV R4, [R0 + R1] ; coordenada X

    MOV R1, explosao ; desenho da explosao
    MOV R11, 5  ; largura da explosao
    CALL desenha_objeto ; desenhar objeto

  sair_verifica_colisao_missil:
    POP R11
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    RET

; **********************************************************************
; verifica_colisao_nave-  verifica se a nave colidiu com o ovni
;
; Argumentos:   R0 - base da tabela do ovni
;
; **********************************************************************
verifica_colisao_nave:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9

  MOV R1, OVNI_INDICE_LINHA
  SHL R1, 1
  MOV R2, [R0 + R1] ; obter a linha superior do ovni
  MOV R1, OVNI_INDICE_COLUNA
  SHL R1, 1
  MOV R3, [R0 + R1] ; obter a coluna do lado esquerdo esquerdo do ovni
  MOV R1, OVNI_INDICE_ALTURA
  SHL R1, 1
  MOV R4, [R0 + R1] ; obter a altura do ovni
  MOV R5, R4 ; variavel auxiliar com o valor da altura do ovni
  MOV R6, nave_coordenadas
  MOV R7, [R6] ; obter a linha da nave
  MOV R8, [R6 + 2] ; obter a coluna da nave
  MOV R9, LARGURA_NAVE
  ADD R9, R8
  MOV R1, OVNI_INDICE_LARGURA
  SHL R1, 1
  MOV R1, [R0 + R1] ; obter a altura do ovni
  ADD R1, R3

  ADD R5, R2 ;adicionar a largura e a linha do ovni para obter a linha inferior
  CMP R7, R5 ; compara linha superior da nave com a linha inferior do ovni
  JGT sair_verifica_colisao_nave
  CMP R3, R9 ; compara a coluna esquerda do ovni com a coluna direita da nave
  JGT sair_verifica_colisao_nave
  CMP R1, R8 ; compara a coluna direita do ovni com a coluna esquerda da nave
  JLT sair_verifica_colisao_nave

  MOV R1, OVNI_INDICE_TIPO
  SHL R1, 1
  MOV R3, [R0 + R1] ; obter o tipo do ovni

  MOV R2, 0
  CALL alterar_estado_ovni ; altera o estado do ovni para 0 dado que este colidiu com a nave

  CMP R3, 1 ; verifica o tipo do ovni que colidiu com a nave
  JZ nave_colidiu_asteroide

  ; este codigo só executa se colidimos com uma nave inimiga
  MOV R9, SOM_EXPLOSAO_NAVE
  MOV R4, IMAGEM_EXPLOSAO
  CALL gameover
  JMP sair_verifica_colisao_nave

  nave_colidiu_asteroide: ; se colidimos com um asteroide em vez de perdermos o jogo, ganhamos energia
    MOV R5, ENERGIA_INCREMENTO_MINERACAO
    CALL aumentar_energia
    MOV R9, SOM_MINERACAO
    CALL tocar_media

  sair_verifica_colisao_nave:
    POP R9
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    RET



; **********************************************************************
; missil - Processo cooperativo responsalvel por movimentar,
;          desenhar e desativar o missil
; **********************************************************************
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

    ; desenha o missil
    MOV R0, missil_coordenadas
    MOV R3, [R0]
    MOV R9, [R0+2]
    MOV R6, 1
    CALL desenha_pixel
    JMP sair_missil

  missil_desativar:
    CALL desativar_missil

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


;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; Rotina Auxiliar do missil
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

; **********************************************************************
; desativar_missil-  altera o estado do missil para 0 (inativo)
; **********************************************************************
desativar_missil:
  PUSH R1
  PUSH R4
  PUSH R5
  MOV R1, ECRA_MISSIL
  CALL seleciona_ecra ; seleciona o ecra do missil

  MOV R4, estado_missil ; Obt�m o endere�o da mem�ria onde o estado do missil está guardado
  MOV R5, 0
  MOV [R4], R5 ; altera o estado do missil para 0 (inativo)
  CALL apagar_ecra ; apaga o ecra do missil para dar lugar ao missil desenhado na nova posicao
  POP R5
  POP R4
  POP R1
  RET


; **********************************************************************
; controlo - Processo cooperativo responsalvel pelo fluxo do jogo,
;            alterando o estado do jogo consoante a tecla premida
;
; **********************************************************************
controlo:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R9

  MOV R1, jogo        ; base da tabela jogo
  MOV R1, [R1]        ; le o estado do jogo
  MOV R2, tecla_premida ; base da tabela da tecla premida
  MOV R2, [R2]      ; le a tecla premida

  MOV R4, ultima_tecla ; base da tabela 'ultima tecla'
  MOV R4, [R4]  ; le o valor da ultima tecla premida
  CMP R2, R4 ; se a tecla atual for igual à tecla antiga significa que nao deixámos de pressionar a tecla
  JZ sair_controlo ; nesse caso saimos


  MOV R5, TECLA_CREDITOS
  CMP R2, R5
  JZ creditos          ; verificar se a tecla premida foi a tecla de mostrar os creditos
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

    CALL desenha_nave
    MOV R3, JOGO_CORRER ; define o argumento da rotina alterar_estado_jogo
    CALL inicializar    ; inicialiar tudo com o seu valor original
    MOV R9, VIDEO
    CALL tocar_media   ; toca o video
    MOV R9, MUSICA
    CALL tocar_media ; toca a musica
    MOV R9, VIDEO_CREDITOS
    CALL termina_media ; termina de tocar o som dos creditos
    CALL inicializar
    JMP modificar_estado ; salta para modificar o estado do jogo

  creditos:
    MOV R2, JOGO_TERMINAR
    CMP R1, R2
    JNZ sair_controlo
    MOV R9, VIDEO_CREDITOS
    CALL tocar_media
    JMP sair_controlo

  pausar:
    CMP R1, JOGO_CORRER
    JZ pausa_jogo   ; se o jogo esta a correr mudamos o seu estado para pausa
    CMP R1, JOGO_PAUSA
    JZ despausa_jogo ; se o jogo esta em pausa mudamos o seu estado para correr
    JMP sair_controlo
    pausa_jogo:
      MOV R3, JOGO_PAUSA ; define o argumento da rotina alterar_estado_jogo
      CALL pausa_media ; pausa os recursos multimedia
      MOV R4, IMAGEM_PAUSA ; define a imagem a mostar, neste caso a imagem de pausa
      CALL mostra_imagem ; mostra a imagem de pausa
      JMP modificar_estado ; salta para modificar o estado do jogo
    despausa_jogo:
      CALL despausa_media ; despausa os recursos multimedia
      CALL apagar_imagem ; apaga a imagem de foreground
      MOV R3, JOGO_CORRER ; define o argumento da rotina alterar_estado_jogo
      JMP modificar_estado ; salta para modificar o estado do jogo

  terminar:
    MOV R3, JOGO_TERMINAR ; define o argumento da rotina alterar_estado_jogo
    CMP R1, R3
    JZ sair_controlo ; se o estado do jogo já está como terminado entao saimos

    MOV R4, IMAGEM_GAMEOVER
    CALL gameover
    JMP sair_controlo

  modificar_estado:
    CALL alterar_estado_jogo ; modifica a variavel de estado do jogo para o novo valor

  sair_controlo:
    POP R9
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    RET



; **********************************************************************
; gerador- Processo cooperativo responsalvel por incrementar uma variavel em memória
;          o que irá permitir gerar numeros pseudo-aleatórios posteriormente
;
; **********************************************************************
gerador:
  PUSH R0
  PUSH R1

  MOV R0, contador_aleatorio  ; Obtem a base da tabela do contador
  MOV R1, [R0]
  ADD R1, 1 ; incrementa em 1 o contador
  MOV [R0], R1 ; guarda o valor na memoria

  POP R0
  POP R1
  RET



;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;
; Rotinas Auxiliares
;
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
  PUSH R9

  CALL termina_media
  MOV R1, energia  ; base da tabela da energia
  MOV R2, ENERGIA_INICIAL ; inicializa r2 com a energia inicial da nave
  MOV [R1], R2 ; guarda o valor na memoria
  CALL atualiza_display
  CALL apagar_imagem ; apagar qualquer imagem do mediacenter
  CALL apagar_ecras ; apaga todos os ecras

  CALL desenha_nave
  ; inicializar as words da tabela de eventos a 0
  MOV R2, 0
  MOV R1, tabela_eventos
  MOV [R1], R2
  MOV [R1+2], R2
  MOV [R1+4], R2

  POP R9
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
; tocar_media - Toca o som / video especificado
;
; Argumentos: R9 - Video / som a reprduzir
;
; **********************************************************************
tocar_media:
  PUSH R0
  PUSH R1
  MOV  R0, DEFINE_VIDEO
  MOV  [R0], R1            ; define o video a tocar (o valor de R1 nao é relevante)


  MOV  R0, PLAY_VIDEO
  MOV  [R0], R9           ; Toca o video
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
  PUSH R0
  MOV  R0, COR_CANETA
  MOV  [R0], R6          ; altera a cor da caneta
  POP R0
  RET


; **********************************************************************
; termina_media- termina a reprodução do video ou som especificado
;
; Argumentos: R9 - video ou som a terminar
;
; **********************************************************************
termina_media:
  PUSH R0
  MOV  R0, STOP_VIDEO
  MOV  [R0], R9          ; para o video
  POP R0
  RET


  ; **********************************************************************
  ; loop_media- toca o video ou som especificado
  ;
  ; Argumentos: R9 - video ou som a reproduzir
  ;
  ; **********************************************************************
  loop_media:
    PUSH R0
    MOV  R0, LOOP_VIDEO
    MOV  [R0], R9          ; para o video
    POP R0
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
;
;Retorna:      R3 - proxima linha
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
;
; Retorna:      R9 - proxima coluna
; **********************************************************************
desenha_pixel:
      PUSH  R0
      PUSH R10

      ; verificar se não estamos a desenhar pixeis fora do ecrã
      MOV R0, LIN_MAX
      CMP R3, R0
      JGT sair_desenha_pixel
      MOV R0, COL_MIN
      CMP R9, R0
      JLT sair_desenha_pixel
      MOV R0, COL_MAX
      CMP R9, R0
      JGT sair_desenha_pixel

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

  sair_desenha_pixel:
        POP R10
        POP  R0
        RET


; **********************************************************************
; AUMENTAR_ENERGIA- Aumenta a energia de acordo com a percentagem da
;                   energia inicial especificada
;
; Argumento:   R5 - percentagem do valor inicial a aumentar
;
; **********************************************************************
aumentar_energia:
  PUSH R1
  PUSH R2
  PUSH R3
  PUSH R5
  PUSH R6

  MOV R1, energia  ; base da tabela da energia
  MOV R2, [R1] ; le o valor de energia

  MOV R6, ENERGIA_INICIAL
  MOV R3, FATOR_100
  MUL R6, R5 ; multiplicar a energia inicial pelo valor de diminuição
  DIV R6, R3 ; dividir o resultado por 100

  ADD R2, R6; aumenta a energia
  MOV R3, ENERGIA_INICIAL
  CMP R2, R3
  JGE lida_energia_maxima ; verificar se a energia nao ultrapassa os 100%
  JMP atualiza_energia

  lida_energia_maxima:
    MOV R2, ENERGIA_INICIAL

  atualiza_energia:
    MOV [R1], R2 ; guarda o novo valor na memoria
    CALL atualiza_display ; atualiza os displays com o novo valor da energia

  sair_aumentar_energia:
    POP R6
    POP R5
    POP R3
    POP R2
    POP R1
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
  PUSH R9

  MOV R1, energia  ; base da tabela da energia
  MOV R2, [R1] ; le o valor de energia

  MOV R6, ENERGIA_INICIAL
  MOV R3, FATOR_100
  MUL R6, R5 ; multiplicar a energia inicial pelo valor de diminuição
  DIV R6, R3 ; dividir o resultado por 100

  SUB R2, R6; diminui a energia


  MOV [R1], R2 ; guarda o novo valor na memoria
  CALL atualiza_display ; atualiza os displays com o novo valor da energia
  CMP R2, 0 ; se o valor da energia for 0 então perdemos o jogo
  JZ diminuir_energia_gameover
  JMP sair_diminuir_energia

    diminuir_energia_gameover:
    MOV R9, SOM_GAMEOVER
    MOV R4, IMAGEM_GAMEOVER
    CALL gameover


  sair_diminuir_energia:
    POP R9
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

  MOV R9, FATOR_1000
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


; **********************************************************************
; PAGAR_ECRAS - Apaga todos os pixeis de todos os ecras
; **********************************************************************
apagar_ecras:
  PUSH R0
  PUSH R1
  MOV R1, 1
  MOV  R0, APAGA_ECRAS
  MOV  [R0], R1            ; apaga todos os pixels de todos os ecrãs (o valor de R1 não é relevante)
  POP R1
  POP R0
  RET



; **********************************************************************
; gameover - trata de quando o jogador perde o jogo (ou o jogo é terminado)
;
; Argumento:   R9 - som a tocar
;              R4 - imagem a mostrar
;
; **********************************************************************
gameover:
  PUSH R0
  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R9
  PUSH R11

  MOV R9, MUSICA
  CALL termina_media
  CALL tocar_media
  CALL apagar_ecras
  MOV R3, JOGO_TERMINAR
  CALL alterar_estado_jogo ; altera o estado de jogo
  CALL mostra_imagem

  ; alterar o estado do missil para 0 (inativo)
  MOV R1, estado_missil
  MOV R2, 0
  MOV [R1], R2

  ; alterar as coordenas da nave para o seu valor inicial
  MOV R1, nave_coordenadas
  MOV R2, NAVE_LINHA_INICIAL
  MOV R3, NAVE_COLUNA_INICIAL
  MOV [R1], R2
  MOV [R1 + 2], R3

  MOV R11, ovnis
  MOV R3, 0
  MOV R4, NUMERO_OVNIS
  SHL R4, 1
  ciclo_ovnis_desativar: ; desativar todos os ovnis ativos
    MOV R0, [R11 + R3]
    ADD R3, 2
    CMP R3, R4
    JGT sair_gameover
    MOV R5, OVNI_INDICE_ESTADO
    SHL R5, 1 ; multiplicar o indice por dois porque estamos a aceder a uma tabela de words
    MOV R2, [R0 + R5] ; obtem o estado do ovni (inativo ou ativo)
    CMP R2, 1 ; se estiver ativo então temos que desativar o ovni
    JZ desativa
    JMP ciclo_ovnis_desativar

  desativa:
    MOV R2, 0
    CALL alterar_estado_ovni
    JMP ciclo_ovnis_desativar

  sair_gameover:
    POP R11
    POP R9
    POP R5
    POP R4
    POP R3
    POP R2
    POP R0
    RET




;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; Rotinas Interrupção
;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

relogio_ovnis:
  PUSH R0  ; Salva registos
  PUSH R1
  PUSH R2

  MOV R0, 1
  MOV R2, INDICE_OVNIS
  SHL R2, 1   ; multiplicar o indice por 2 porque vamos aceder a uma tabela de words
  MOV R1, tabela_eventos  ; Obtem endereço do evento da rotina 0 (relogio_ovnis)
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
  MOV R1, tabela_eventos  ; Obtem endereço do evento da rotina 1 (relogio_missil)
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
  MOV R1, tabela_eventos  ; Obtem endereço do evento da rotina 2 (relogio_energia)
  MOV [R1 + R2], R0 	; Sinaliza que esta ocorreu movendo 1 para a flag

  POP R2
  POP R1	; Repoe registos
  POP R0
  RFE
