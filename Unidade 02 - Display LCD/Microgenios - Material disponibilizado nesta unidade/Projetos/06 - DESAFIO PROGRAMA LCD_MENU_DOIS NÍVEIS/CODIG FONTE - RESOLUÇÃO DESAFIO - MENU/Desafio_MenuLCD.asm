
_CondicaoInicialMenu:

;Desafio_MenuLCD.c,73 :: 		void CondicaoInicialMenu()
;Desafio_MenuLCD.c,75 :: 		m_estado_nivel_um = 1;
	MOVLW       1
	MOVWF       _m_estado_nivel_um+0 
	MOVLW       0
	MOVWF       _m_estado_nivel_um+1 
;Desafio_MenuLCD.c,76 :: 		submenu = 0;             //força condição para voltar ao nível 1 do menu
	CLRF        _submenu+0 
	CLRF        _submenu+1 
;Desafio_MenuLCD.c,77 :: 		m_estado_nivel_dois = 1;
	MOVLW       1
	MOVWF       _m_estado_nivel_dois+0 
	MOVLW       0
	MOVWF       _m_estado_nivel_dois+1 
;Desafio_MenuLCD.c,78 :: 		estado_selecionado = 1;
	MOVLW       1
	MOVWF       _estado_selecionado+0 
	MOVLW       0
	MOVWF       _estado_selecionado+1 
;Desafio_MenuLCD.c,81 :: 		Lcd_Cmd(_LCD_CLEAR); //Apaga todos os textos do LCD e reescreve textos iniciais novamente.
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Desafio_MenuLCD.c,82 :: 		Lcd_Out(1, 1,">OPCAO1 [ENTER]");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,83 :: 		Lcd_Out(2, 1," OPCAO2        ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,84 :: 		}
L_end_CondicaoInicialMenu:
	RETURN      0
; end of _CondicaoInicialMenu

_ConfigMCU:

;Desafio_MenuLCD.c,87 :: 		void ConfigMCU()
;Desafio_MenuLCD.c,90 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;Desafio_MenuLCD.c,91 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;Desafio_MenuLCD.c,95 :: 		TRISD.RD0 = 1; PORTD.RD0 = 1;
	BSF         TRISD+0, 0 
	BSF         PORTD+0, 0 
;Desafio_MenuLCD.c,96 :: 		TRISD.RD1 = 1; PORTD.RD1 = 1;
	BSF         TRISD+0, 1 
	BSF         PORTD+0, 1 
;Desafio_MenuLCD.c,97 :: 		TRISD.RD2 = 1; PORTD.RD2 = 1;
	BSF         TRISD+0, 2 
	BSF         PORTD+0, 2 
;Desafio_MenuLCD.c,98 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;Desafio_MenuLCD.c,100 :: 		void main()
;Desafio_MenuLCD.c,102 :: 		ConfigMCU();
	CALL        _ConfigMCU+0, 0
;Desafio_MenuLCD.c,104 :: 		Lcd_Init();                  //Inicializa display LCD
	CALL        _Lcd_Init+0, 0
;Desafio_MenuLCD.c,105 :: 		Lcd_Cmd(_LCD_CLEAR);         //Apaga display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Desafio_MenuLCD.c,106 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);    //Desliga cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Desafio_MenuLCD.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Desafio_MenuLCD.c,110 :: 		Lcd_Out(1, 1,">OPCAO1 [ENTER]");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,111 :: 		Lcd_Out(2, 1," OPCAO2        ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,113 :: 		while (1)
L_main0:
;Desafio_MenuLCD.c,120 :: 		if (SELECIONA_MENU == 0 && submenu == 0)
	BTFSC       PORTD+0, 0 
	GOTO        L_main4
	MOVLW       0
	XORWF       _submenu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVLW       0
	XORWF       _submenu+0, 0 
L__main31:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main27:
;Desafio_MenuLCD.c,122 :: 		switch(m_estado_nivel_um)
	GOTO        L_main5
;Desafio_MenuLCD.c,124 :: 		case 1:
L_main7:
;Desafio_MenuLCD.c,125 :: 		Lcd_Chr(1,1,'>'); LCD_Out(1,9,"[ENTER]");
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,126 :: 		m_estado_nivel_um = 2;
	MOVLW       2
	MOVWF       _m_estado_nivel_um+0 
	MOVLW       0
	MOVWF       _m_estado_nivel_um+1 
;Desafio_MenuLCD.c,127 :: 		estado_selecionado = 1;
	MOVLW       1
	MOVWF       _estado_selecionado+0 
	MOVLW       0
	MOVWF       _estado_selecionado+1 
;Desafio_MenuLCD.c,128 :: 		Lcd_Chr(2,1,' '); LCD_Out(2,9,"       ");
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,129 :: 		break;
	GOTO        L_main6
;Desafio_MenuLCD.c,130 :: 		case 2:
L_main8:
;Desafio_MenuLCD.c,131 :: 		Lcd_Chr(2,1,'>'); LCD_Out(2,9,"[ENTER]");
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,132 :: 		m_estado_nivel_um = 1;
	MOVLW       1
	MOVWF       _m_estado_nivel_um+0 
	MOVLW       0
	MOVWF       _m_estado_nivel_um+1 
;Desafio_MenuLCD.c,133 :: 		estado_selecionado = 2;
	MOVLW       2
	MOVWF       _estado_selecionado+0 
	MOVLW       0
	MOVWF       _estado_selecionado+1 
;Desafio_MenuLCD.c,134 :: 		Lcd_Chr(1,1,' '); LCD_Out(1,9,"       ");
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,135 :: 		break;
	GOTO        L_main6
;Desafio_MenuLCD.c,136 :: 		}
L_main5:
	MOVLW       0
	XORWF       _m_estado_nivel_um+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVLW       1
	XORWF       _m_estado_nivel_um+0, 0 
