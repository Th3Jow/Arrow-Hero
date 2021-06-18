;Trabalho de Organizacao de Computadores Digitais
;----------------------------------------------------
;Desenvolvedores:
;	Jonattan Willian
;
;----------------------------------------------------
; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco						0000 0000
; 256 marrom					0001 0000
; 512 verde						0010 0000
; 768 oliva						0011 0000
; 1024 azul marinho				0100 0000
; 1280 roxo						0101 0000
; 1536 teal						0110 0000
; 1792 prata					0111 0000
; 2048 cinza					1000 0000
; 2304 vermelho					1001 0000
; 2560 lima						1010 0000
; 2816 amarelo					1011 0000
; 3072 azul						1100 0000
; 3328 rosa						1101 0000
; 3584 aqua						1110 0000
; 3840 branco					1111 0000

;----------------------------------------------------

loadn r7, #0						; Aleatoriedade do Jogo
loadn r6, #4
jmp main

Bug: string "     G A M E  O V E R !!!     " 					; NAO REMOVA A STRING; RESULTA EM UM BUG CASO REMOVIDA
PressEnter : string "         PRESS ENTER TO START           "  ; imprimir na 1080
Aquecis : string "                WARM UP                 "  ; imprimir na 600
PressW : string "                PRESS W                 " ; imprimir na 1080
PressA : string "                PRESS A                 " ; imprimir na 1080
PressS : string "                PRESS S                 " ; imprimir na 1080
PressD : string "                PRESS D                 " ; imprimir na 1080
Ready : string "                 READY?                 "  ; imprimir na 600
Score: string "                            SCORE:      "		; imprimir na 1119

LETRA: var #1		; Contem a letra que foi digitada

ENTER: var #1
static ENTER, #13	; Tabela ASCII ENTER

W_BUTTON: var #1
static W_BUTTON, #119	; Tabela ASCII W

A_BUTTON: var #1
static A_BUTTON, #97	; Tabela ASCII A

S_BUTTON: var #1
static S_BUTTON, #115	; Tabela ASCII S

D_BUTTON: var #1
static D_BUTTON, #100	; Tabela ASCII D

Y_BUTTON: var #1
static Y_BUTTON, #121	; Tabela ASCII Y

N_BUTTON: var #1
static N_BUTTON, #110	; Tabela ASCII D

ScoreUnidade : var #1
ScoreDezena : var #1
ScoreCentena : var #1

static ScoreUnidade, #47 		;'0' - 1
static ScoreDezena, #'0'
static ScoreCentena, #'0'

PosicaoUnidade : var #1
PosicaoDezena : var #1
PosicaoCentena : var #1

static PosicaoUnidade, #1157
static PosicaoDezena, #1156
static PosicaoCentena, #1155


