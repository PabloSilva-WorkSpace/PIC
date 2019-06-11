
_main:

;Project_005_BitRotation.c,5 :: 		void main() {
;Project_005_BitRotation.c,7 :: 		unsigned char ucByte1 = 0B00000001;  //Equivalente a: unsigned char ucByte1 = 1;
	MOVLW       1
	MOVWF       main_ucByte1_L0+0 
	MOVLW       128
	MOVWF       main_ucByte2_L0+0 
;Project_005_BitRotation.c,13 :: 		ADCON1 = 0;
	CLRF        ADCON1+0 
;Project_005_BitRotation.c,17 :: 		TRISD = 0;    //Define o PORTD como saída
	CLRF        TRISD+0 
;Project_005_BitRotation.c,18 :: 		PORTD = 0;    //Defini nivel zero nas saídas do PORTD
	CLRF        PORTD+0 
;Project_005_BitRotation.c,20 :: 		while(1){
L_main0:
;Project_005_BitRotation.c,21 :: 		PORTD = (ucByte1 | ucByte2);
	MOVF        main_ucByte2_L0+0, 0 
	IORWF       main_ucByte1_L0+0, 0 
	MOVWF       PORTD+0 
;Project_005_BitRotation.c,22 :: 		ucByte1 <<= 1;    //Desloca (shift) os bits de ucByte1 1 posição para a esquerda
	MOVF        main_ucByte1_L0+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       main_ucByte1_L0+0 
;Project_005_BitRotation.c,23 :: 		ucByte2 >>= 1;    //Desloca (shift) os bits de ucByte2 1 posição para a direita
	RRCF        main_ucByte2_L0+0, 1 
	BCF         main_ucByte2_L0+0, 7 
;Project_005_BitRotation.c,25 :: 		if(ucByte1 == 0){
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Project_005_BitRotation.c,26 :: 		ucByte1 = 1;
	MOVLW       1
	MOVWF       main_ucByte1_L0+0 
;Project_005_BitRotation.c,27 :: 		}
L_main2:
;Project_005_BitRotation.c,28 :: 		if(ucByte2 == 0){
	MOVF        main_ucByte2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Project_005_BitRotation.c,29 :: 		ucByte2 = 128;
	MOVLW       128
	MOVWF       main_ucByte2_L0+0 
;Project_005_BitRotation.c,30 :: 		}
L_main3:
;Project_005_BitRotation.c,31 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;Project_005_BitRotation.c,32 :: 		}
	GOTO        L_main0
;Project_005_BitRotation.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
