
_main:

;Project_001_PiscaPisca.c,6 :: 		void main(){
;Project_001_PiscaPisca.c,8 :: 		ADCON1 |= 0X0F; //Configurar todos os pinos ADC como digital (ex: PIC18F4520)
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_001_PiscaPisca.c,11 :: 		TRISB.RB0 = 1; //Configurar o pino RB0 como entrada
	BSF         TRISB+0, 0 
;Project_001_PiscaPisca.c,12 :: 		PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC já coloca nível 1 em PORTx.Rx0
	BSF         PORTB+0, 0 
;Project_001_PiscaPisca.c,15 :: 		TRISD.RD0 = 0; //Configurar o pino RD0 como saída
	BCF         TRISD+0, 0 
;Project_001_PiscaPisca.c,16 :: 		PORTD.RD0 = 0; //Led off
	BCF         PORTD+0, 0 
;Project_001_PiscaPisca.c,18 :: 		while(1)
L_main0:
;Project_001_PiscaPisca.c,20 :: 		PORTD.RD0 = 1; //Liga o led
	BSF         PORTD+0, 0 
;Project_001_PiscaPisca.c,21 :: 		Delay_ms(300); //Delay de 300ms
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;Project_001_PiscaPisca.c,22 :: 		PORTD.RD0 = 0; //Desliga o led
	BCF         PORTD+0, 0 
;Project_001_PiscaPisca.c,23 :: 		Delay_ms(300); //Delay de 300ms
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
;Project_001_PiscaPisca.c,24 :: 		}
	GOTO        L_main0
;Project_001_PiscaPisca.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
