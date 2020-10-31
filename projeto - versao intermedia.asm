
; **********************************************************************
; * Constantes
; **********************************************************************
; ATENÇÃO: constantes hexadecimais que comecem por uma letra devem ter 0 antes.
;          Isto não altera o valor de 16 bits e permite distinguir números de identificadores
DISPLAYS   EQU 0A000H  ; endereço dos displays de 7 segmentos (periférico POUT-1)
TEC_LIN    EQU 0C000H  ; endereço das linhas do teclado (periférico POUT-2)
TEC_COL    EQU 0E000H  ; endereço das colunas do teclado (periférico PIN)
LINHA      EQU 1       ; linha a testar (1ª linha, 1000b)
COUNT	     EQU 0	   ; contador de coluna
NUMERO     EQU 0	   ; numero inicial do display
TEMPO_DELAY EQU 6000H	; delay dado às teclas continuas
FATOR      EQU 1000

; **********************************************************************
; * Código
; **********************************************************************
PLACE      0
inicio:
; inicializações
  MOV  R2, TEC_LIN   ; endereço do periférico das linhas
  MOV  R3, TEC_COL   ; endereço do periférico das colunas
  MOV  R4, DISPLAYS  ; endereço do periférico dos displays
	MOV R5, NUMERO    	; inicializar variavel do display a 0
	MOV R6, COUNT		; inicializar contador de coluna a 0
	MOV R8, 16
  MOV R11, 0        ; inicializar resultado da conversão hexadecimal para decimal
  MOV  R1, LINHA     ; Linha em que começa o varrimento do teclado
	MOV [R4], R5      ; inicializar display com valor de R5 (0)


; corpo principal do programa
ciclo:
  MOV R11, 0        ; inicializar resultado da conversão hexadecimal para decimal
	MOV R6, COUNT		; inicializar contador de coluna a 0
	MOV R7, 0
  MOV R9, FATOR    ; R9 = 1000 decimal -> fator
  MOV  R1, LINHA     ; Linha em que começa o varrimento do teclado
  MOV  R8, 16    ; Verificar se R1 ainda está dentro dos limites 0-2-4-8
	JMP espera_tecla

espera_tecla:        ; neste ciclo espera-se até uma tecla ser premida
  MOVB [R2], R1      ; escrever no periférico de saída (linhas)
  MOVB R0, [R3]      ; ler do periférico de entrada (colunas)
  CMP  R0, 0         ; há tecla premida?
  JNZ   verificar_tecla  ; se uma tecla estiver premida vamos verificar qual é a tecla
  SHL R1, 1           ; equivalente a multiplicar por 2. Desta forma, fazemos o varrimento de todas as linhas do teclado: 1, 1*2=2, 2*2=4, 4*2=8
  CMP R1, R8          ;Se R1 = 16 fazemos o varrimento das linhas do teclado de novo
  JZ repetir_varrimento
  JMP espera_tecla  ; se nenhuma tecla premida, repete

repetir_varrimento:
  MOV R1, LINHA
  JMP espera_tecla

verificar_tecla:
  MOV R7, 0
  JMP converter_bin_para_linha

converter_bin_para_linha:   ; este ciclo converte binário para a linha correspondente ex:0100b -> linha 02
  SHR R1, 1     			; mover um bit para a direita para contar a linha
  JZ converter_bin_para_coluna  ; se for zero saltamos para 'converter_bin_para_coluna'
  ADD R7,1    			; se não for zero adicionamos um ao contador da linha
  JMP converter_bin_para_linha  ; repetimos o ciclo

converter_bin_para_coluna:   ; este ciclo converte binário para a coluna correspondente ex:0010b -> coluna 01
  SHR   R0,1     			; mover um bit para a direita para contar a coluna
  JZ    verificar_linha  	; se for zero saltamos para 'funcao_tecla' onde verificamos qual a tecla premida
  ADD   R6,1    			; se não for zero adicionamos um ao contador
  JMP   converter_bin_para_coluna  ; repetimos o ciclo

verificar_linha:
  MOV R1, LINHA     ; Voltar a carregar o valor da primeira linha a ser varrida em R1 porque este foi alterado

  CMP R7, 0  				; verificar se a linha ativada é a linha 0
  JZ linha_0
  CMP R7, 1				; verificar se a linha ativada é a linha 1
  JZ linha_1
  CMP R7, 2  				; verificar se a linha ativada é a linha 2
  JZ linha_2
  CMP R7, 3				; verificar se a linha ativada é a linha 3
  JZ linha_3

