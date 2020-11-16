
_main:

;main.c,31 :: 		void main() {
;main.c,32 :: 		float Valor_ADC = 0;
;main.c,40 :: 		TRISA.RA0 = 1;             /* Configura o pino RA0/AN0 como entrada */
	BSF         TRISA+0, 0 
;main.c,41 :: 		ADCON1 = 0B00001110;       /* Configura RA0/AN0 como ADC */
	MOVLW       14
	MOVWF       ADCON1+0 
;main.c,44 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,46 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,47 :: 		Lcd_Out(1,1,"AN0: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,49 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;main.c,51 :: 		while(TRUE)
L_main0:
;main.c,53 :: 		Valor_ADC = ADC_Read(0); /* Chamada da rotina (função) que lê uma entrada analógica - neste caso AN0 */
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
;main.c,56 :: 		floatToStr(Valor_ADC, Tensao);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       main_Tensao_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(main_Tensao_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;main.c,58 :: 		Lcd_Out(1, 6, Tensao);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Tensao_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Tensao_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,59 :: 		Delay_ms(20);
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
;main.c,60 :: 		}
	GOTO        L_main0
;main.c,61 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
