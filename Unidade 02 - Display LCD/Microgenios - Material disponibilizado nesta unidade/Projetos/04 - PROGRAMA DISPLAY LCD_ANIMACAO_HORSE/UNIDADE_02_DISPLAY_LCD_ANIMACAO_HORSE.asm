
_SpecialChar:

;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,102 :: 		void SpecialChar(char frame) {
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,105 :: 		switch(frame)
	GOTO        L_SpecialChar0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,107 :: 		case 1: {
L_SpecialChar2:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,108 :: 		Lcd_Cmd(0X40);   //aponto para o endereço inicial da CGRAM
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,109 :: 		for (i = 0; i<64; i++){Lcd_Chr_CP(character1A[i]);}
	CLRF        SpecialChar_i_L0+0 
L_SpecialChar3:
	MOVLW       64
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar4
	MOVLW       _character1A+0
	ADDWF       SpecialChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character1A+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character1A+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        SpecialChar_i_L0+0, 1 
	GOTO        L_SpecialChar3
L_SpecialChar4:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,110 :: 		for(i = 0; i < 8; i++)
	CLRF        SpecialChar_i_L0+0 
L_SpecialChar6:
	MOVLW       8
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar7
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,112 :: 		if(i < 4) Lcd_Chr_Cp(i);  //escrever na primeira linha
	MOVLW       4
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar9
	MOVF        SpecialChar_i_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_SpecialChar10
L_SpecialChar9:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,113 :: 		else Lcd_Chr(2, (1 + i-4), i);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        SpecialChar_i_L0+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       4
	SUBWF       FARG_Lcd_Chr_column+0, 1 
	MOVF        SpecialChar_i_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_SpecialChar10:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,110 :: 		for(i = 0; i < 8; i++)
	INCF        SpecialChar_i_L0+0, 1 
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,114 :: 		}
	GOTO        L_SpecialChar6
L_SpecialChar7:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,115 :: 		break;
	GOTO        L_SpecialChar1
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,118 :: 		case 2: {
L_SpecialChar11:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,119 :: 		Lcd_Cmd(0X40);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,120 :: 		for (i = 0; i<64; i++){Lcd_Chr_CP(character2A[i]);}
	CLRF        SpecialChar_i_L0+0 
L_SpecialChar12:
	MOVLW       64
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar13
	MOVLW       _character2A+0
	ADDWF       SpecialChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character2A+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character2A+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        SpecialChar_i_L0+0, 1 
	GOTO        L_SpecialChar12
L_SpecialChar13:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,121 :: 		for(i = 0; i < 8; i++)
	CLRF        SpecialChar_i_L0+0 
L_SpecialChar15:
	MOVLW       8
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar16
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,123 :: 		if(i < 4) Lcd_Chr(1, 1 + i,i);
	MOVLW       4
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar18
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        SpecialChar_i_L0+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        SpecialChar_i_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	GOTO        L_SpecialChar19
L_SpecialChar18:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,124 :: 		else Lcd_Chr(2, (1 + i-4), i);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        SpecialChar_i_L0+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       4
	SUBWF       FARG_Lcd_Chr_column+0, 1 
	MOVF        SpecialChar_i_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_SpecialChar19:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,121 :: 		for(i = 0; i < 8; i++)
	INCF        SpecialChar_i_L0+0, 1 
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,125 :: 		}
	GOTO        L_SpecialChar15
L_SpecialChar16:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,126 :: 		break;
	GOTO        L_SpecialChar1
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,129 :: 		case 3: {
L_SpecialChar20:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,130 :: 		Lcd_Cmd(0X40);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,131 :: 		for (i = 0; i<64; i++){Lcd_Chr_CP(character3A[i]);}
	CLRF        SpecialChar_i_L0+0 
L_SpecialChar21:
	MOVLW       64
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar22
	MOVLW       _character3A+0
	ADDWF       SpecialChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character3A+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character3A+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        SpecialChar_i_L0+0, 1 
	GOTO        L_SpecialChar21
L_SpecialChar22:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,132 :: 		for(i = 0; i < 8; i++)
	CLRF        SpecialChar_i_L0+0 
L_SpecialChar24:
	MOVLW       8
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar25
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,134 :: 		if(i < 4) Lcd_Chr(1, 1 + i,i);
	MOVLW       4
	SUBWF       SpecialChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_SpecialChar27
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        SpecialChar_i_L0+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        SpecialChar_i_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	GOTO        L_SpecialChar28
L_SpecialChar27:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,135 :: 		else Lcd_Chr(2, (1 + i-4), i);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        SpecialChar_i_L0+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       4
	SUBWF       FARG_Lcd_Chr_column+0, 1 
	MOVF        SpecialChar_i_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_SpecialChar28:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,132 :: 		for(i = 0; i < 8; i++)
	INCF        SpecialChar_i_L0+0, 1 
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,136 :: 		}
	GOTO        L_SpecialChar24
L_SpecialChar25:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,137 :: 		break;
	GOTO        L_SpecialChar1
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,140 :: 		}
L_SpecialChar0:
	MOVF        FARG_SpecialChar_frame+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_SpecialChar2
	MOVF        FARG_SpecialChar_frame+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_SpecialChar11
	MOVF        FARG_SpecialChar_frame+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_SpecialChar20
