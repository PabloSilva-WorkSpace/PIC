
_ConfigMCU:

;main.c,33 :: 		void ConfigMCU()
;main.c,38 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,40 :: 		TRISD = 0;   /* Configuração do PORTD como saída */
	CLRF        TRISD+0 
;main.c,41 :: 		PORTD = 0;   /* Desliga (OFF) as saídas do PORTD */
	CLRF        PORTD+0 
;main.c,42 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_ConfigTIMER:

;main.c,45 :: 		void ConfigTIMER()
;main.c,47 :: 		T0CON = 0B00000110;  /* Configuração do TIMER0: {Modo = Timer; Prescaler = 1:128; Modo = 16 bits} */
	MOVLW       6
	MOVWF       T0CON+0 
;main.c,48 :: 		TMR0L = 0xF7;        /* Configuração da carga inicial - Byte menos significativo */
	MOVLW       247
	MOVWF       TMR0L+0 
;main.c,49 :: 		TMR0H = 0xC2;        /* Configuração da carga inicial - Byte mais significativo  */
	MOVLW       194
	MOVWF       TMR0H+0 
;main.c,50 :: 		INTCON.TMR0IF = 0;   /* Reset o bit (flag) de overflow, ou estouro, do TIMER0    */
	BCF         INTCON+0, 2 
;main.c,51 :: 		T0CON.TMR0ON = 1;    /* Liga o TIMER0 */
	BSF         T0CON+0, 7 
;main.c,52 :: 		}
L_end_ConfigTIMER:
	RETURN      0
; end of _ConfigTIMER

_main:

;main.c,55 :: 		void main()
;main.c,57 :: 		unsigned int i = 0;
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
;main.c,59 :: 		ConfigMCU();
	CALL        _ConfigMCU+0, 0
;main.c,60 :: 		ConfigTIMER();
	CALL        _ConfigTIMER+0, 0
;main.c,62 :: 		while(1)
L_main0:
;main.c,64 :: 		if(INTCON.TMR0IF == 1)   /* Monitora o flag de overflow do TIMER0 */
	BTFSS       INTCON+0, 2 
	GOTO        L_main2
;main.c,67 :: 		TMR0L = 0xF7;        /* Configuração da carga inicial - Byte menos significativo */
	MOVLW       247
	MOVWF       TMR0L+0 
;main.c,68 :: 		TMR0H = 0xC2;        /* Configuração da carga inicial - Byte mais significativo  */
	MOVLW       194
	MOVWF       TMR0H+0 
;main.c,69 :: 		INTCON.TMR0IF = 0;   /* Reset o bit (flag) de overflow, ou estouro, do TIMER0    */
	BCF         INTCON+0, 2 
;main.c,71 :: 		i++;
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;main.c,72 :: 		if(i >= 5){
	MOVLW       0
	SUBWF       main_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       5
	SUBWF       main_i_L0+0, 0 
L__main7:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;main.c,73 :: 		Flasher();
	CALL        _Flasher+0, 0
;main.c,74 :: 		i = 0;
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
;main.c,75 :: 		}
L_main3:
;main.c,76 :: 		}
L_main2:
;main.c,77 :: 		}
	GOTO        L_main0
;main.c,78 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Flasher:

;main.c,81 :: 		void Flasher(void)
;main.c,83 :: 		PORTD.RD0 = ~ LATD.RD0;   /* Toggle - Inverte o estado logico do led conectado a saída PORTD.RD0 */
	BTFSC       LATD+0, 0 
	GOTO        L__Flasher9
	BSF         PORTD+0, 0 
	GOTO        L__Flasher10
L__Flasher9:
	BCF         PORTD+0, 0 
L__Flasher10:
;main.c,84 :: 		}
L_end_Flasher:
	RETURN      0
; end of _Flasher
