
_main:

;main.c,70 :: 		void main(){
;main.c,71 :: 		unsigned int Valor_ADC = 0;
	CLRF        main_Valor_ADC_L0+0 
	CLRF        main_Valor_ADC_L0+1 
;main.c,75 :: 		TRISA.RA0 = 1;
	BSF         TRISA+0, 0 
;main.c,76 :: 		ANSELA = 0X01;
	MOVLW       1
	MOVWF       ANSELA+0 
;main.c,77 :: 		ANSELB = 0;                        // Configure PORTB pins as digital
	CLRF        ANSELB+0 
;main.c,83 :: 		Lcd_Init();                        // Initialize Lcd
	CALL        _Lcd_Init+0, 0
;main.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,85 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,86 :: 		Lcd_Out(1,1,"ADC0:");   //Escreve na Linha x Coluna do LCD o texto "Alarme"
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,88 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;main.c,90 :: 		while(TRUE)
L_main0:
;main.c,92 :: 		Valor_ADC = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_Valor_ADC_L0+0 
	MOVF        R1, 0 
	MOVWF       main_Valor_ADC_L0+1 
;main.c,93 :: 		Valor_ADC = Valor_ADC * (1234/1023.);    //0 ao 1023 -> 0 ao 1234
	CALL        _Word2Double+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       26
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Word+0, 0
	MOVF        R0, 0 
	MOVWF       main_Valor_ADC_L0+0 
	MOVF        R1, 0 
	MOVWF       main_Valor_ADC_L0+1 
;main.c,94 :: 		Tensao[0] = (Valor_ADC/1000) + '0';      // 6 + '0'  = '6'
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       main_Tensao_L0+0 
;main.c,95 :: 		Tensao[1] = (Valor_ADC/100)%10 + '0';    //'6' - '0' = 6
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_Valor_ADC_L0+0, 0 
	MOVWF       R0 
	MOVF        main_Valor_ADC_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       main_Tensao_L0+1 
;main.c,96 :: 		Tensao[2] = '.';
	MOVLW       46
	MOVWF       main_Tensao_L0+2 
;main.c,97 :: 		Tensao[3] = (Valor_ADC/10)%10 + '0';
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_Valor_ADC_L0+0, 0 
	MOVWF       R0 
	MOVF        main_Valor_ADC_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       main_Tensao_L0+3 
;main.c,98 :: 		Tensao[4] = (Valor_ADC/1)%10 + '0';
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        main_Valor_ADC_L0+0, 0 
	MOVWF       R0 
	MOVF        main_Valor_ADC_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       main_Tensao_L0+4 
;main.c,99 :: 		Tensao[5] = 0;  //terminador NULL*/
	CLRF        main_Tensao_L0+5 
;main.c,105 :: 		Lcd_Out(1,6,Tensao); // Mostra os valores no display
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Tensao_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Tensao_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,106 :: 		Delay_ms(20);
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
;main.c,107 :: 		}
	GOTO        L_main0
;main.c,108 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
