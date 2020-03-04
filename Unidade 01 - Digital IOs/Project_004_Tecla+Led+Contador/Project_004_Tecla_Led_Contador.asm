
_ManipulaLeds:

;Project_004_Tecla_Led_Contador.c,14 :: 		void ManipulaLeds(unsigned char i)
;Project_004_Tecla_Led_Contador.c,16 :: 		switch(i){
	GOTO        L_ManipulaLeds0
;Project_004_Tecla_Led_Contador.c,17 :: 		case 1:{PORTD.RD0 = 1; break;}
L_ManipulaLeds2:
	BSF         PORTD+0, 0 
	GOTO        L_ManipulaLeds1
;Project_004_Tecla_Led_Contador.c,18 :: 		case 2:{PORTD.RD1 = 1; break;}
L_ManipulaLeds3:
	BSF         PORTD+0, 1 
	GOTO        L_ManipulaLeds1
;Project_004_Tecla_Led_Contador.c,19 :: 		case 3:{PORTD.RD2 = 1; break;}
L_ManipulaLeds4:
	BSF         PORTD+0, 2 
	GOTO        L_ManipulaLeds1
;Project_004_Tecla_Led_Contador.c,20 :: 		default:{PORTD = 0; ucContador = 0; break;}
L_ManipulaLeds5:
	CLRF        PORTD+0 
	CLRF        _ucContador+0 
	GOTO        L_ManipulaLeds1
;Project_004_Tecla_Led_Contador.c,21 :: 		}
L_ManipulaLeds0:
	MOVF        FARG_ManipulaLeds_i+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_ManipulaLeds2
	MOVF        FARG_ManipulaLeds_i+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_ManipulaLeds3
	MOVF        FARG_ManipulaLeds_i+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_ManipulaLeds4
	GOTO        L_ManipulaLeds5
L_ManipulaLeds1:
;Project_004_Tecla_Led_Contador.c,22 :: 		}
L_end_ManipulaLeds:
	RETURN      0
; end of _ManipulaLeds

_main:

;Project_004_Tecla_Led_Contador.c,24 :: 		void main(){
;Project_004_Tecla_Led_Contador.c,26 :: 		unsigned char flagAux = 0;
	CLRF        main_flagAux_L0+0 
;Project_004_Tecla_Led_Contador.c,32 :: 		ADCON1 |= 0X0F; //Configura todos os pinos ADC como digital (ex: PIC18F4520)
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project_004_Tecla_Led_Contador.c,36 :: 		TRISB.RB0 = 1; //Configura o pino RB0 como entrada
	BSF         TRISB+0, 0 
;Project_004_Tecla_Led_Contador.c,37 :: 		PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC já coloca nível 1 em PORTx.Rx0; Porém existe uma excessão com relação ao PORTB, visto que esta porta é a única que, ao colocar TRISB = 1, internamente os resistores de PULL-UP são por default desligados.
	BSF         PORTB+0, 0 
;Project_004_Tecla_Led_Contador.c,38 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Project_004_Tecla_Led_Contador.c,41 :: 		TRISD = 0; //Configura o pino RD0 como saída
	CLRF        TRISD+0 
;Project_004_Tecla_Led_Contador.c,42 :: 		PORTD = 0; //Leds off (Manipula todos os pinos do PORTD para zero)
	CLRF        PORTD+0 
;Project_004_Tecla_Led_Contador.c,45 :: 		Delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;Project_004_Tecla_Led_Contador.c,47 :: 		while(1)
L_main8:
;Project_004_Tecla_Led_Contador.c,49 :: 		if(PORTB.RB0 == 0 && flagAux == 0) //Tecla esta sendo acionada em nível 0 (zero)
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
	MOVF        main_flagAux_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main19:
;Project_004_Tecla_Led_Contador.c,51 :: 		ManipulaLeds(++ucContador);
	INCF        _ucContador+0, 1 
	MOVF        _ucContador+0, 0 
	MOVWF       FARG_ManipulaLeds_i+0 
	CALL        _ManipulaLeds+0, 0
;Project_004_Tecla_Led_Contador.c,52 :: 		flagAux = 1;
	MOVLW       1
	MOVWF       main_flagAux_L0+0 
;Project_004_Tecla_Led_Contador.c,53 :: 		Delay_ms(40); //Trata o debounce
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	NOP
;Project_004_Tecla_Led_Contador.c,54 :: 		}
L_main12:
;Project_004_Tecla_Led_Contador.c,55 :: 		if(PORTB.RB0 == 1 && flagAux == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main16
	MOVF        main_flagAux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
L__main18:
;Project_004_Tecla_Led_Contador.c,57 :: 		flagAux = 0;
	CLRF        main_flagAux_L0+0 
;Project_004_Tecla_Led_Contador.c,58 :: 		Delay_ms(40); //Trata o debounce
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
;Project_004_Tecla_Led_Contador.c,59 :: 		}
L_main16:
;Project_004_Tecla_Led_Contador.c,60 :: 		}
	GOTO        L_main8
;Project_004_Tecla_Led_Contador.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
