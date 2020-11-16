
_main:

;main.c,69 :: 		void main(){
;main.c,72 :: 		ANSELB = 0;                        // Configure PORTB pins as digital
	CLRF        ANSELB+0 
;main.c,73 :: 		ANSELD = 0;                        // Configura PORTD como digital
	CLRF        ANSELD+0 
;main.c,75 :: 		TRISD.RD0 = 1;
	BSF         TRISD+0, 0 
;main.c,76 :: 		PORTD.RD0 = 1;
	BSF         PORTD+0, 0 
;main.c,78 :: 		Lcd_Init();                        // Initialize Lcd
	CALL        _Lcd_Init+0, 0
;main.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,80 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,81 :: 		Lcd_Out(1,1,"PRIMEIRA LINHA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,82 :: 		Lcd_Out(2,1,"SEGUNDA COLUNA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,84 :: 		while(TRUE)
L_main0:
;main.c,86 :: 		for(_x = 0; _x < 16; _x++)
	CLRF        main__x_L0+0 
L_main2:
	MOVLW       16
	SUBWF       main__x_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;main.c,88 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,89 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;main.c,86 :: 		for(_x = 0; _x < 16; _x++)
	INCF        main__x_L0+0, 1 
;main.c,90 :: 		}
	GOTO        L_main2
L_main3:
;main.c,92 :: 		for(_x = 0; _x < 16; _x++)
	CLRF        main__x_L0+0 
L_main6:
	MOVLW       16
	SUBWF       main__x_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;main.c,94 :: 		LCD_Cmd(_LCD_SHIFT_LEFT);
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,95 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;main.c,92 :: 		for(_x = 0; _x < 16; _x++)
	INCF        main__x_L0+0, 1 
;main.c,96 :: 		}
	GOTO        L_main6
L_main7:
;main.c,97 :: 		}
	GOTO        L_main0
;main.c,98 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
