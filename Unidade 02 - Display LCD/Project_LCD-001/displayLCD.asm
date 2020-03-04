
_DisplayLCD_Init:

;displayLCD.c,6 :: 		void DisplayLCD_Init( void )
;displayLCD.c,31 :: 		LCD_DATA4_TRIS = 0;
	BCF         TRISB+0, 0 
;displayLCD.c,32 :: 		LCD_DATA4_IO   = 0;
	BCF         PORTB+0, 0 
;displayLCD.c,33 :: 		LCD_DATA5_TRIS = 0;
	BCF         TRISB+0, 1 
;displayLCD.c,34 :: 		LCD_DATA5_IO   = 0;
	BCF         PORTB+0, 1 
;displayLCD.c,35 :: 		LCD_DATA6_TRIS = 0;
	BCF         TRISB+0, 2 
;displayLCD.c,36 :: 		LCD_DATA6_IO   = 0;
	BCF         PORTB+0, 2 
;displayLCD.c,37 :: 		LCD_DATA7_TRIS = 0;
	BCF         TRISB+0, 3 
;displayLCD.c,38 :: 		LCD_DATA7_IO   = 0;
	BCF         PORTB+0, 3 
;displayLCD.c,39 :: 		LCD_EN_TRIS    = 0;
	BCF         TRISB+0, 5 
;displayLCD.c,40 :: 		LCD_EN_IO      = 0;
	BCF         PORTB+0, 5 
;displayLCD.c,41 :: 		LCD_RS_TRIS    = 0;
	BCF         TRISB+0, 4 
;displayLCD.c,42 :: 		LCD_RS_IO      = 0;
	BCF         PORTB+0, 4 
;displayLCD.c,44 :: 		Delay_ms(100);   //Tempo necessário para inicialização do LCD após power-on
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_DisplayLCD_Init0:
	DECFSZ      R13, 1, 1
	BRA         L_DisplayLCD_Init0
	DECFSZ      R12, 1, 1
	BRA         L_DisplayLCD_Init0
	DECFSZ      R11, 1, 1
	BRA         L_DisplayLCD_Init0
	NOP
;displayLCD.c,46 :: 		LCD_DATA4_IO = 1;
	BSF         PORTB+0, 0 
;displayLCD.c,47 :: 		LCD_DATA5_IO = 1;
	BSF         PORTB+0, 1 
;displayLCD.c,48 :: 		LCD_Enable();   /* 1º Clock */
	CALL        _LCD_Enable+0, 0
;displayLCD.c,49 :: 		LCD_Enable();   /* 2º Clock */
	CALL        _LCD_Enable+0, 0
;displayLCD.c,50 :: 		LCD_Enable();   /* 3º Clock */
	CALL        _LCD_Enable+0, 0
;displayLCD.c,51 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_DisplayLCD_Init1:
	DECFSZ      R13, 1, 1
	BRA         L_DisplayLCD_Init1
	DECFSZ      R12, 1, 1
	BRA         L_DisplayLCD_Init1
	NOP
	NOP
;displayLCD.c,53 :: 		LCD_DATA4_IO = 0;
	BCF         PORTB+0, 0 
;displayLCD.c,54 :: 		LCD_DATA5_IO = 1;
	BSF         PORTB+0, 1 
;displayLCD.c,55 :: 		LCD_Enable();   /* 1º Clock */
	CALL        _LCD_Enable+0, 0
;displayLCD.c,56 :: 		LCD_Enable();   /* 2º Clock */
	CALL        _LCD_Enable+0, 0
;displayLCD.c,58 :: 		DisplayLCD_Cmd(0x28);  // 2 linhas 7x5 em modo 4-Bits
	MOVLW       40
	MOVWF       FARG_DisplayLCD_Cmd+0 
	MOVLW       0
	MOVWF       FARG_DisplayLCD_Cmd+1 
	CALL        _DisplayLCD_Cmd+0, 0
;displayLCD.c,59 :: 		DisplayLCD_Cmd(0x0C);  // Display aceso sem cursor
	MOVLW       12
	MOVWF       FARG_DisplayLCD_Cmd+0 
	MOVLW       0
	MOVWF       FARG_DisplayLCD_Cmd+1 
	CALL        _DisplayLCD_Cmd+0, 0
;displayLCD.c,60 :: 		DisplayLCD_Cmd(0x06);  // Escreve deslocando o cursor para a direita
	MOVLW       6
	MOVWF       FARG_DisplayLCD_Cmd+0 
	MOVLW       0
	MOVWF       FARG_DisplayLCD_Cmd+1 
	CALL        _DisplayLCD_Cmd+0, 0
