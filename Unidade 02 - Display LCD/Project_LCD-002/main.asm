
_ConfigMCU:

;main.c,23 :: 		void ConfigMCU()
;main.c,28 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,30 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;main.c,33 :: 		void main()
;main.c,35 :: 		ConfigMCU();                     /* Inicializa MCU */
	CALL        _ConfigMCU+0, 0
;main.c,36 :: 		Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
	CALL        _Lcd_Init+0, 0
;main.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,39 :: 		Lcd_Out(1,1,"Primeira Linha");   /* Linha x Coluna*/
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,40 :: 		Lcd_Out(2,1,"Segunda Linha");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,42 :: 		while(1);
L_main0:
	GOTO        L_main0
;main.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
