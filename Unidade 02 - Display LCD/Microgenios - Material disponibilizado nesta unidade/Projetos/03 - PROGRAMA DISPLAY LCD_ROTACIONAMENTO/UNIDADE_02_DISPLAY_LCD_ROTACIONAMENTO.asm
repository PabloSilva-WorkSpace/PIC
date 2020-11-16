
_CustomChar1:

;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,73 :: 		void CustomChar1(char pos_row, char pos_char) {
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,75 :: 		Lcd_Cmd(0X40);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,76 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
	CLRF        CustomChar1_i_L0+0 
L_CustomChar10:
	MOVF        CustomChar1_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar11
	MOVLW       _character1+0
	ADDWF       CustomChar1_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character1+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character1+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar1_i_L0+0, 1 
	GOTO        L_CustomChar10
L_CustomChar11:
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,77 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,78 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar1_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar1_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,79 :: 		}
L_end_CustomChar1:
	RETURN      0
; end of _CustomChar1

_CustomChar2:

;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,83 :: 		void CustomChar2(char pos_row, char pos_char) {
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,85 :: 		Lcd_Cmd(0X48);
	MOVLW       72
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,86 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
	CLRF        CustomChar2_i_L0+0 
L_CustomChar23:
	MOVF        CustomChar2_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar24
	MOVLW       _character2+0
	ADDWF       CustomChar2_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character2+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character2+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar2_i_L0+0, 1 
	GOTO        L_CustomChar23
L_CustomChar24:
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,87 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,88 :: 		Lcd_Chr(pos_row, pos_char, 1);
	MOVF        FARG_CustomChar2_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar2_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,89 :: 		}
L_end_CustomChar2:
	RETURN      0
; end of _CustomChar2

_ConfigMCU:

;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,91 :: 		void ConfigMCU()
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,94 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,98 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,99 :: 		void main(){
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,101 :: 		ConfigMCU();                       //Inicializa MCU
	CALL        _ConfigMCU+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,103 :: 		Lcd_Init();                        //Inicializa display no modo 4 bits
	CALL        _Lcd_Init+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,104 :: 		Lcd_Cmd(_LCD_CLEAR);               //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,105 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,106 :: 		Lcd_Out(1,1,"PRIMEIRA LINHA");     //Linha x Coluna
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,107 :: 		Lcd_Out(2,1,"MA OCA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,109 :: 		for(ucX = 0; ucX < 16; ++ucX)
	CLRF        main_ucX_L0+0 
L_main6:
	MOVLW       16
	SUBWF       main_ucX_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,111 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,112 :: 		Delay_ms(500);
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
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,109 :: 		for(ucX = 0; ucX < 16; ++ucX)
	INCF        main_ucX_L0+0, 1 
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,113 :: 		}
	GOTO        L_main6
L_main7:
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,115 :: 		for(ucX = 0; ucX < 16; ++ucX)
	CLRF        main_ucX_L0+0 
L_main10:
	MOVLW       16
	SUBWF       main_ucX_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,117 :: 		LCD_Cmd(_LCD_SHIFT_LEFT);
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,118 :: 		Delay_ms(500);
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
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,115 :: 		for(ucX = 0; ucX < 16; ++ucX)
	INCF        main_ucX_L0+0, 1 
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,119 :: 		}
	GOTO        L_main10
L_main11:
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,120 :: 		CustomChar1(2,3);
	MOVLW       2
	MOVWF       FARG_CustomChar1_pos_row+0 
	MOVLW       3
	MOVWF       FARG_CustomChar1_pos_char+0 
	CALL        _CustomChar1+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,121 :: 		CustomChar2(2,8);
	MOVLW       2
	MOVWF       FARG_CustomChar2_pos_row+0 
	MOVLW       8
	MOVWF       FARG_CustomChar2_pos_char+0 
	CALL        _CustomChar2+0, 0
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,123 :: 		while(TRUE);
L_main14:
	GOTO        L_main14
;UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c,124 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
