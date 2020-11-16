
_ConfigMCU:

;main.c,32 :: 		void ConfigMCU()
;main.c,37 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,39 :: 		TRISD = 0;   /* Configuração do PORTD como saída */
	CLRF        TRISD+0 
;main.c,40 :: 		PORTD = 0;   /* Desliga (OFF) as saídas do PORTD */
	CLRF        PORTD+0 
;main.c,41 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_ConfigTIMER:

;main.c,44 :: 		void ConfigTIMER()
;main.c,46 :: 		T0CON = 0B00000110;  /* Configuração do TIMER0: {Modo = Timer; Prescaler = 1:128; Modo = 16 bits} */
	MOVLW       6
	MOVWF       T0CON+0 
;main.c,47 :: 		TMR0L = 0xF7;        /* Configuração da carga inicial - Byte menos significativo */
	MOVLW       247
	MOVWF       TMR0L+0 
;main.c,48 :: 		TMR0H = 0xC2;        /* Configuração da carga inicial - Byte mais significativo  */
	MOVLW       194
	MOVWF       TMR0H+0 
;main.c,49 :: 		INTCON.TMR0IF = 0;   /* Reset o bit (flag) de overflow, ou estouro, do TIMER0    */
	BCF         INTCON+0, 2 
;main.c,50 :: 		T0CON.TMR0ON = 1;    /* Liga o TIMER0 */
	BSF         T0CON+0, 7 
;main.c,51 :: 		}
L_end_ConfigTIMER:
	RETURN      0
; end of _ConfigTIMER

_main:

;main.c,54 :: 		void main()
;main.c,56 :: 		ConfigMCU();
	CALL        _ConfigMCU+0, 0
;main.c,57 :: 		ConfigTIMER();
	CALL        _ConfigTIMER+0, 0
;main.c,59 :: 		while(1)
L_main0:
;main.c,61 :: 		if(INTCON.TMR0IF == 1)   /* Monitora o flag de overflow do TIMER0 */
	BTFSS       INTCON+0, 2 
	GOTO        L_main2
;main.c,63 :: 		PORTD.RD0 = ~ LATD.RD0;   /* Toggle - Inverte o estado logico do led conectado a saída PORTD.RD0 */
	BTFSC       LATD+0, 0 
	GOTO        L__main6
	BSF         PORTD+0, 0 
	GOTO        L__main7
L__main6:
	BCF         PORTD+0, 0 
L__main7:
;main.c,65 :: 		TMR0L = 0xF7;        /* Configuração da carga inicial - Byte menos significativo */
	MOVLW       247
	MOVWF       TMR0L+0 
;main.c,66 :: 		TMR0H = 0xC2;        /* Configuração da carga inicial - Byte mais significativo  */
	MOVLW       194
	MOVWF       TMR0H+0 
;main.c,67 :: 		INTCON.TMR0IF = 0;   /* Reset o bit (flag) de overflow, ou estouro, do TIMER0    */
	BCF         INTCON+0, 2 
;main.c,68 :: 		}
L_main2:
;main.c,69 :: 		}
	GOTO        L_main0
;main.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