;--------------- Codigo principal ---------------
main:
	inc r7
	mod r7, r7, r6
	loadn r1, #telaInicialLinha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #0  					; Cor Branca!
	call ImprimeTela2   			; Rotina de Impresao de Cenario na Tela Inteira

	call Delay_15seg 				; Delay pra fazer efeito
	loadn r0, #1080
	loadn r1, #PressEnter
	loadn r2, #3072					; Cor azul
	call ImprimeStr2 				; Imprime PressEnter em azul

	load r2, ENTER
	inchar r3
	cmp r2, r3					; Se o enter for apertado, vai pro warmUp
	jne main 					; Se nao fica num loop ate o enter ser teclado

	loadn r0, #1080
	loadn r1, #PressEnter
	loadn r2, #512
	call ImprimeStr2 		; Imprime PressEnter em verde
	
	warmUp:
		loadn r0, #5
		loadn r2, #0
		Wait1:					; Delay para aparecer a msg em verde
			call Delay_15seg
			dec r0
			cmp r0, r2
			jnz Wait1

		call ApagaTela 			; Apaga a Tela
		loadn r0, #600
		loadn r1, #Aquecis
		loadn r2, #0
		call ImprimeStr2 		; Imprime "Warm Up" em branco
		loadn r0, #40
		Wait2:					; Delay pra aparecer a msg
			call Delay_15seg
			dec r0
			cmp r0, r2
			jnz Wait2

		W_Test:
		loadn r1, #telaArrowUpLinha0
		loadn r2, #0
		call ImprimeTela 		; Imprime a tela com a seta para cima
		loadn r0, #1080
		loadn r1, #PressW
		call ImprimeStr2 		; Imprime "Press W"
		load r2, W_BUTTON
		W_Test1:
			inc r7
			mod r7, r7, r6
			inchar r3
			cmp r2, r3						; Se o W for apertado, vai pro A_Test
			jne W_Test1
		loadn r1, #telaArrowUpLinha0
		loadn r2, #512
		call ImprimeTela2 					; Pisca a tela em verde
		call Delay_15seg

		A_Test:
		loadn r1, #telaArrowLeftLinha0
		loadn r2, #0
		call ImprimeTela 					; Imprime a tela com a seta para esquerda
		loadn r0, #1080
		loadn r1, #PressA
		call ImprimeStr2 					; Imprime "Press A"
		load r2, A_BUTTON
		A_Test1:
			inc r7
			mod r7, r7, r6
			inchar r3
			cmp r2, r3						; Se o A for apertado, vai pro S_Test
			jne A_Test1
		loadn r1, #telaArrowLeftLinha0
		loadn r2, #512
		call ImprimeTela2 					; Pisca a tela em verde
		call Delay_15seg

		S_Test:
		loadn r1, #telaArrowDownLinha0
		loadn r2, #0
		call ImprimeTela 					; Imprime tela com a seta para baixo
		loadn r0, #1080
		loadn r1, #PressS
		call ImprimeStr2 					; Imprime "Press S"
		load r2, S_BUTTON
		S_Test1:
			inc r7
			mod r7, r7, r6
			inchar r3
			cmp r2, r3						; Se o S for apertado, vai pro D_Test
			jne S_Test1
		loadn r1, #telaArrowDownLinha0
		loadn r2, #512
		call ImprimeTela2 					; Pisca a tela em verde
		call Delay_15seg

		D_Test:
		loadn r1, #telaArrowRightLinha0
		loadn r2, #0
		call ImprimeTela 					; Imprime a tela com a seta para direita
		loadn r0, #1080
		loadn r1, #PressD
		call ImprimeStr2 					; Imprime "Press D"
		load r2, D_BUTTON
		D_Test1:
			inc r7
			mod r7, r7, r6
			inchar r3
			cmp r2, r3						; Se o D for apertado, vai pro Game
			jne D_Test1
		loadn r1, #telaArrowRightLinha0
		loadn r2, #512
		call ImprimeTela2 					; Pisca a tela em verde
		call Delay_15seg
		
		Ready:
		call ApagaTela 						; Apaga a tela
		loadn r0, #600
		loadn r1, #Ready
		loadn r2, #0
		call ImprimeStr2 					; Imprime "Ready?" e espera um tempo pra comeca
		loadn r0, #40
		Wait3:
			call Delay_15seg
			dec r0
			cmp r0, r2
			jnz Wait3
		loadn r5, #100 						; "Tempo" (equivalente ao "a") do timer do DigLetraTimer

		Game:
			call ApagaTela 					; Apaga a tela e comeca o Jogo
			call score 						; Mesma mecanica dos Testes, com a diferenca q agora
			loadn r0, #0					; Tem o score chamado pela call score
			cmp r0, r7 						; E tbm, tempo para as leituras no teclado (DigLetraTimer)
			jeq W_Game
			loadn r0, #1
			cmp r0, r7
			jeq A_Game
			loadn r0, #2
			cmp r0, r7
			jeq S_Game
			jmp D_Game

			W_Game:
				loadn r1, #telaArrowUpLinha0
				loadn r2, #0
				call ImprimeTela2
				loadn r0, #1119
				loadn r1, #Score
				loadn r2, #0
				call ImprimeStr2
				load r2, W_BUTTON
				call DigLetraTimer
				cmp r3, r2
				jne GameOver
				loadn r1, #telaArrowUpLinha0
				loadn r2, #512
				call ImprimeTela2
				call Delay_15seg
				jmp Game

			A_Game:
				loadn r1, #telaArrowLeftLinha0
				loadn r2, #0
				call ImprimeTela2
				loadn r0, #1119
				loadn r1, #Score
				loadn r2, #0
				call ImprimeStr2
				load r2, A_BUTTON
				call DigLetraTimer
				cmp r3, r2
				jne GameOver
				loadn r1, #telaArrowLeftLinha0
				loadn r2, #512
				call ImprimeTela2
				call Delay_15seg
				jmp Game

			S_Game:
				loadn r1, #telaArrowDownLinha0
				loadn r2, #0
				call ImprimeTela2
				loadn r0, #1119
				loadn r1, #Score
				loadn r2, #0
				call ImprimeStr2
				load r2, S_BUTTON
				call DigLetraTimer
				cmp r3, r2
				jne GameOver
				loadn r1, #telaArrowDownLinha0
				loadn r2, #512
				call ImprimeTela2
				call Delay_15seg
				jmp Game

			D_Game:
				loadn r1, #telaArrowRightLinha0
				loadn r2, #0
				call ImprimeTela2
				loadn r0, #1119
				loadn r1, #Score
				loadn r2, #0
				call ImprimeStr2
				load r2, D_BUTTON
				call DigLetraTimer
				cmp r3, r2
				jne GameOver
				loadn r1, #telaArrowRightLinha0
				loadn r2, #512
				call ImprimeTela2
				call Delay_15seg
				jmp Game

		GameOver:
			loadn r1, #telaGameOverLinha0
			loadn r2, #0
			call ImprimeTela 						; Caso o tempo excedido ou tecla errada
			load r1, ScoreCentena					; Imprime a tela de gameover
			loadn r2, #492							; Imprime a centena do score na pos 492
			outchar r1, r2
			load r1, ScoreDezena					; Imprime a dezena do score na pos 493
			loadn r2, #493
			outchar r1, r2
			load r1, ScoreUnidade 					; Imprime a unidade do score na pos 494
			loadn r2, #494
			outchar r1, r2
			loadn r1, #47
			store ScoreUnidade, r1 					; Seta a unidade como 47 ('0' - 1)
			loadn r1, #'0'
			store ScoreDezena, r1 					; Seta a centena e dezena como 48 ('0')
			store ScoreCentena, r1
			GameOver_1:
				inchar r3
				load r2, Y_BUTTON
				cmp r3, r2 							; Caso a letra 'y' seja teclada, volta pro warmUp
				jeq warmUp
				load r2, N_BUTTON
				cmp r3, r2 							; Caso a letra 'n' seja teclada, vai para End
				jeq End
				jmp GameOver_1 						; Fica em um loop ate 'n' ou 'y' ser teclados

		End:
			call ApagaTela 							; Apaga a tela e encerra o Jogo
			halt

