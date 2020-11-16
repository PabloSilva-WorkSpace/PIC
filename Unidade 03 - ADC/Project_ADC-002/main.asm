
_ADCRead:

;main.c,28 :: 		unsigned int ADCRead(unsigned char Canal)
;main.c,30 :: 		switch(Canal)
	GOTO        L_ADCRead0
;main.c,32 :: 		case 0:{
L_ADCRead2:
;main.c,33 :: 		ADCON0 = 0B00000001;   /* Selecionamos o ANALOG CHANNEL AN0; e ligamos o módulo ADC */
	MOVLW       1
	MOVWF       ADCON0+0 
;main.c,34 :: 		break;
	GOTO        L_ADCRead1
;main.c,36 :: 		case 1:{
L_ADCRead3:
;main.c,37 :: 		ADCON0 = 0B00000101;   /* Selecionamos o ANALOG CHANNEL AN1; e ligamos o módulo ADC */
	MOVLW       5
	MOVWF       ADCON0+0 
;main.c,38 :: 		break;
	GOTO        L_ADCRead1
;main.c,40 :: 		}
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
;main.c,41 :: 		Delay_us(40); /* Tempo de aquisição - Refere-se ao tempo de carga do capacitor (Veja o tempo minímo no datasheet) */
	MOVLW       26
	MOVWF       R13, 0
L_ADCRead4:
	DECFSZ      R13, 1, 1
	BRA         L_ADCRead4
	NOP
;main.c,42 :: 		ADCON0.GO_DONE = 1; /* Comando de START para a conversão do ADC */
	BSF         ADCON0+0, 1 
;main.c,43 :: 		while(ADCON0.GO_DONE == 1); /* Aguarda o término da conversão - No término da conversão o módulo ADC transiciona o bit GO/DONE para zero ("Low Level Logic"). Este evento pode ser observado por POLLING ou INTERRUPÇÂO, neste caso estamos usando POLLING. */
L_ADCRead5:
	BTFSS       ADCON0+0, 1 
	GOTO        L_ADCRead6
	GOTO        L_ADCRead5
L_ADCRead6:
;main.c,44 :: 		return ( ( (int)ADRESH << 8 ) | ( (int)ADRESL ) ); /* O camando shift insere zeros nas posições desalocadas pelo deslocamento da palavra binária. */
	MOVF        ADRESH+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        R4, 0 
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
;main.c,45 :: 		}
L_end_ADCRead:
	RETURN      0
; end of _ADCRead

_ConfigADC:

;main.c,48 :: 		void ConfigADC()
;main.c,60 :: 		TRISA.RA0 = 1;   /* Configuração individual do pino RA0 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
	BSF         TRISA+0, 0 
;main.c,61 :: 		TRISA.RA1 = 1;   /* Configuração individual do pino RA1 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
	BSF         TRISA+0, 1 
;main.c,62 :: 		ADCON0 = 0B00000001;   /* Seleção do ANALOG CHANNEL AN0; e liga o módulo ADC */
	MOVLW       1
	MOVWF       ADCON0+0 
;main.c,63 :: 		ADCON1 = 0B00001101;   /* Configuramos da tensão de referência; e configuração dos pinos {0, 1} do port A como ANALOG CHANNEL (AN0 e AN1) */
	MOVLW       13
	MOVWF       ADCON1+0 
;main.c,64 :: 		ADCON2 = 0B10101010;
	MOVLW       170
	MOVWF       ADCON2+0 
;main.c,66 :: 		}
L_end_ConfigADC:
	RETURN      0
; end of _ConfigADC

_ConfigLCD:

;main.c,69 :: 		void ConfigLCD()
;main.c,71 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,72 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,73 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,74 :: 		Lcd_Out(1, 1, "ADC-AN0: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,75 :: 		Lcd_Out(2, 1, "ADC_AN1: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,76 :: 		}
L_end_ConfigLCD:
	RETURN      0
; end of _ConfigLCD

_main:

;main.c,79 :: 		void main()
;main.c,84 :: 		ConfigADC();
	CALL        _ConfigADC+0, 0
;main.c,85 :: 		ConfigLCD();
	CALL        _ConfigLCD+0, 0
;main.c,87 :: 		while(TRUE)
L_main7:
;main.c,90 :: 		Leitura_ADC = ADCRead(0);
	CLRF        FARG_ADCRead_Canal+0 
	CALL        _ADCRead+0, 0
;main.c,91 :: 		WordToStr(Leitura_ADC, Texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,92 :: 		LCD_Out(1, 10, Texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,93 :: 		Delay_ms(20);
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
;main.c,95 :: 		Leitura_ADC = ADCRead(1);
	MOVLW       1
	MOVWF       FARG_ADCRead_Canal+0 
	CALL        _ADCRead+0, 0
;main.c,96 :: 		WordToStr(Leitura_ADC, Texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,97 :: 		LCD_Out(2, 10, Texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,98 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;main.c,99 :: 		}
	GOTO        L_main7
;main.c,100 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
