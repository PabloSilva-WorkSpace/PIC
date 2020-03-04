
_main:

;Project_006_Tecla_PullUp_Led.c,9 :: 		void main() {
;Project_006_Tecla_PullUp_Led.c,17 :: 		INTCON2.RBPU = 0;  //Habilita a chave global dos resistores de pull-up presente no PORTB
	BCF         INTCON2+0, 7 
;Project_006_Tecla_PullUp_Led.c,18 :: 		ADCON1 |= 0x0F;  //Configura todos os pinos compartilhados, ou multiplexados, como digital
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_006_Tecla_PullUp_Led.c,23 :: 		TRISB.RB0 = 1; //Configura o pino 0 do PORTB como entrada
	BSF         TRISB+0, 0 
;Project_006_Tecla_PullUp_Led.c,25 :: 		TRISD = 0; //Configura o PORTD como saída
	CLRF        TRISD+0 
;Project_006_Tecla_PullUp_Led.c,26 :: 		PORTD = 0; //Estabelece nível zero na saída do PORTD (todos os pino do PORT) - Para os leds iniciarem apagados
	CLRF        PORTD+0 
;Project_006_Tecla_PullUp_Led.c,29 :: 		while(TRUE){
L_main0:
;Project_006_Tecla_PullUp_Led.c,30 :: 		if(PORTB.RB0 == 0){
	BTFSC       PORTB+0, 0 
	GOTO        L_main2
;Project_006_Tecla_PullUp_Led.c,31 :: 		PORTD.RD0 = ~LATD.RD0;
	BTFSC       LATD+0, 0 
	GOTO        L__main5
	BSF         PORTD+0, 0 
	GOTO        L__main6
L__main5:
	BCF         PORTD+0, 0 
L__main6:
;Project_006_Tecla_PullUp_Led.c,32 :: 		Delay_ms(300);
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
;Project_006_Tecla_PullUp_Led.c,33 :: 		}
L_main2:
;Project_006_Tecla_PullUp_Led.c,34 :: 		}
	GOTO        L_main0
;Project_006_Tecla_PullUp_Led.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