;----------------------------------------------------

;********************************************************
;              DIGITE UMA LETRA COM TIMER
;********************************************************
DigLetraTimer:	; Espera que uma tecla seja digitada e salva no R3
	push r0
	push r1
	push r2
	push r5
	loadn r2, #255				; Se nao digitar nada vem 255
	
	loadn r1, #25 				; Limite do "TIMER" ("a")
	cmp r5, r1 					; Se r5 ("TIMER a") for menor que r1, seta r5 igual a r1 (limite)
	jeg Dig_Delay_volta2
	loadn r5, #25				; a - Quanto maior, mais lento fica o tempo; quanto menor mais rapido

   	Dig_Delay_volta2:			; Quebrou o contador acima em duas partes (dois loops de decremento)
   		loadn r0, #100000		; b - atrasa o objeto
   	Dig_Delay_volta:			; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	   	
	   	inc r7 					; r7 eh a Aleatoriedade do Jogo, sera incrementada ate o loop acabar
	   							; ou quando uma tecla for pressionada
	   	
	   	inchar r3 				; Le o teclado, se nada for digitado = 255
	   	cmp r2, r3 				; compara r0 com 255
	   	jne Dig_Delay_volta3	; Se r0 for diferente de 255, sai do loop
	   	dec r0
	   	jnz Dig_Delay_volta
	   	mod r7, r7, r6 			; r7 = r7 % r6, para nao ultrapassar o limite do Registrador

	   	dec r5 					; decrementa r5 pra diminuir o TIMER conforme o jogo avanca (+ dificil)
	   	jnz Dig_Delay_volta2

	Dig_Delay_volta3:
		mod r7, r7, r6 			; r7 = r7 % r6, (r6 = 4) ja que existem 4 possiveis opcoes (0 a 3)
		pop r5
		pop r2 					; Resgata valores dos registradores
		pop r1
		pop r0
		dec r5
		rts 					;return