;displayLCD.c,61 :: 		DisplayLCD_Cmd(0x01);  // Limpa display e retorna o cursor para o inicio
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Cmd+0 
	MOVLW       0
	MOVWF       FARG_DisplayLCD_Cmd+1 
	CALL        _DisplayLCD_Cmd+0, 0
;displayLCD.c,63 :: 		}
L_end_DisplayLCD_Init:
	RETURN      0
; end of _DisplayLCD_Init

_LCD_Enable:

;displayLCD.c,69 :: 		void LCD_Enable( void )
;displayLCD.c,71 :: 		Delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_LCD_Enable2:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Enable2
	NOP
;displayLCD.c,72 :: 		LCD_EN_IO = 1;
	BSF         PORTB+0, 5 
;displayLCD.c,73 :: 		Delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_LCD_Enable3:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Enable3
	NOP
;displayLCD.c,74 :: 		LCD_EN_IO = 0;
	BCF         PORTB+0, 5 
;displayLCD.c,75 :: 		Delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_LCD_Enable4:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Enable4
	NOP
;displayLCD.c,76 :: 		}
L_end_LCD_Enable:
	RETURN      0
; end of _LCD_Enable

_DisplayLCD_Cmd:

;displayLCD.c,79 :: 		void DisplayLCD_Cmd( unsigned int Cmd )
;displayLCD.c,81 :: 		LCD_Write_Data(0, Cmd);   //RS = 0: Comando a ser processado
	CLRF        FARG_LCD_Write_Data+0 
	MOVF        FARG_DisplayLCD_Cmd_Cmd+0, 0 
	MOVWF       FARG_LCD_Write_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,82 :: 		}
L_end_DisplayLCD_Cmd:
	RETURN      0
; end of _DisplayLCD_Cmd

_LCD_Write_Data:

;displayLCD.c,85 :: 		void LCD_Write_Data( unsigned char RS, unsigned char Data )
;displayLCD.c,87 :: 		LCD_RS_IO = RS;
	BTFSC       FARG_LCD_Write_Data_RS+0, 0 
	GOTO        L__LCD_Write_Data20
	BCF         PORTB+0, 4 
	GOTO        L__LCD_Write_Data21
L__LCD_Write_Data20:
	BSF         PORTB+0, 4 
L__LCD_Write_Data21:
;displayLCD.c,89 :: 		Delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_LCD_Write_Data5:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Write_Data5
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Write_Data5
	NOP
;displayLCD.c,90 :: 		LCD_DATA4_IO = ((Data & 0x10) == 0x10);
	MOVLW       16
	ANDWF       FARG_LCD_Write_Data_Data+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       16
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data22
	BCF         PORTB+0, 0 
	GOTO        L__LCD_Write_Data23
L__LCD_Write_Data22:
	BSF         PORTB+0, 0 
L__LCD_Write_Data23:
;displayLCD.c,91 :: 		LCD_DATA5_IO = ((Data & 0x20) == 0x20);
	MOVLW       32
	ANDWF       FARG_LCD_Write_Data_Data+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       32
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data24
	BCF         PORTB+0, 1 
	GOTO        L__LCD_Write_Data25
L__LCD_Write_Data24:
	BSF         PORTB+0, 1 
L__LCD_Write_Data25:
;displayLCD.c,92 :: 		LCD_DATA6_IO = ((Data & 0x40) == 0x40);
	MOVLW       64
	ANDWF       FARG_LCD_Write_Data_Data+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       64
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data26
	BCF         PORTB+0, 2 
	GOTO        L__LCD_Write_Data27
L__LCD_Write_Data26:
	BSF         PORTB+0, 2 
L__LCD_Write_Data27:
;displayLCD.c,93 :: 		LCD_DATA7_IO = ((Data & 0x80) == 0x80);
	MOVLW       128
	ANDWF       FARG_LCD_Write_Data_Data+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       128
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data28
	BCF         PORTB+0, 3 
	GOTO        L__LCD_Write_Data29
L__LCD_Write_Data28:
	BSF         PORTB+0, 3 
L__LCD_Write_Data29:
;displayLCD.c,95 :: 		LCD_Enable(void);     //Executa um clock no LCD
	CALL        _LCD_Enable+0, 0