L__main32:
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVLW       0
	XORWF       _m_estado_nivel_um+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVLW       2
	XORWF       _m_estado_nivel_um+0, 0 
L__main33:
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
L_main6:
;Desafio_MenuLCD.c,137 :: 		}
L_main4:
;Desafio_MenuLCD.c,142 :: 		if (ENTER_MENU == 0)
	BTFSC       PORTD+0, 1 
	GOTO        L_main9
;Desafio_MenuLCD.c,144 :: 		switch(estado_selecionado)
	GOTO        L_main10
;Desafio_MenuLCD.c,146 :: 		case 1:
L_main12:
;Desafio_MenuLCD.c,147 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Desafio_MenuLCD.c,148 :: 		Lcd_Out(1, 1,"OPCAO1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,149 :: 		Lcd_Out(1,9,">SENSO1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,150 :: 		Lcd_Out(2,9," EQUIP1");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,151 :: 		submenu = 1; //Informa que estamos no segundo nível do menu
	MOVLW       1
	MOVWF       _submenu+0 
	MOVLW       0
	MOVWF       _submenu+1 
;Desafio_MenuLCD.c,152 :: 		break;
	GOTO        L_main11
;Desafio_MenuLCD.c,153 :: 		case 2:
L_main13:
;Desafio_MenuLCD.c,154 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Desafio_MenuLCD.c,155 :: 		Lcd_Out(1, 1,"OPCAO2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,156 :: 		Lcd_Out(1,9,">SENSO2");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,157 :: 		Lcd_Out(2,9," EQUIP2");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_Desafio_MenuLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_Desafio_MenuLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Desafio_MenuLCD.c,158 :: 		submenu = 1; //idem
	MOVLW       1
	MOVWF       _submenu+0 
	MOVLW       0
	MOVWF       _submenu+1 
;Desafio_MenuLCD.c,159 :: 		break;
	GOTO        L_main11
;Desafio_MenuLCD.c,160 :: 		}
L_main10:
	MOVLW       0
	XORWF       _estado_selecionado+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVLW       1
	XORWF       _estado_selecionado+0, 0 
L__main34:
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVLW       0
	XORWF       _estado_selecionado+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVLW       2
	XORWF       _estado_selecionado+0, 0 
L__main35:
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
L_main11:
;Desafio_MenuLCD.c,161 :: 		}
L_main9:
;Desafio_MenuLCD.c,165 :: 		if (SELECIONA_MENU == 0 && submenu == 1)
	BTFSC       PORTD+0, 0 
	GOTO        L_main16
	MOVLW       0
	XORWF       _submenu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVLW       1
	XORWF       _submenu+0, 0 
L__main36:
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
L__main26:
;Desafio_MenuLCD.c,167 :: 		switch(m_estado_nivel_dois)
	GOTO        L_main17
;Desafio_MenuLCD.c,169 :: 		case 1:
L_main19:
;Desafio_MenuLCD.c,170 :: 		Lcd_Chr(1,9,'>');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Desafio_MenuLCD.c,171 :: 		m_estado_nivel_dois = 2;
	MOVLW       2
	MOVWF       _m_estado_nivel_dois+0 
	MOVLW       0
	MOVWF       _m_estado_nivel_dois+1 
;Desafio_MenuLCD.c,172 :: 		Lcd_Chr(2,9,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Desafio_MenuLCD.c,173 :: 		break;
	GOTO        L_main18
;Desafio_MenuLCD.c,174 :: 		case 2:
L_main20:
;Desafio_MenuLCD.c,175 :: 		Lcd_Chr(2,9,'>');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       62
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Desafio_MenuLCD.c,176 :: 		m_estado_nivel_dois = 1;
	MOVLW       1
	MOVWF       _m_estado_nivel_dois+0 
	MOVLW       0
	MOVWF       _m_estado_nivel_dois+1 
;Desafio_MenuLCD.c,177 :: 		Lcd_Chr(1,9,' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Desafio_MenuLCD.c,178 :: 		break;
	GOTO        L_main18
;Desafio_MenuLCD.c,179 :: 		}
L_main17:
	MOVLW       0
	XORWF       _m_estado_nivel_dois+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVLW       1
	XORWF       _m_estado_nivel_dois+0, 0 
L__main37:
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVLW       0
	XORWF       _m_estado_nivel_dois+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       2
	XORWF       _m_estado_nivel_dois+0, 0 
L__main38:
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
L_main18:
;Desafio_MenuLCD.c,180 :: 		}
L_main16:
;Desafio_MenuLCD.c,184 :: 		if (RETORNA_MENU_PRINCIPAL == 0 && submenu == 1)
	BTFSC       PORTD+0, 2 
	GOTO        L_main23
	MOVLW       0
	XORWF       _submenu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVLW       1
	XORWF       _submenu+0, 0 
L__main39:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
L__main25:
;Desafio_MenuLCD.c,186 :: 		CondicaoInicialMenu();
	CALL        _CondicaoInicialMenu+0, 0
;Desafio_MenuLCD.c,187 :: 		}
L_main23:
;Desafio_MenuLCD.c,189 :: 		Delay_ms(250); //Como nesse programa não foi usado nenhum tratador
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
	NOP
	NOP
;Desafio_MenuLCD.c,192 :: 		}
	GOTO        L_main0
;Desafio_MenuLCD.c,194 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
