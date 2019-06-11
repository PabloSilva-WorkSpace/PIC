
_main:

;Project_003_Tecla_selada__Led.c,7 :: 		void main(){
;Project_003_Tecla_selada__Led.c,9 :: 		unsigned char flagAux = 0;
	CLRF        main_flagAux_L0+0 
;Project_003_Tecla_selada__Led.c,15 :: 		ADCON1 |= 0X0F; //Configura todos os pinos ADC como digital (ex: PIC18F4520)
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_003_Tecla_selada__Led.c,19 :: 		TRISB.RB0 = 1; //Configura o pino RB0 como entrada
	BSF         TRISB+0, 0 
;Project_003_Tecla_selada__Led.c,20 :: 		PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC já coloca nível 1 em PORTx.Rx0
	BSF         PORTB+0, 0 
;Project_003_Tecla_selada__Led.c,23 :: 		TRISD.RD0 = 0; //Configura o pino RD0 como saída
	BCF         TRISD+0, 0 
;Project_003_Tecla_selada__Led.c,24 :: 		PORTD.RD0 = 0; //Led off
	BCF         PORTD+0, 0 
;Project_003_Tecla_selada__Led.c,26 :: 		while(1)
L_main0:
;Project_003_Tecla_selada__Led.c,28 :: 		if(PORTB.RB0 == 0 && flagAux == 0) //Tecla esta sendo acionada em nível 0 (zero)
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	MOVF        main_flagAux_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main11:
;Project_003_Tecla_selada__Led.c,30 :: 		PORTD.RD0 = ~LATD.RD0; //Toogle (Inverte o estado lógico do led)
	BTFSC       LATD+0, 0 
	GOTO        L__main13
	BSF         PORTD+0, 0 
	GOTO        L__main14
L__main13:
	BCF         PORTD+0, 0 
L__main14:
;Project_003_Tecla_selada__Led.c,31 :: 		flagAux = 1;
	MOVLW       1
	MOVWF       main_flagAux_L0+0 
;Project_003_Tecla_selada__Led.c,32 :: 		Delay_ms(40); //Trata o debounce
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
;Project_003_Tecla_selada__Led.c,33 :: 		}
L_main4:
;Project_003_Tecla_selada__Led.c,34 :: 		if(PORTB.RB0 == 1 && flagAux == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main8
	MOVF        main_flagAux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main10:
;Project_003_Tecla_selada__Led.c,36 :: 		flagAux = 0;
	CLRF        main_flagAux_L0+0 
;Project_003_Tecla_selada__Led.c,37 :: 		Delay_ms(40); //Trata o debounce
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
;Project_003_Tecla_selada__Led.c,38 :: 		}
L_main8:
;Project_003_Tecla_selada__Led.c,39 :: 		}
	GOTO        L_main0
;Project_003_Tecla_selada__Led.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
