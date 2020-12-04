
_main:

;main.c,21 :: 		void main() {
;main.c,31 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;main.c,35 :: 		T0CON = 0B00111000;
	MOVLW       56
	MOVWF       T0CON+0 
;main.c,36 :: 		TMR0H = 0xFF;
	MOVLW       255
	MOVWF       TMR0H+0 
;main.c,37 :: 		TMR0L = 0xF6;
	MOVLW       246
	MOVWF       TMR0L+0 
;main.c,38 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;main.c,40 :: 		TRISA.RA4 = 1;
	BSF         TRISA+0, 4 
;main.c,42 :: 		TRISD = 0;
	CLRF        TRISD+0 
;main.c,43 :: 		PORTD = 0;
	CLRF        PORTD+0 
;main.c,45 :: 		T0CON.TMR0ON = 1; //Liga o TIMER0
	BSF         T0CON+0, 7 
;main.c,48 :: 		Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
	CALL        _Lcd_Init+0, 0
;main.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;main.c,51 :: 		Lcd_Out(1,1,"Counter: ");        /* Linha x Coluna*/
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_main+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_main+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,53 :: 		while(1){
L_main0:
;main.c,54 :: 		TMR.buffer[1] = TMR0H;
	MOVF        TMR0H+0, 0 
	MOVWF       main_TMR_L0+1 
;main.c,55 :: 		TMR.buffer[0] = TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       main_TMR_L0+0 
;main.c,56 :: 		WordToStr(TMR.value - 65526, strData);
	MOVLW       246
	SUBWF       main_TMR_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       255
	SUBWFB      main_TMR_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_strData_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_strData_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;main.c,57 :: 		LCD_Out(1, 9, strData);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_strData_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_strData_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,58 :: 		if(INTCON.TMR0IF == 1){
	BTFSS       INTCON+0, 2 
	GOTO        L_main2
;main.c,59 :: 		PORTD.RD0 = ~LATD.RD0;
	BTFSC       LATD+0, 0 
	GOTO        L__main4
	BSF         PORTD+0, 0 
	GOTO        L__main5
L__main4:
	BCF         PORTD+0, 0 
L__main5:
;main.c,60 :: 		TMR0H = 0xFF;
	MOVLW       255
	MOVWF       TMR0H+0 
;main.c,61 :: 		TMR0L = 0xF6;
	MOVLW       246
	MOVWF       TMR0L+0 
;main.c,62 :: 		INTCON.TMR0IF = 0;  //Flag de estouro do TIMER0
	BCF         INTCON+0, 2 
;main.c,63 :: 		}
L_main2:
;main.c,64 :: 		}
	GOTO        L_main0
;main.c,65 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
