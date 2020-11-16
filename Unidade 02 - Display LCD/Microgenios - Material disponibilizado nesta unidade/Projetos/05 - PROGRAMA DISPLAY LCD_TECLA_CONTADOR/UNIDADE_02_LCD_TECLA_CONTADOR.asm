
_ConfigMCU:

;UNIDADE_02_LCD_TECLA_CONTADOR.c,74 :: 		void ConfigMCU()
;UNIDADE_02_LCD_TECLA_CONTADOR.c,77 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,78 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,83 :: 		TRISD.RD0 = 1; //Entrada TECLA
	BSF         TRISD+0, 0 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,84 :: 		PORTD.RD0 = 1; //opcional
	BSF         PORTD+0, 0 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,86 :: 		TRISD.RD1 = 1; //segunta tecla
	BSF         TRISD+0, 1 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,87 :: 		PORTD.RD1 = 1;
	BSF         PORTD+0, 1 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,88 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;UNIDADE_02_LCD_TECLA_CONTADOR.c,91 :: 		void main(){
;UNIDADE_02_LCD_TECLA_CONTADOR.c,92 :: 		signed int Contador = 0;
	CLRF        main_Contador_L0+0 
	CLRF        main_Contador_L0+1 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,95 :: 		ConfigMCU();                       //Inicializa MCU
	CALL        _ConfigMCU+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,97 :: 		Lcd_Init();                        //Inicializa display no modo 4 bits
	CALL        _Lcd_Init+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,98 :: 		Lcd_Cmd(_LCD_CLEAR);               //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,99 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,100 :: 		Lcd_Out(1,1,"Valor:");     //Linha x Coluna
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UNIDADE_02_LCD_TECLA_CONTADOR+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UNIDADE_02_LCD_TECLA_CONTADOR+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,103 :: 		while(TRUE)
L_main0:
;UNIDADE_02_LCD_TECLA_CONTADOR.c,105 :: 		if(TECLA_UP == 0)
	BTFSC       PORTD+0, 0 
	GOTO        L_main2
;UNIDADE_02_LCD_TECLA_CONTADOR.c,112 :: 		Contador++;    //0 a 65535 + 0 = 6, logo a matriz deve ser de no  mínimo 6 bytes
	INFSNZ      main_Contador_L0+0, 1 
	INCF        main_Contador_L0+1, 1 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,113 :: 		WordToStr(Contador, Texto);  //WordToStr é para variável do tipo: unsigned int e consome 6 bytes da matriz
	MOVF        main_Contador_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_Contador_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,124 :: 		Lcd_Out(1,7, Texto); //Escreve no LCD o valor de Contador: Portanto teremos - Valor:65535
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,142 :: 		Delay_ms(300);
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
;UNIDADE_02_LCD_TECLA_CONTADOR.c,144 :: 		}
L_main2:
;UNIDADE_02_LCD_TECLA_CONTADOR.c,146 :: 		if(TECLA_DOWN == 0)
	BTFSC       PORTD+0, 1 
	GOTO        L_main4
;UNIDADE_02_LCD_TECLA_CONTADOR.c,148 :: 		Contador--;
	MOVLW       1
	SUBWF       main_Contador_L0+0, 1 
	MOVLW       0
	SUBWFB      main_Contador_L0+1, 1 
;UNIDADE_02_LCD_TECLA_CONTADOR.c,149 :: 		intToStr(Contador, Texto);
	MOVF        main_Contador_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_Contador_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,150 :: 		LCD_Out(1,7, Texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,151 :: 		Delay_ms(300);
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
;UNIDADE_02_LCD_TECLA_CONTADOR.c,153 :: 		}
L_main4:
;UNIDADE_02_LCD_TECLA_CONTADOR.c,155 :: 		}
	GOTO        L_main0
;UNIDADE_02_LCD_TECLA_CONTADOR.c,157 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
