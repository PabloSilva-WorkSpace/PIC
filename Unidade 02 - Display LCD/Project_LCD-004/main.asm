
_ConfigMCU:

;main.c,39 :: 		void ConfigMCU()
;main.c,44 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,47 :: 		TRISB.RB0 = 1; /* Configura o pino RB0 como entrada - tecla down */
	BSF         TRISB+0, 0 
;main.c,48 :: 		TRISB.RB1 = 1; /* Configura o pino RB1 como entrada - tecla up */
	BSF         TRISB+0, 1 
;main.c,49 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;main.c,52 :: 		void main()
;main.c,55 :: 		signed int uiContador = 0;     /* serão necessários 7 caracteres: {sinal, faixa de valores, NULL} */
	CLRF        main_uiContador_L0+0 
	CLRF        main_uiContador_L0+1 
;main.c,58 :: 		ConfigMCU();                     /* Inicializa MCU */
	CALL        _ConfigMCU+0, 0
;main.c,59 :: 		Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
	CALL        _Lcd_Init+0, 0
;main.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,62 :: 		Lcd_Out(1,1,"Valor: ");          /* Linha x Coluna*/
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,64 :: 		while(TRUE){
L_main0:
;main.c,66 :: 		if(TECLA_UP == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_main2
;main.c,67 :: 		uiContador++;   /* Exemplo: 1234 */
	INFSNZ      main_uiContador_L0+0, 1 
	INCF        main_uiContador_L0+1, 1 
;main.c,69 :: 		IntToStr(uiContador, ucTexto);   /* Use esta função de conversão se uiContador for declarada como signed int */
	MOVF        main_uiContador_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_uiContador_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_ucTexto_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_ucTexto_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main.c,76 :: 		Lcd_Out(1, 8, ucTexto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_ucTexto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_ucTexto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,88 :: 		Delay_ms(300);
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
;main.c,89 :: 		}
L_main2:
;main.c,90 :: 		if(TECLA_DW == 0){
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
;main.c,91 :: 		uiContador--;
	MOVLW       1
	SUBWF       main_uiContador_L0+0, 1 
	MOVLW       0
	SUBWFB      main_uiContador_L0+1, 1 
;main.c,93 :: 		IntToStr(uiContador, ucTexto);      /* Use esta função de conversão se uiContador for declarada como signed int */
	MOVF        main_uiContador_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_uiContador_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_ucTexto_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_ucTexto_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main.c,94 :: 		Lcd_Out(1, 8, ucTexto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_ucTexto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_ucTexto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,95 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;main.c,96 :: 		}
L_main4:
;main.c,97 :: 		};
	GOTO        L_main0
;main.c,98 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