;displayLCD.c,97 :: 		Data = Data << 4;     //Rotaciona o nibble LSB para a posição do nibble MSB
	MOVF        FARG_LCD_Write_Data_Data+0, 0 
	MOVWF       R2 
	RLCF        R2, 1 
	BCF         R2, 0 
	RLCF        R2, 1 
	BCF         R2, 0 
	RLCF        R2, 1 
	BCF         R2, 0 
	RLCF        R2, 1 
	BCF         R2, 0 
	MOVF        R2, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
;displayLCD.c,98 :: 		LCD_DATA4_IO = ((Data & 0x10) == 0x10);
	MOVLW       16
	ANDWF       R2, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       16
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data30
	BCF         PORTB+0, 0 
	GOTO        L__LCD_Write_Data31
L__LCD_Write_Data30:
	BSF         PORTB+0, 0 
L__LCD_Write_Data31:
;displayLCD.c,99 :: 		LCD_DATA5_IO = ((Data & 0x20) == 0x20);
	MOVLW       32
	ANDWF       R2, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       32
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data32
	BCF         PORTB+0, 1 
	GOTO        L__LCD_Write_Data33
L__LCD_Write_Data32:
	BSF         PORTB+0, 1 
L__LCD_Write_Data33:
;displayLCD.c,100 :: 		LCD_DATA6_IO = ((Data & 0x40) == 0x40);
	MOVLW       64
	ANDWF       R2, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       64
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data34
	BCF         PORTB+0, 2 
	GOTO        L__LCD_Write_Data35
L__LCD_Write_Data34:
	BSF         PORTB+0, 2 
L__LCD_Write_Data35:
;displayLCD.c,101 :: 		LCD_DATA7_IO = ((Data & 0x80) == 0x80);
	MOVLW       128
	ANDWF       R2, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       128
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__LCD_Write_Data36
	BCF         PORTB+0, 3 
	GOTO        L__LCD_Write_Data37
L__LCD_Write_Data36:
	BSF         PORTB+0, 3 
L__LCD_Write_Data37:
;displayLCD.c,103 :: 		LCD_Enable(void);     //Executa um clock no LCD
	CALL        _LCD_Enable+0, 0
;displayLCD.c,109 :: 		}
L_end_LCD_Write_Data:
	RETURN      0
; end of _LCD_Write_Data

_DisplayLCD_Print:

;displayLCD.c,112 :: 		void DisplayLCD_Print(unsigned char linha, unsigned char coluna, unsigned char * pStr)
;displayLCD.c,114 :: 		LCD_RS_IO = 0;   //Primeiramente é necessário escrever o comando (RS = 0) que permite posicionar o cursor na coordenada (X, Y) desejada
	BCF         PORTB+0, 4 
;displayLCD.c,115 :: 		switch(linha)
	GOTO        L_DisplayLCD_Print6
;displayLCD.c,117 :: 		case 1:{
L_DisplayLCD_Print8:
;displayLCD.c,118 :: 		coluna = coluna + 0x7F;         //O endereço referente a posição (linha, coluna) = (1, 1) é 0x80
	MOVLW       127
	ADDWF       FARG_DisplayLCD_Print_coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Print_coluna+0 
;displayLCD.c,119 :: 		LCD_Write_Data(0, coluna);      //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,120 :: 		break;
	GOTO        L_DisplayLCD_Print7
;displayLCD.c,122 :: 		case 2:{
L_DisplayLCD_Print9:
;displayLCD.c,123 :: 		coluna = coluna + 0xBF;        //O endereço referente a posição (linha, coluna) = (2, 1) é 0xC0
	MOVLW       191
	ADDWF       FARG_DisplayLCD_Print_coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Print_coluna+0 
;displayLCD.c,124 :: 		LCD_Write_Data(0, coluna);     //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,125 :: 		break;
	GOTO        L_DisplayLCD_Print7
;displayLCD.c,127 :: 		}
L_DisplayLCD_Print6:
	MOVF        FARG_DisplayLCD_Print_linha+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Print8
	MOVF        FARG_DisplayLCD_Print_linha+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Print9
L_DisplayLCD_Print7:
;displayLCD.c,128 :: 		DisplayLCD_Print_CP(pStr);              //Escreve no LCD
	MOVF        FARG_DisplayLCD_Print_pStr+0, 0 
	MOVWF       FARG_DisplayLCD_Print_CP+0 
	MOVF        FARG_DisplayLCD_Print_pStr+1, 0 
	MOVWF       FARG_DisplayLCD_Print_CP+1 
	CALL        _DisplayLCD_Print_CP+0, 0
;displayLCD.c,129 :: 		}
L_end_DisplayLCD_Print:
	RETURN      0
