
_main:

;Project_002_Tecla_Led.c,7 :: 		void main(){
;Project_002_Tecla_Led.c,12 :: 		ADCON1 |= 0X0F; //Configurar todos os pinos ADC como digital (ex: PIC18F4520)
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_002_Tecla_Led.c,16 :: 		TRISB.RB0 = 1; //Configurar o pino RB0 como entrada
	BSF         TRISB+0, 0 
;Project_002_Tecla_Led.c,17 :: 		PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC já coloca nível 1 em PORTx.Rx0
	BSF         PORTB+0, 0 
;Project_002_Tecla_Led.c,20 :: 		TRISD.RD0 = 0; //Configurar o pino RD0 como saída
	BCF         TRISD+0, 0 
;Project_002_Tecla_Led.c,21 :: 		PORTD.RD0 = 0; //Led off
	BCF         PORTD+0, 0 
;Project_002_Tecla_Led.c,23 :: 		while(1)
L_main0:
;Project_002_Tecla_Led.c,25 :: 		if(PORTB.RB0 == 0) //Tecla esta sendo acionada em nível 0 (zero)
	BTFSC       PORTB+0, 0 
	GOTO        L_main2
;Project_002_Tecla_Led.c,27 :: 		PORTD.RD0 = ~LATD.RD0; //Toogle (Inverte o estado lógico do led)
	BTFSC       LATD+0, 0 
	GOTO        L__main5
	BSF         PORTD+0, 0 
	GOTO        L__main6
L__main5:
	BCF         PORTD+0, 0 
L__main6:
;Project_002_Tecla_Led.c,28 :: 		Delay_ms(300);
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
;Project_002_Tecla_Led.c,29 :: 		}
L_main2:
;Project_002_Tecla_Led.c,30 :: 		}
	GOTO        L_main0
;Project_002_Tecla_Led.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
