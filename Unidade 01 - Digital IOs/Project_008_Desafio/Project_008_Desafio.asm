
_main:

;Project_008_Desafio.c,9 :: 		void main() {
;Project_008_Desafio.c,11 :: 		unsigned char i = 0B00000000;
	CLRF        main_i_L0+0 
	CLRF        main_auxFlagRB0_L0+0 
	CLRF        main_auxFlagRB1_L0+0 
;Project_008_Desafio.c,22 :: 		INTCON2.RBPU = 0;  //Habilita a chave global dos resistores de pull-up presente no PORTB
	BCF         INTCON2+0, 7 
;Project_008_Desafio.c,23 :: 		ADCON1 |= 0x0F;  //Configura todos os pinos compartilhados, ou multiplexados, como digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_008_Desafio.c,28 :: 		TRISB.RB0 = 1; //Configura o pino 0 do PORTB como entrada - Contagem crescente
	BSF         TRISB+0, 0 
;Project_008_Desafio.c,29 :: 		TRISB.RB1 = 1; //Configura o pino 1 do PORTB como entrada - Contagem decrescente
	BSF         TRISB+0, 1 
;Project_008_Desafio.c,31 :: 		TRISD = 0; //Configura o PORTD como saída
	CLRF        TRISD+0 
;Project_008_Desafio.c,32 :: 		PORTD = 0; //Estabelece nível zero na saída do PORTD (todos os pino do PORT) - Para os leds iniciarem apagados
	CLRF        PORTD+0 
;Project_008_Desafio.c,35 :: 		while(TRUE){
L_main0:
;Project_008_Desafio.c,37 :: 		if(PORTB.RB1 == 0 && auxFlagRB1 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_main4
	MOVF        main_auxFlagRB1_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main21:
;Project_008_Desafio.c,38 :: 		i = ~((~i) <<= 1);  //Equivale a sequencia de comandos: i = ~i; i <<= 1; i = ~i;
	COMF        main_i_L0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       R2 
	COMF        R0, 1 
	MOVF        R0, 0 
	MOVWF       main_i_L0+0 
;Project_008_Desafio.c,39 :: 		PORTD = i;
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Project_008_Desafio.c,40 :: 		auxFlagRB1 = 1;
	MOVLW       1
	MOVWF       main_auxFlagRB1_L0+0 
;Project_008_Desafio.c,41 :: 		Delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;Project_008_Desafio.c,42 :: 		}
L_main4:
;Project_008_Desafio.c,43 :: 		if(PORTB.RB1 == 1 && auxFlagRB1 == 1){
	BTFSS       PORTB+0, 1 
	GOTO        L_main8
	MOVF        main_auxFlagRB1_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main20:
;Project_008_Desafio.c,44 :: 		auxFlagRB1 = 0;
	CLRF        main_auxFlagRB1_L0+0 
;Project_008_Desafio.c,45 :: 		Delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;Project_008_Desafio.c,46 :: 		}
L_main8:
;Project_008_Desafio.c,49 :: 		if(PORTB.RB0 == 0 && auxFlagRB0 == 0){
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	MOVF        main_auxFlagRB0_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main19:
;Project_008_Desafio.c,50 :: 		i >>= 1;
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       main_i_L0+0 
;Project_008_Desafio.c,51 :: 		PORTD = i;
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Project_008_Desafio.c,52 :: 		auxFlagRB0 = 1;
	MOVLW       1
	MOVWF       main_auxFlagRB0_L0+0 
;Project_008_Desafio.c,53 :: 		Delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	NOP
	NOP
;Project_008_Desafio.c,54 :: 		}
L_main12:
;Project_008_Desafio.c,55 :: 		if(PORTB.RB0 == 1 && auxFlagRB0 == 1){
	BTFSS       PORTB+0, 0 
	GOTO        L_main16
	MOVF        main_auxFlagRB0_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
L__main18:
;Project_008_Desafio.c,56 :: 		auxFlagRB0 = 0;
	CLRF        main_auxFlagRB0_L0+0 
;Project_008_Desafio.c,57 :: 		Delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
	NOP
;Project_008_Desafio.c,58 :: 		}
L_main16:
;Project_008_Desafio.c,59 :: 		}
	GOTO        L_main0
;Project_008_Desafio.c,60 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
