
_ConfigADC:

;main.c,28 :: 		void ConfigADC()
;main.c,37 :: 		TRISA.RA0 = 1;   /* Configuração individual do pino RA0 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
	BSF         TRISA+0, 0 
;main.c,38 :: 		ADCON0 = 0B00000001;   /* (1) Seleciona o ANALOG CHANNEL ; (2) START na conversão; (3) LIGA/DESLIGA o módulo ADC*/
	MOVLW       1
	MOVWF       ADCON0+0 
;main.c,39 :: 		ADCON1 = 0B00001110;   /* (1) Configura a tensão de referência; (2) Configura os pinos entre ANALOG CHANNEL ou DIGITAL I/O*/
	MOVLW       14
	MOVWF       ADCON1+0 
;main.c,40 :: 		ADCON2 = 0B10101010;   /* (1) Configura a justificativa do valor digital; (2) Configura o tempo de uma aquisição do ADC; (3) Configura o clock do ADC */
	MOVLW       170
	MOVWF       ADCON2+0 
;main.c,42 :: 		}
L_end_ConfigADC:
	RETURN      0
; end of _ConfigADC

_ConfigLCD:

;main.c,45 :: 		void ConfigLCD()
;main.c,47 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,49 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,50 :: 		Lcd_Out(1, 1, "ADC: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,51 :: 		}
L_end_ConfigLCD:
	RETURN      0
; end of _ConfigLCD

_main:

;main.c,54 :: 		void main()
;main.c,59 :: 		ConfigADC();
	CALL        _ConfigADC+0, 0
;main.c,61 :: 		ConfigLCD();
	CALL        _ConfigLCD+0, 0
;main.c,63 :: 		while(TRUE)
L_main0:
;main.c,65 :: 		ADCON0.GO_DONE = 1; /* Comando de START para a conversão do ADC */
	BSF         ADCON0+0, 1 
;main.c,66 :: 		while(ADCON0.GO_DONE == 1); /* Aguarda o término da conversão - No término da conversão o módulo ADC transiciona o bit GO/DONE para zero ("Low Level Logic"). Este evento pode ser observado por POLLING ou INTERRUPÇÂO, neste caso estamos usando POLLING. */
L_main2:
	BTFSS       ADCON0+0, 1 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;main.c,67 :: 		Leitura_ADC = ( ( (int)ADRESH << 8 ) | ( (int)ADRESL ) );   /* O camando shift insere zeros nas posições desalocadas pelo deslocamento da palavra binária. */
	MOVF        ADRESH+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	MOVWF       FARG_WordToStr_input+1 
	MOVF        FARG_WordToStr_input+0, 0 
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
;main.c,68 :: 		WordToStr(Leitura_ADC, Texto);
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,69 :: 		LCD_Out(1, 6, Texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_Texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_Texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,70 :: 		Delay_ms(20);
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
;main.c,71 :: 		}
	GOTO        L_main0
;main.c,72 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
