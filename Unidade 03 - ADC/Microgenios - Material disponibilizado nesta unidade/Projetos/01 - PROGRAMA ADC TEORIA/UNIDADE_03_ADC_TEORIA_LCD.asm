
_main:

;UNIDADE_03_ADC_TEORIA_LCD.c,18 :: 		void main() {
;UNIDADE_03_ADC_TEORIA_LCD.c,23 :: 		ANSELA.B0 = 1;        //Somente RA0/AN0 como ADC
	BSF         ANSELA+0, 0 
;UNIDADE_03_ADC_TEORIA_LCD.c,24 :: 		ANSELB = 0;           //PortB como I/O digital
	CLRF        ANSELB+0 
;UNIDADE_03_ADC_TEORIA_LCD.c,27 :: 		TRISA.RA0 = 1;        //Entrada pois estamos usando AN0
	BSF         TRISA+0, 0 
;UNIDADE_03_ADC_TEORIA_LCD.c,28 :: 		PORTA.RA0 = 1;        //Opcional
	BSF         PORTA+0, 0 
;UNIDADE_03_ADC_TEORIA_LCD.c,30 :: 		ADCON0 = 0B00000001;  //AN0 -> AD ligado
	MOVLW       1
	MOVWF       ADCON0+0 
;UNIDADE_03_ADC_TEORIA_LCD.c,31 :: 		ADCON1 = 0B00001110;  //AN0/RA0 config. como AD, tensão de referencia interna do ADC.
	MOVLW       14
	MOVWF       ADCON1+0 
;UNIDADE_03_ADC_TEORIA_LCD.c,32 :: 		ADCON2 = 0B10101010;  //justificativa para direita, Fosc/32, 12Tad
	MOVLW       170
	MOVWF       ADCON2+0 
;UNIDADE_03_ADC_TEORIA_LCD.c,34 :: 		Lcd_Init();                        //Inicializa display no modo 4 bits
	CALL        _Lcd_Init+0, 0
;UNIDADE_03_ADC_TEORIA_LCD.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);               //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_03_ADC_TEORIA_LCD.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_03_ADC_TEORIA_LCD.c,37 :: 		Lcd_Out(1,1,"ADC: ");              //Linha x Coluna
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UNIDADE_03_ADC_TEORIA_LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UNIDADE_03_ADC_TEORIA_LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_ADC_TEORIA_LCD.c,39 :: 		while(1)
L_main0:
;UNIDADE_03_ADC_TEORIA_LCD.c,41 :: 		ADCON0.GO_DONE = 1;           //Start na conversão do ADC
	BSF         ADCON0+0, 1 
;UNIDADE_03_ADC_TEORIA_LCD.c,42 :: 		while(ADCON0.GO_DONE == 1);   //Aguardar o término da conversão
L_main2:
	BTFSS       ADCON0+0, 1 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;UNIDADE_03_ADC_TEORIA_LCD.c,45 :: 		Leitura_ADC = ((ADRESH << 8) | (int)ADRESL);  //0 a 1023 pois ADC é 10bits
	MOVF        ADRESH+0, 0 
	MOVWF       FARG_WordToStr_input+1 
	CLRF        FARG_WordToStr_input+0 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R0, 0 
	IORWF       FARG_WordToStr_input+0, 1 
	MOVF        R1, 0 
	IORWF       FARG_WordToStr_input+1, 1 
;UNIDADE_03_ADC_TEORIA_LCD.c,57 :: 		WordToStr(Leitura_ADC, Texto);
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;UNIDADE_03_ADC_TEORIA_LCD.c,58 :: 		LCD_Out(1,5, Texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_ADC_TEORIA_LCD.c,59 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;UNIDADE_03_ADC_TEORIA_LCD.c,61 :: 		}
	GOTO        L_main0
;UNIDADE_03_ADC_TEORIA_LCD.c,63 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
