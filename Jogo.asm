	loadn r0, #0 	;Coord Nave
	loadn r1, #'#' 	;Char Nave
	loadn r2, #' '	;Space

inicio:
	loadn r0, #'0'	;Reseta coord nave

loop:
	call Atualiza_Nave

	call Delay

Delay:
	;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	Push R0
	Push R1
	
	Loadn R1, #50  ; a
   Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	Loadn R0, #3000	; b
   Delay_volta: 
	Dec R0						;(4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta	
	Dec R1
	JNZ Delay_volta2
	
	Pop R1
	Pop R0
	
	RTS							;return

fim:
	halt

Atualiza_Nave:
	outchar r2, r0
	Inc R0
	outchar r1, r0
	rts