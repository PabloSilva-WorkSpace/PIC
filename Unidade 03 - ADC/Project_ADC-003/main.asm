
_main:

;main.c,22 :: 		void main() {
;main.c,23 :: 		unsigned int Valor_ADC = 0;
;main.c,31 :: 		TRISA.RA0 = 1;             /* Configura o pino RA0/AN0 como entrada */
	BSF         TRISA+0, 0 
;main.c,32 :: 		ADCON1 = 0B00001110;       /* Configura RA0/AN0 como ADC */
	MOVLW       14
	MOVWF       ADCON1+0 
;main.c,35 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,38 :: 		Lcd_Out(1,1,"ADC-AN0: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,40 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;main.c,42 :: 		while(TRUE)
L_main0:
;main.c,44 :: 		Valor_ADC = ADC_Read(0); /* Chamada da rotina (função) que lê uma entrada analógica - neste caso AN0 */
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;main.c,45 :: 		Valor_ADC = Valor_ADC * (1000/1023.);  /* Cria uma escala de 00.00 a 10.00 no display, enquanto a tensão de entrada no canal AN0 varia de 0V a 5V*/
	CALL        _word2double+0, 0
	MOVLW       144
	MOVWF       R4 
	MOVLW       62
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
;main.c,46 :: 		Tensao[0] = (Valor_ADC/1000)   + '0';
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       main_Tensao_L0+0 
;main.c,47 :: 		Tensao[1] = (Valor_ADC/100)%10 + '0';
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       main_Tensao_L0+1 
;main.c,48 :: 		Tensao[2] = '.';
	MOVLW       46
	MOVWF       main_Tensao_L0+2 
;main.c,49 :: 		Tensao[3] = (Valor_ADC/10)%10  + '0';
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       main_Tensao_L0+3 
;main.c,50 :: 		Tensao[4] = (Valor_ADC/1)%10   + '0';
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       main_Tensao_L0+4 
;main.c,51 :: 		Tensao[5] = 0;
	CLRF        main_Tensao_L0+5 
;main.c,53 :: 		Lcd_Out(1, 10, Tensao);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Tensao_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Tensao_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,54 :: 		Delay_ms(20);
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
;main.c,55 :: 		}
	GOTO        L_main0
;main.c,56 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