L_SpecialChar1:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,141 :: 		}
L_end_SpecialChar:
	RETURN      0
; end of _SpecialChar

_ConfigMCU:

;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,145 :: 		void ConfigMCU()
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,148 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,152 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,153 :: 		void main(){
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,155 :: 		ConfigMCU();                       //Inicializa MCU
	CALL        _ConfigMCU+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,157 :: 		Lcd_Init();                        //Inicializa display no modo 4 bits
	CALL        _Lcd_Init+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,158 :: 		Lcd_Cmd(_LCD_CLEAR);               //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,159 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,160 :: 		Lcd_Out(1,1,"");                   //Linha x Coluna
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,161 :: 		Lcd_Out(2,1,"");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,164 :: 		while(TRUE)
L_main29:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,167 :: 		for(ucX = 0; ucX < 9; ucX++)
	CLRF        main_ucX_L0+0 
L_main31:
	MOVLW       9
	SUBWF       main_ucX_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main32
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,169 :: 		SpecialChar(FRAME1);
	MOVLW       1
	MOVWF       FARG_SpecialChar_frame+0 
	CALL        _SpecialChar+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,170 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,171 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
	NOP
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,173 :: 		SpecialChar(FRAME2);
	MOVLW       2
	MOVWF       FARG_SpecialChar_frame+0 
	CALL        _SpecialChar+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,174 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,175 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	DECFSZ      R11, 1, 1
	BRA         L_main35
	NOP
	NOP
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,177 :: 		SpecialChar(FRAME3);
	MOVLW       3
	MOVWF       FARG_SpecialChar_frame+0 
	CALL        _SpecialChar+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,178 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,179 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 1
	BRA         L_main36
	DECFSZ      R12, 1, 1
	BRA         L_main36
	DECFSZ      R11, 1, 1
	BRA         L_main36
	NOP
	NOP
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,167 :: 		for(ucX = 0; ucX < 9; ucX++)
	INCF        main_ucX_L0+0, 1 
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,180 :: 		}
	GOTO        L_main31
L_main32:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,182 :: 		for(ucX = 0; ucX < 13; ucX++)LCD_Cmd(_LCD_SHIFT_RIGHT);
	CLRF        main_ucX_L0+0 
L_main37:
	MOVLW       13
	SUBWF       main_ucX_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main38
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	INCF        main_ucX_L0+0, 1 
	GOTO        L_main37
L_main38:
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,183 :: 		}
	GOTO        L_main29
;UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c,184 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
