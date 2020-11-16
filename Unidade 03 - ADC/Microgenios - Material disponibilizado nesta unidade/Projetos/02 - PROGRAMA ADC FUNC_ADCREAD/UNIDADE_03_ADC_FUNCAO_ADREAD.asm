
_ADCRead:

;UNIDADE_03_ADC_FUNCAO_ADREAD.c,20 :: 		unsigned int ADCRead(unsigned char Canal)
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,22 :: 		switch(Canal)
	GOTO        L_ADCRead0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,24 :: 		case 0: {
L_ADCRead2:
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,25 :: 		ANSELA.B0 = 1;        //Somente RA0/AN0 como ADC  - valido somente para o PIC18F45K22
	BSF         ANSELA+0, 0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,26 :: 		TRISA.RA0 = 1;        //Entrada pois estamos usando AN0
	BSF         TRISA+0, 0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,27 :: 		PORTA.RA0 = 1;        //Opcional
	BSF         PORTA+0, 0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,29 :: 		ADCON0 = 0B00000001;  //AN0 -> AD ligado
	MOVLW       1
	MOVWF       ADCON0+0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,30 :: 		ADCON1 = 0B00001110;  //AN0/RA0 config. como AD, tensão de referencia interna do ADC.
	MOVLW       14
	MOVWF       ADCON1+0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,32 :: 		break;
	GOTO        L_ADCRead1
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,35 :: 		case 1: {
L_ADCRead3:
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,36 :: 		ANSELA.B1 = 1;        //Somente RA1/AN1 como ADC  - valido somente para o PIC18F45K22
	BSF         ANSELA+0, 1 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,37 :: 		TRISA.RA1 = 1;        //Entrada pois estamos usando AN0
	BSF         TRISA+0, 1 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,38 :: 		PORTA.RA1 = 1;        //Opcional
	BSF         PORTA+0, 1 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,40 :: 		ADCON0 = 0B00000101;  //AN0 -> AD ligado
	MOVLW       5
	MOVWF       ADCON0+0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,41 :: 		ADCON1 = 0B00001111;  //Caso venhamos a usar o PIC18F4520
	MOVLW       15
	MOVWF       ADCON1+0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,46 :: 		break;
	GOTO        L_ADCRead1
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,49 :: 		}
L_ADCRead0:
	MOVF        FARG_ADCRead_Canal+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_ADCRead2
	MOVF        FARG_ADCRead_Canal+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_ADCRead3
L_ADCRead1:
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,51 :: 		ADCON2 = 0B10101010;  //justificativa para direita, Fosc/32, 12Tad
	MOVLW       170
	MOVWF       ADCON2+0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,52 :: 		Delay_us(40);         //tempo de aquisição, foram de 7.45us
	MOVLW       26
	MOVWF       R13, 0
L_ADCRead4:
	DECFSZ      R13, 1, 1
	BRA         L_ADCRead4
	NOP
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,54 :: 		ADCON0.GO_DONE = 1;           //Start na conversão do ADC
	BSF         ADCON0+0, 1 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,55 :: 		while(ADCON0.GO_DONE == 1);   //Aguardar o término da conversão
L_ADCRead5:
	BTFSS       ADCON0+0, 1 
	GOTO        L_ADCRead6
	GOTO        L_ADCRead5
L_ADCRead6:
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,56 :: 		return ((ADRESH << 8) | (int)ADRESL);  //0 a 1023 pois ADC é 10bits
	MOVF        ADRESH+0, 0 
	MOVWF       R3 
	CLRF        R2 
	MOVF        ADRESL+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
	IORWF       R0, 1 
	MOVF        R3, 0 
	IORWF       R1, 1 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,59 :: 		}
L_end_ADCRead:
	RETURN      0
; end of _ADCRead

_main:

;UNIDADE_03_ADC_FUNCAO_ADREAD.c,62 :: 		void main() {
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,67 :: 		ANSELB = 0;           //PortB como I/O digital
	CLRF        ANSELB+0 
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,70 :: 		Lcd_Init();                        //Inicializa display no modo 4 bits
	CALL        _Lcd_Init+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);               //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,72 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,73 :: 		Lcd_Out(1,1,"ADC: ");              //Linha x Coluna
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UNIDADE_03_ADC_FUNCAO_ADREAD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UNIDADE_03_ADC_FUNCAO_ADREAD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,75 :: 		while(1)
L_main7:
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,77 :: 		Leitura_ADC = ADCRead(0);      //lê o canal AN0
	CLRF        FARG_ADCRead_Canal+0 
	CALL        _ADCRead+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,78 :: 		WordToStr(Leitura_ADC, Texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,79 :: 		LCD_Out(1,5, Texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,80 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,82 :: 		}
	GOTO        L_main7
;UNIDADE_03_ADC_FUNCAO_ADREAD.c,84 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
