
_main:

;Project_007_FuncaoButton.c,9 :: 		void main() {
;Project_007_FuncaoButton.c,17 :: 		INTCON2.RBPU = 0;  //Habilita a chave global dos resistores de pull-up presente no PORTB
	BCF         INTCON2+0, 7 
;Project_007_FuncaoButton.c,18 :: 		ADCON1 |= 0x0F;  //Configura todos os pinos compartilhados, ou multiplexados, como digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_007_FuncaoButton.c,23 :: 		TRISB.RB0 = 1; //Configura o pino 0 do PORTB como entrada
	BSF         TRISB+0, 0 
;Project_007_FuncaoButton.c,25 :: 		TRISD = 0; //Configura o PORTD como saída
	CLRF        TRISD+0 
;Project_007_FuncaoButton.c,26 :: 		PORTD = 0; //Estabelece nível zero na saída do PORTD (todos os pino do PORT) - Para os leds iniciarem apagados
	CLRF        PORTD+0 
;Project_007_FuncaoButton.c,29 :: 		while(TRUE){
L_main0:
;Project_007_FuncaoButton.c,30 :: 		if(Button(&PORTB, 0, 50, 0)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;Project_007_FuncaoButton.c,31 :: 		PORTD ^= 0xFF;
	MOVLW       255
	XORWF       PORTD+0, 1 
;Project_007_FuncaoButton.c,32 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;Project_007_FuncaoButton.c,33 :: 		}
L_main2:
;Project_007_FuncaoButton.c,34 :: 		}
	GOTO        L_main0
;Project_007_FuncaoButton.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
