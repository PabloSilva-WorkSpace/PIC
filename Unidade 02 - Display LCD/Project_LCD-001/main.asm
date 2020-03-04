
_ConfigMCU:

;main.c,11 :: 		void ConfigMCU()
;main.c,16 :: 		ADCON1 |= 0x0F;    /* Configura o PortB como I/O digital (por exemplo, no PIC18F4520) */
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,18 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;main.c,21 :: 		void main() {
;main.c,22 :: 		ConfigMCU();
	CALL        _ConfigMCU+0, 0
;main.c,24 :: 		DisplayLCD_Init();
	CALL        _DisplayLCD_Init+0, 0
;main.c,25 :: 		DisplayLCD_Cmd(LCD_Clear);
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Cmd+0 
	MOVLW       0
	MOVWF       FARG_DisplayLCD_Cmd+1 
	CALL        _DisplayLCD_Cmd+0, 0
;main.c,26 :: 		DisplayLCD_Print(1, 1, "   LCD Display   ");
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Print+0 
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Print+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_DisplayLCD_Print+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_DisplayLCD_Print+1 
	CALL        _DisplayLCD_Print+0, 0
;main.c,27 :: 		DisplayLCD_Print(2, 1, "   4-bit mode");
	MOVLW       2
	MOVWF       FARG_DisplayLCD_Print+0 
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Print+0 
	MOVLW       ?lstr2_main+0
	MOVWF       FARG_DisplayLCD_Print+0 
	MOVLW       hi_addr(?lstr2_main+0)
	MOVWF       FARG_DisplayLCD_Print+1 
	CALL        _DisplayLCD_Print+0, 0
;main.c,28 :: 		DisplayLCD_Char(2, 14, 'A');
	MOVLW       2
	MOVWF       FARG_DisplayLCD_Char+0 
	MOVLW       14
	MOVWF       FARG_DisplayLCD_Char+0 
	MOVLW       65
	MOVWF       FARG_DisplayLCD_Char+0 
	CALL        _DisplayLCD_Char+0, 0
;main.c,29 :: 		DisplayLCD_Char_CP('%');
	MOVLW       37
	MOVWF       FARG_DisplayLCD_Char_CP+0 
	CALL        _DisplayLCD_Char_CP+0, 0
;main.c,31 :: 		while(1);
L_main0:
	GOTO        L_main0
;main.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
