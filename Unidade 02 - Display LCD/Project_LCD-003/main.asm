
_CustomChar1:

;main.c,31 :: 		void CustomChar1(char pos_row, char pos_char)
;main.c,34 :: 		Lcd_Cmd(64);   /* Este comando posiciona o cursor virtual no endereço 64 (0x40) - Primeiro caractere da CGRAM */
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,35 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
	CLRF        CustomChar1_i_L0+0 
L_CustomChar10:
	MOVF        CustomChar1_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar11
	MOVLW       _character1+0
	ADDWF       CustomChar1_i_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_character1+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_character1+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar1_i_L0+0, 1 
	GOTO        L_CustomChar10
L_CustomChar11:
;main.c,36 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,37 :: 		Lcd_Chr(pos_row, pos_char, 0);   /* Este comando transfere o caractere customizado na posição '0' da CGRAM para a posição (pos_row, pos_char) do visor - DDRAM */
	MOVF        FARG_CustomChar1_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar1_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,38 :: 		}
L_end_CustomChar1:
	RETURN      0
; end of _CustomChar1

_CustomChar2:

;main.c,41 :: 		void CustomChar2(char pos_row, char pos_char) {
;main.c,43 :: 		Lcd_Cmd(72);   /* Este comando posiciona o cursor virtual no endereço 72 (0x48) - Segundo caractere da CGRAM */
	MOVLW       72
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,44 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
	CLRF        CustomChar2_i_L0+0 
L_CustomChar23:
	MOVF        CustomChar2_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar24
	MOVLW       _character2+0
	ADDWF       CustomChar2_i_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_character2+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_character2+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar2_i_L0+0, 1 
	GOTO        L_CustomChar23
L_CustomChar24:
;main.c,45 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,46 :: 		Lcd_Chr(pos_row, pos_char, 1);   /* Este comando transfere o caractere customizado na posição '1' da CGRAM para a posição (pos_row, pos_char) do visor  - DDRAM */
	MOVF        FARG_CustomChar2_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar2_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;main.c,47 :: 		}
L_end_CustomChar2:
	RETURN      0
; end of _CustomChar2

_ConfigMCU:

;main.c,50 :: 		void ConfigMCU()
;main.c,55 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,57 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;main.c,60 :: 		void main()
;main.c,64 :: 		ConfigMCU();                     /* Inicializa MCU */
	CALL        _ConfigMCU+0, 0
;main.c,65 :: 		Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
	CALL        _Lcd_Init+0, 0
;main.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,67 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,68 :: 		Lcd_Out(1,1,"Primeira Linha");   /* Linha x Coluna*/
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,69 :: 		Lcd_Out(2,1,"Ma a!");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,72 :: 		for(ucX = 0; ucX <= 15; ++ucX){
	CLRF        main_ucX_L0+0 
L_main6:
	MOVF        main_ucX_L0+0, 0 
	SUBLW       15
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
;main.c,73 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;main.c,74 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,72 :: 		for(ucX = 0; ucX <= 15; ++ucX){
	INCF        main_ucX_L0+0, 1 
;main.c,75 :: 		}
	GOTO        L_main6
L_main7:
;main.c,78 :: 		for(ucX = 0; ucX <= 15; ++ucX){
	CLRF        main_ucX_L0+0 
L_main10:
	MOVF        main_ucX_L0+0, 0 
	SUBLW       15
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
;main.c,79 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
;main.c,80 :: 		LCD_Cmd(_LCD_SHIFT_LEFT);
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,78 :: 		for(ucX = 0; ucX <= 15; ++ucX){
	INCF        main_ucX_L0+0, 1 
;main.c,81 :: 		}
	GOTO        L_main10
L_main11:
;main.c,84 :: 		CustomChar1(2, 3);
	MOVLW       2
	MOVWF       FARG_CustomChar1_pos_row+0 
	MOVLW       3
	MOVWF       FARG_CustomChar1_pos_char+0 
	CALL        _CustomChar1+0, 0
;main.c,87 :: 		CustomChar2(2, 7);
	MOVLW       2
	MOVWF       FARG_CustomChar2_pos_row+0 
	MOVLW       7
	MOVWF       FARG_CustomChar2_pos_char+0 
	CALL        _CustomChar2+0, 0
;main.c,89 :: 		while(1){
L_main14:
;main.c,91 :: 		};
	GOTO        L_main14
;main.c,92 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