;----------------

;********************************************************
;                       IMPRIME TELA
;********************************************************	

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------

;---------------------------	
;********************************************************
;                   IMPRIME STRING
;********************************************************
	
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;********************************************************
;         IMPRIME TELA2 (Não imprime nos espacos)
;********************************************************	

ImprimeTela2: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;********************************************************
;                   IMPRIME STRING2
;********************************************************
	
ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6			; Incrementa o ponteiro da String da Tela 0
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	

;********************************************************
;                       DELAY
;********************************************************		

Delay_15seg:
						;Utiliza Push e Pop para nao afetar os Registradores do programa principal
	Push R0
	Push R1
	
	;Loadn R1, #5
	Loadn R1, #15			; a
   Delay_volta2_15seg:			; Quebrou o contador acima em duas partes (dois loops de decremento)
	;Loadn R0, #10000
	Loadn R0, #100000		; b - atrasa o objeto
   Delay_volta_15seg: 
	Dec R0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta_15seg	
	Dec R1
	JNZ Delay_volta2_15seg
	
	Pop R1
	Pop R0
	
	RTS							;return

;-------------------------------

;********************************************************
;                       APAGA TELA
;********************************************************
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	; label for(r0 = 1200; r3 > 0; r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	

;-------------------------------

;********************************************************
;                       Pontuaçao
;********************************************************
score:
		push r0
		push r1
		
		load r0, ScoreUnidade	; Soma um ponto na unidade
		loadn r1, #'9'			; Se a unidade ja for 9, então vai pra somar na dezena
		cmp r1, r0
		jeq SomaDezena
		
		inc r0  
		store ScoreUnidade, r0
		
		jmp AtualizaScore
		
SomaDezena: 					; Soma um na dezena
		loadn r0, #'0'			
		store ScoreUnidade, r0
		
		load r0, ScoreDezena
		loadn r1, #'9'			; Se a dezena já é 9, então vai somar na centena
		cmp r1, r0
		jeq SomaCentena
		
		inc r0  
		store ScoreDezena, r0
		
		jmp AtualizaScore
		
SomaCentena:					; Soma um na centena
		loadn r0, #'0'
		store ScoreDezena, r0
		
		load r0, ScoreCentena
		loadn r1, #'9'			; Se a centena é 9, então da GameOver
		cmp r1, r0
		jeq GameOver
		
		inc r0  
		store ScoreCentena, r0
		
AtualizaScore:					; reescreve o score na tela para atualizar a pontuação
		load r0,ScoreUnidade
		load r1,PosicaoUnidade
		outchar r0,r1
		
		load r0,ScoreDezena
		load r1,PosicaoDezena
		outchar r0,r1
		
		load r0,ScoreCentena
		load r1,PosicaoCentena
		outchar r0,r1
		
		pop r0
		pop r1		
		rts

;------------------------	


; Declara uma tela vazia para ser preenchida em tempo de execucao:
tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "

; Tela Inicial do Jogo
telaInicialLinha0  : string "                                        "
telaInicialLinha1  : string "                                        "
telaInicialLinha2  : string "                                        "
telaInicialLinha3  : string "               ARROW HERO               "
telaInicialLinha4  : string "                                        "
telaInicialLinha5  : string "                                        "
telaInicialLinha6  : string "                                        "
telaInicialLinha7  : string "                                        "
telaInicialLinha8  : string "                                        "
telaInicialLinha9  : string "                                        "
telaInicialLinha10 : string "                CONTROLS                "
telaInicialLinha11 : string "                                        "
telaInicialLinha12 : string "                                        "
telaInicialLinha13 : string "     HIT W WHEN UP ARROW APPEARS        "
telaInicialLinha14 : string "     HIT A WHEN RIGHT ARROW APPEARS     "
telaInicialLinha15 : string "     HIT S WHEN DOWN ARROW APPEARS      "
telaInicialLinha16 : string "     HIT D WHEN LEFT ARROW APPEARS      "
telaInicialLinha17 : string "                                        "
telaInicialLinha18 : string "                                        "
telaInicialLinha19 : string "                                        "
telaInicialLinha20 : string "                                        "
telaInicialLinha21 : string "                                        "
telaInicialLinha22 : string "                                        "
telaInicialLinha23 : string "                                        "
telaInicialLinha24 : string "                                        "
telaInicialLinha25 : string "                                        "
telaInicialLinha26 : string "                                        "
telaInicialLinha27 : string "         PRESS ENTER TO START           "
telaInicialLinha28 : string "                                        "
telaInicialLinha29 : string "                                        "

telaGameOverLinha0  : string "                                        "
telaGameOverLinha1  : string "                                        "
telaGameOverLinha2  : string "                                        "
telaGameOverLinha3  : string "               ARROW HERO               "
telaGameOverLinha4  : string "                                        "
telaGameOverLinha5  : string "                                        "
telaGameOverLinha6  : string "                                        "
telaGameOverLinha7  : string "                                        "
telaGameOverLinha8  : string "                                        "
telaGameOverLinha9  : string "               GAME OVER                "
telaGameOverLinha10 : string "                                        "
telaGameOverLinha11 : string "                                        "
telaGameOverLinha12 : string "     SCORE: ___                         "
telaGameOverLinha13 : string "                                        "
telaGameOverLinha14 : string "                                        "
telaGameOverLinha15 : string "                                        "
telaGameOverLinha16 : string "                GOOD JOB                "
telaGameOverLinha17 : string "                                        "
telaGameOverLinha18 : string "            KEEP PRACTICING             "
telaGameOverLinha19 : string "                                        "
telaGameOverLinha20 : string "                                        "
telaGameOverLinha21 : string "                                        "
telaGameOverLinha22 : string "                                        "
telaGameOverLinha23 : string "                                        "
telaGameOverLinha24 : string "        DO YOU WANNA PLAY AGAIN?        "
telaGameOverLinha25 : string "                  <Y/N>                 "
telaGameOverLinha26 : string "                                        "
telaGameOverLinha27 : string "                                        "
telaGameOverLinha28 : string "                                        "
telaGameOverLinha29 : string "                                        "

telaArrowUpLinha0  : string "                                        "
telaArrowUpLinha1  : string "                                        "
telaArrowUpLinha2  : string "                                        "
telaArrowUpLinha3  : string "                                        "
telaArrowUpLinha4  : string "                                        "
telaArrowUpLinha5  : string "                                        "
telaArrowUpLinha6  : string "          ___________________           "
telaArrowUpLinha7  : string "         |         _         |          "
telaArrowUpLinha8  : string "         |        / \\        |          "
telaArrowUpLinha9  : string "         |       /   \\       |          "
telaArrowUpLinha10 : string "         |      /     \\      |          "
telaArrowUpLinha11 : string "         |     /       \\     |          "
telaArrowUpLinha12 : string "         |    /__     __\\    |          "
telaArrowUpLinha13 : string "         |       |   |       |          "
telaArrowUpLinha14 : string "         |       |   |       |          "
telaArrowUpLinha15 : string "         |       |   |       |          "
telaArrowUpLinha16 : string "         |       |___|       |          "
telaArrowUpLinha17 : string "         |___________________|          "
telaArrowUpLinha18 : string "                                        "
telaArrowUpLinha19 : string "                                        "
telaArrowUpLinha20 : string "                                        "
telaArrowUpLinha21 : string "                                        "
telaArrowUpLinha22 : string "                                        "
telaArrowUpLinha23 : string "                                        "
telaArrowUpLinha24 : string "                                        "
telaArrowUpLinha25 : string "                                        "
telaArrowUpLinha26 : string "                                        "
telaArrowUpLinha27 : string "                                        "
telaArrowUpLinha28 : string "                                        "
telaArrowUpLinha29 : string "                                        "

telaArrowDownLinha0  : string "                                        "
telaArrowDownLinha1  : string "                                        "
telaArrowDownLinha2  : string "                                        "
telaArrowDownLinha3  : string "                                        "
telaArrowDownLinha4  : string "                                        "
telaArrowDownLinha5  : string "                                        "
telaArrowDownLinha6  : string "          ___________________           "
telaArrowDownLinha7  : string "         |        ___        |          "
telaArrowDownLinha8  : string "         |       |   |       |          "
telaArrowDownLinha9  : string "         |       |   |       |          "
telaArrowDownLinha10 : string "         |       |   |       |          "
telaArrowDownLinha11 : string "         |     __|   |__     |          "
telaArrowDownLinha12 : string "         |    \\         /    |          "
telaArrowDownLinha13 : string "         |     \\       /     |          "
telaArrowDownLinha14 : string "         |      \\     /      |          "
telaArrowDownLinha15 : string "         |       \\   /       |          "
telaArrowDownLinha16 : string "         |        \\_/        |          "
telaArrowDownLinha17 : string "         |___________________|          "
telaArrowDownLinha18 : string "                                        "
telaArrowDownLinha19 : string "                                        "
telaArrowDownLinha20 : string "                                        "
telaArrowDownLinha21 : string "                                        "
telaArrowDownLinha22 : string "                                        "
telaArrowDownLinha23 : string "                                        "
telaArrowDownLinha24 : string "                                        "
telaArrowDownLinha25 : string "                                        "
telaArrowDownLinha26 : string "                                        "
telaArrowDownLinha27 : string "                                        "
telaArrowDownLinha28 : string "                                        "
telaArrowDownLinha29 : string "                                        "

telaArrowRightLinha0  : string "                                        "
telaArrowRightLinha1  : string "                                        "
telaArrowRightLinha2  : string "                                        "
telaArrowRightLinha3  : string "                                        "
telaArrowRightLinha4  : string "                                        "
telaArrowRightLinha5  : string "                                        "
telaArrowRightLinha6  : string "          ___________________           "
telaArrowRightLinha7  : string "         |                   |          "
telaArrowRightLinha8  : string "         |         \\         |          "
telaArrowRightLinha9  : string "         |        |  \\       |          "
telaArrowRightLinha10 : string "         |  ______|    \\     |          "
telaArrowRightLinha11 : string "         | |             \\   |          "
telaArrowRightLinha12 : string "         | |              |  |          "
telaArrowRightLinha13 : string "         | |______       /   |          "
telaArrowRightLinha14 : string "         |        |    /     |          "
telaArrowRightLinha15 : string "         |        |  /       |          "
telaArrowRightLinha16 : string "         |         /         |          "
telaArrowRightLinha17 : string "         |___________________|          "
telaArrowRightLinha18 : string "                                        "
telaArrowRightLinha19 : string "                                        "
telaArrowRightLinha20 : string "                                        "
telaArrowRightLinha21 : string "                                        "
telaArrowRightLinha22 : string "                                        "
telaArrowRightLinha23 : string "                                        "
telaArrowRightLinha24 : string "                                        "
telaArrowRightLinha25 : string "                                        "
telaArrowRightLinha26 : string "                                        "
telaArrowRightLinha27 : string "                                        "
telaArrowRightLinha28 : string "                                        "
telaArrowRightLinha29 : string "                                        "

telaArrowLeftLinha0  : string "                                        "
telaArrowLeftLinha1  : string "                                        "
telaArrowLeftLinha2  : string "                                        "
telaArrowLeftLinha3  : string "                                        "
telaArrowLeftLinha4  : string "                                        "
telaArrowLeftLinha5  : string "                                        "
telaArrowLeftLinha6  : string "          ___________________           "
telaArrowLeftLinha7  : string "         |                   |          "
telaArrowLeftLinha8  : string "         |         /         |          "
telaArrowLeftLinha9  : string "         |       /  |        |          "
telaArrowLeftLinha10 : string "         |     /    |______  |          "
telaArrowLeftLinha11 : string "         |   /             | |          "
telaArrowLeftLinha12 : string "         |  |              | |          "
telaArrowLeftLinha13 : string "         |   \\       ______| |          "
telaArrowLeftLinha14 : string "         |     \\    |        |          "
telaArrowLeftLinha15 : string "         |       \\  |        |          "
telaArrowLeftLinha16 : string "         |         \\         |          "
telaArrowLeftLinha17 : string "         |___________________|          "
telaArrowLeftLinha18 : string "                                        "
telaArrowLeftLinha19 : string "                                        "
telaArrowLeftLinha20 : string "                                        "
telaArrowLeftLinha21 : string "                                        "
telaArrowLeftLinha22 : string "                                        "
telaArrowLeftLinha23 : string "                                        "
telaArrowLeftLinha24 : string "                                        "
telaArrowLeftLinha25 : string "                                        "
telaArrowLeftLinha26 : string "                                        "
telaArrowLeftLinha27 : string "                                        "
telaArrowLeftLinha28 : string "                                        "
telaArrowLeftLinha29 : string "                                        "