linha_0:				; verificar qual a tecla premida na linha 0 e saltar para a sua funcao
	CMP R6, 0  				;  verificar se a coluna ativada é a coluna 0 -> tecla 0
	JZ decrementar_continuo
	CMP R6, 1				  ;  verificar se a coluna ativada é a coluna 0 -> tecla 1
	JZ incrementar_continuo
	CMP R6, 2  				;  verificar se a coluna ativada é a coluna 0 -> tecla 2
	JZ decrementar_descontinuo
	CMP R6, 3				;  verificar se a coluna ativada é a coluna 0 -> tecla 3
	JZ incrementar_descontinuo

linha_1:      ;verificar qual a tecla premida na linha 1 e saltar para a sua funcao
  CMP R6, 0  				;  verificar se a coluna ativada é a coluna 0 -> tecla 4
  JZ ciclo
  CMP R6, 1				;  verificar se a coluna ativada é a coluna 0 -> tecla 5
  JZ ciclo
  CMP R6, 2  				;  verificar se a coluna ativada é a coluna 0 -> tecla 6
  JZ ciclo
  CMP R6, 3				;  verificar se a coluna ativada é a coluna 0 -> tecla 7
  JZ ciclo

linha_2:        ; verificar qual a tecla premida na linha 2 e saltar para a sua funcao
  CMP R6, 0  				;  verificar se a coluna ativada é a coluna 0 -> tecla 8
  JZ ciclo
  CMP R6, 1				;  verificar se a coluna ativada é a coluna 0 -> tecla 9
  JZ ciclo
  CMP R6, 2  				;  verificar se a coluna ativada é a coluna 0 -> tecla A
  JZ ciclo
  CMP R6, 3				;  verificar se a coluna ativada é a coluna 0 -> tecla B
  JZ ciclo

linha_3:          ;verificar qual a tecla premida na linha 3 e saltar para a sua funcao
  CMP R6, 0  				;  verificar se a coluna ativada é a coluna 0 -> tecla C
  JZ ciclo
  CMP R6, 1				;  verificar se a coluna ativada é a coluna 0 -> tecla D
  JZ ciclo
  CMP R6, 2  				;  verificar se a coluna ativada é a coluna 0 -> tecla E
  JZ ciclo
  CMP R6, 3				;  verificar se a coluna ativada é a coluna 0 -> tecla F
  JZ ciclo



decrementar_continuo:
	CMP R5, 0		          ; Impedir que sejam contados numeros negativos
	JZ ciclo
	SUB R5, 1		         ; decrementar contador
	JMP converter_hex_para_dec


incrementar_continuo:
	ADD R5, 1 		       ; incrementar contador
	JMP converter_hex_para_dec


decrementar_descontinuo:
	MOV R7, 1		        ; como a tecla é descontinua, atribuimos o valor 1 ao registo R7
	CMP R5, 0		        ; Impedir que sejam contados numeros negativos
	JZ ciclo
	SUB R5, 1		        ; decrementar contador
	JMP converter_hex_para_dec


incrementar_descontinuo:
	MOV R7, 1	         	; como a tecla é descontinua, atribuimos o valor 1 ao registo R7
	ADD R5, 1		        ; decrementar contador
	JMP converter_hex_para_dec


ha_tecla:				     ; nesta rotina verificamos se as teclas descontinuas contiuam premidas
  MOVB [R2], R1      ; escrever no periférico de saída (linhas)
  MOVB R0, [R3]      ; ler do periférico de entrada (colunas)
  CMP  R0, 0         ; há tecla premida?
  JZ  ciclo     ; se ainda houver uma tecla premida, espera até não haver
  SHL R1, 1
  CMP R1, R8
  JMP repetir_ha_tecla
	JMP ha_tecla

repetir_ha_tecla:
  MOV R1, LINHA
  JMP ha_tecla


converter_hex_para_dec:
  MOV R0, R5
  MOD R0, R9          ; Dividir contador pelo fator
  MOV R10, 10         ;R10 -> fator
  DIV R9, R10
  MOV R6, R0
  DIV R6, R9
  SHL R11, 4
  OR R11, R6
  CMP R9, 1
  JNZ converter_hex_para_dec
  JMP escrever_display


escrever_display:
	MOV [R4], R11      ; escreve linha e coluna nos displays
  MOV R8, TEMPO_DELAY ; adiciona o tempo de delay a R8
	CMP R7, 1			; a tecla é descontinua?
	JZ ha_tecla    ; se a tecla for descontinua, saltamos para a rotina 'ha_tecla'
	JMP delay			; caso contrário voltamos ao inicio
	JMP escrever_display


delay:      	;esta rotina tem como objetivo diminuir a velocidade a que o contador aumenta ou diminui em regime continuo
	CMP R8, 0
	JZ ciclo 	; se R7 for 0, voltamos ao inicio
	SUB R8, 1	; caso contrário, decrementamos R7 até este ser 0
	JMP delay
