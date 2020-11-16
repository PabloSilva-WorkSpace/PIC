
_ConfigMCU:

;UNIDADE_03_DESAFIO_ADC_LCD.c,69 :: 		void ConfigMCU()
;UNIDADE_03_DESAFIO_ADC_LCD.c,72 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;UNIDADE_03_DESAFIO_ADC_LCD.c,73 :: 		ANSELA.B0 = 1;   //AN0
	BSF         ANSELA+0, 0 
;UNIDADE_03_DESAFIO_ADC_LCD.c,74 :: 		ANSELA.B1 = 1;   //AN1
	BSF         ANSELA+0, 1 
;UNIDADE_03_DESAFIO_ADC_LCD.c,79 :: 		TRISA.RA0 = 1;
	BSF         TRISA+0, 0 
;UNIDADE_03_DESAFIO_ADC_LCD.c,80 :: 		PORTA.RA0 = 1;
	BSF         PORTA+0, 0 
;UNIDADE_03_DESAFIO_ADC_LCD.c,82 :: 		TRISA.RA1 = 1;
	BSF         TRISA+0, 1 
;UNIDADE_03_DESAFIO_ADC_LCD.c,83 :: 		PORTA.RA1 = 1;
	BSF         PORTA+0, 1 
;UNIDADE_03_DESAFIO_ADC_LCD.c,85 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;UNIDADE_03_DESAFIO_ADC_LCD.c,86 :: 		void main(){
;UNIDADE_03_DESAFIO_ADC_LCD.c,90 :: 		ConfigMCU();                       //Inicializa MCU
	CALL        _ConfigMCU+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,92 :: 		Lcd_Init();                        //Inicializa display no modo 4 bits
	CALL        _Lcd_Init+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);               //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,95 :: 		Lcd_Out(1,1,"S1:");     //Linha x Coluna
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UNIDADE_03_DESAFIO_ADC_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UNIDADE_03_DESAFIO_ADC_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,96 :: 		Lcd_Out(2,1,"S2:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_UNIDADE_03_DESAFIO_ADC_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_UNIDADE_03_DESAFIO_ADC_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,98 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,100 :: 		while(TRUE)
L_main0:
;UNIDADE_03_DESAFIO_ADC_LCD.c,103 :: 		Leitura_ADC = ADC_Read(0); //S1 -> AN0
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,105 :: 		Leitura_ADC = (int)Leitura_ADC * (100./1023.);
	CALL        _Int2Double+0, 0
	MOVLW       13
	MOVWF       R4 
	MOVLW       50
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Word+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,106 :: 		WordToStr(Leitura_ADC, Texto);  //65535 + 0 = 6 posições
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,107 :: 		LCD_Out(1,4, Texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,108 :: 		LCD_Chr_Cp('%');
	MOVLW       37
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,109 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;UNIDADE_03_DESAFIO_ADC_LCD.c,112 :: 		Leitura_ADC = ADC_Read(1); //S1 -> AN0
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,114 :: 		Leitura_ADC = (int)Leitura_ADC * (255./1023.);
	CALL        _Int2Double+0, 0
	MOVLW       208
	MOVWF       R4 
	MOVLW       63
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Word+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,115 :: 		WordToStr(Leitura_ADC, Texto);  //65535 + 0 = 6 posições
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,116 :: 		LCD_Out(2,4, Texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_DESAFIO_ADC_LCD.c,117 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
	NOP
;UNIDADE_03_DESAFIO_ADC_LCD.c,120 :: 		}
	GOTO        L_main0
;UNIDADE_03_DESAFIO_ADC_LCD.c,121 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