; end of _DisplayLCD_Print

_DisplayLCD_Print_CP:

;displayLCD.c,132 :: 		void DisplayLCD_Print_CP(unsigned char * pStr)
;displayLCD.c,134 :: 		while(*pStr)   //Loop até encontrar o caractere NULL (ZERO)
L_DisplayLCD_Print_CP10:
	MOVFF       FARG_DisplayLCD_Print_CP_pStr+0, FSR0L+0
	MOVFF       FARG_DisplayLCD_Print_CP_pStr+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Print_CP11
;displayLCD.c,136 :: 		LCD_Write_Data(1, *pStr);    //RS = 0 corresponde a escrever dado no LCD
	MOVLW       1
	MOVWF       FARG_LCD_Write_Data_RS+0 
	MOVFF       FARG_DisplayLCD_Print_CP_pStr+0, FSR0L+0
	MOVFF       FARG_DisplayLCD_Print_CP_pStr+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,137 :: 		++pStr;
	INFSNZ      FARG_DisplayLCD_Print_CP_pStr+0, 1 
	INCF        FARG_DisplayLCD_Print_CP_pStr+1, 1 
;displayLCD.c,138 :: 		}
	GOTO        L_DisplayLCD_Print_CP10
L_DisplayLCD_Print_CP11:
;displayLCD.c,139 :: 		}
L_end_DisplayLCD_Print_CP:
	RETURN      0
; end of _DisplayLCD_Print_CP

_DisplayLCD_Char:

;displayLCD.c,142 :: 		void DisplayLCD_Char( unsigned char linha, unsigned char coluna, unsigned char Tchar )
;displayLCD.c,144 :: 		LCD_RS_IO = 0;   //Primeiramente é necessário escrever o comando (RS = 0) que permite posicionar o cursor na coordenada (X, Y) desejada
	BCF         PORTB+0, 4 
;displayLCD.c,145 :: 		switch(linha)
	GOTO        L_DisplayLCD_Char12
;displayLCD.c,147 :: 		case 1:{
L_DisplayLCD_Char14:
;displayLCD.c,148 :: 		coluna = coluna + 0x7F;         //O endereço referente a posição (linha, coluna) = (1, 1) é 0x80
	MOVLW       127
	ADDWF       FARG_DisplayLCD_Char_coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Char_coluna+0 
;displayLCD.c,149 :: 		LCD_Write_Data(0, coluna);      //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,150 :: 		break;
	GOTO        L_DisplayLCD_Char13
;displayLCD.c,152 :: 		case 2:{
L_DisplayLCD_Char15:
;displayLCD.c,153 :: 		coluna = coluna + 0xBF;        //O endereço referente a posição (linha, coluna) = (2, 1) é 0xC0
	MOVLW       191
	ADDWF       FARG_DisplayLCD_Char_coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Char_coluna+0 
;displayLCD.c,154 :: 		LCD_Write_Data(0, coluna);     //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,155 :: 		break;
	GOTO        L_DisplayLCD_Char13
;displayLCD.c,157 :: 		}
L_DisplayLCD_Char12:
	MOVF        FARG_DisplayLCD_Char_linha+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Char14
	MOVF        FARG_DisplayLCD_Char_linha+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Char15
L_DisplayLCD_Char13:
;displayLCD.c,158 :: 		DisplayLCD_Char_CP(Tchar);              //Escreve no LCD
	MOVF        FARG_DisplayLCD_Char_Tchar+0, 0 
	MOVWF       FARG_DisplayLCD_Char_CP+0 
	CALL        _DisplayLCD_Char_CP+0, 0
;displayLCD.c,159 :: 		}
L_end_DisplayLCD_Char:
	RETURN      0
; end of _DisplayLCD_Char

_DisplayLCD_Char_CP:

;displayLCD.c,162 :: 		void DisplayLCD_Char_CP( unsigned char Tchar )
;displayLCD.c,164 :: 		LCD_Write_Data(1, Tchar);   //RS = 1: Dado a ser escritio
	MOVLW       1
	MOVWF       FARG_LCD_Write_Data_RS+0 
	MOVF        FARG_DisplayLCD_Char_CP_Tchar+0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;displayLCD.c,165 :: 		}
L_end_DisplayLCD_Char_CP:
	RETURN      0
; end of _DisplayLCD_Char_CP
