
_LCD_Write_Data:

;DisplayLCD_4bits.c,55 :: 		void LCD_Write_Data(unsigned char RS, unsigned char Data)
;DisplayLCD_4bits.c,69 :: 		LCD_RS_IO  = RS;     //0
	BTFSC       FARG_LCD_Write_Data_RS+0, 0 
	GOTO        L__LCD_Write_Data20
	BCF         PORTB+0, 4 
	GOTO        L__LCD_Write_Data21
L__LCD_Write_Data20:
	BSF         PORTB+0, 4 
L__LCD_Write_Data21:
;DisplayLCD_4bits.c,71 :: 		Delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_LCD_Write_Data0:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Write_Data0
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Write_Data0
	NOP
;DisplayLCD_4bits.c,72 :: 		LCD_DATA4_IO = ((Data & 0x10) == 0x10);
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
;DisplayLCD_4bits.c,73 :: 		LCD_DATA5_IO = ((Data & 0x20) == 0x20);
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
;DisplayLCD_4bits.c,74 :: 		LCD_DATA6_IO = ((Data & 0x40) == 0x40);
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
;DisplayLCD_4bits.c,75 :: 		LCD_DATA7_IO = ((Data & 0x80) == 0x80);
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
;DisplayLCD_4bits.c,77 :: 		LCD_Enable(void);
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,79 :: 		Data = Data << 4; //Rotaciona o nibble o LSB para a posição MSB
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
;DisplayLCD_4bits.c,80 :: 		LCD_DATA4_IO = ((Data & 0x10) == 0x10);
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
;DisplayLCD_4bits.c,81 :: 		LCD_DATA5_IO = ((Data & 0x20) == 0x20);
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
;DisplayLCD_4bits.c,82 :: 		LCD_DATA6_IO = ((Data & 0x40) == 0x40);
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
;DisplayLCD_4bits.c,83 :: 		LCD_DATA7_IO = ((Data & 0x80) == 0x80);
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
;DisplayLCD_4bits.c,85 :: 		LCD_Enable(void);
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,91 :: 		}
L_end_LCD_Write_Data:
	RETURN      0
; end of _LCD_Write_Data

_LCD_Enable:

;DisplayLCD_4bits.c,93 :: 		void LCD_Enable(void)  //INSTRUÇÃO DE CLOCK PARA O LCD
;DisplayLCD_4bits.c,95 :: 		Delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_LCD_Enable1:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Enable1
	NOP
;DisplayLCD_4bits.c,96 :: 		LCD_EN_IO = 1;
	BSF         PORTB+0, 5 
;DisplayLCD_4bits.c,97 :: 		Delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_LCD_Enable2:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Enable2
	NOP
;DisplayLCD_4bits.c,98 :: 		LCD_EN_IO = 0;
	BCF         PORTB+0, 5 
;DisplayLCD_4bits.c,99 :: 		Delay_us(40);
	MOVLW       26
	MOVWF       R13, 0
L_LCD_Enable3:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Enable3
	NOP
;DisplayLCD_4bits.c,100 :: 		}
L_end_LCD_Enable:
	RETURN      0
; end of _LCD_Enable

_DisplayLCD_Cmd:

;DisplayLCD_4bits.c,102 :: 		void DisplayLCD_Cmd(unsigned char CmdLCD)
;DisplayLCD_4bits.c,104 :: 		LCD_Write_Data(0, CmdLCD);     //RS = 0, -> COMANDO A SER PROCESSADO
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        FARG_DisplayLCD_Cmd_CmdLCD+0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,105 :: 		}
L_end_DisplayLCD_Cmd:
	RETURN      0
; end of _DisplayLCD_Cmd

_DisplayLCD_Chr_Cp:

;DisplayLCD_4bits.c,107 :: 		void DisplayLCD_Chr_Cp(unsigned char Tchar)
;DisplayLCD_4bits.c,109 :: 		LCD_Write_Data(1, Tchar);    //RS = 1 -> DADO A SER ESCRITO
	MOVLW       1
	MOVWF       FARG_LCD_Write_Data_RS+0 
	MOVF        FARG_DisplayLCD_Chr_Cp_Tchar+0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,110 :: 		}
L_end_DisplayLCD_Chr_Cp:
	RETURN      0
; end of _DisplayLCD_Chr_Cp

_DisplayLCD_Init:

;DisplayLCD_4bits.c,113 :: 		void DisplayLCD_Init(){ //modo 4bits ou 8bits
;DisplayLCD_4bits.c,136 :: 		LCD_DATA4_TRIS = 0; LCD_DATA4_IO = 0;
	BCF         TRISB+0, 0 
	BCF         PORTB+0, 0 
;DisplayLCD_4bits.c,137 :: 		LCD_DATA5_TRIS = 0; LCD_DATA5_IO = 0;
	BCF         TRISB+0, 1 
	BCF         PORTB+0, 1 
;DisplayLCD_4bits.c,138 :: 		LCD_DATA6_TRIS = 0; LCD_DATA6_IO = 0;
	BCF         TRISB+0, 2 
	BCF         PORTB+0, 2 
;DisplayLCD_4bits.c,139 :: 		LCD_DATA7_TRIS = 0; LCD_DATA7_IO = 0;
	BCF         TRISB+0, 3 
	BCF         PORTB+0, 3 
;DisplayLCD_4bits.c,140 :: 		LCD_EN_TRIS = 0; LCD_RS_IO = 0;
	BCF         TRISB+0, 5 
	BCF         PORTB+0, 4 
;DisplayLCD_4bits.c,141 :: 		LCD_RS_TRIS = 0; LCD_RS_IO = 0;
	BCF         TRISB+0, 4 
	BCF         PORTB+0, 4 
;DisplayLCD_4bits.c,143 :: 		Delay_ms(100);  //Tempo necessário para inicialização do LCD após power-on
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_DisplayLCD_Init4:
	DECFSZ      R13, 1, 1
	BRA         L_DisplayLCD_Init4
	DECFSZ      R12, 1, 1
	BRA         L_DisplayLCD_Init4
	DECFSZ      R11, 1, 1
	BRA         L_DisplayLCD_Init4
	NOP
;DisplayLCD_4bits.c,145 :: 		LCD_DATA4_IO = 1;
	BSF         PORTB+0, 0 
;DisplayLCD_4bits.c,146 :: 		LCD_DATA5_IO = 1;
	BSF         PORTB+0, 1 
;DisplayLCD_4bits.c,147 :: 		LCD_Enable();
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,148 :: 		LCD_Enable();
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,149 :: 		LCD_Enable();
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,151 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_DisplayLCD_Init5:
	DECFSZ      R13, 1, 1
	BRA         L_DisplayLCD_Init5
	DECFSZ      R12, 1, 1
	BRA         L_DisplayLCD_Init5
	NOP
	NOP
;DisplayLCD_4bits.c,153 :: 		LCD_DATA4_IO = 0;
	BCF         PORTB+0, 0 
;DisplayLCD_4bits.c,154 :: 		LCD_DATA5_IO = 1;
	BSF         PORTB+0, 1 
;DisplayLCD_4bits.c,155 :: 		LCD_Enable();
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,156 :: 		LCD_Enable();
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,157 :: 		LCD_Enable();
	CALL        _LCD_Enable+0, 0
;DisplayLCD_4bits.c,159 :: 		Delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_DisplayLCD_Init6:
	DECFSZ      R13, 1, 1
	BRA         L_DisplayLCD_Init6
	DECFSZ      R12, 1, 1
	BRA         L_DisplayLCD_Init6
	NOP
	NOP
;DisplayLCD_4bits.c,162 :: 		DisplayLCD_Cmd(0X28); //2X linhas 7x5 em modo 4bits
	MOVLW       40
	MOVWF       FARG_DisplayLCD_Cmd_CmdLCD+0 
	CALL        _DisplayLCD_Cmd+0, 0
;DisplayLCD_4bits.c,163 :: 		DisplayLCD_Cmd(0X0C);
	MOVLW       12
	MOVWF       FARG_DisplayLCD_Cmd_CmdLCD+0 
	CALL        _DisplayLCD_Cmd+0, 0
;DisplayLCD_4bits.c,164 :: 		DisplayLCD_Cmd(0X06);
	MOVLW       6
	MOVWF       FARG_DisplayLCD_Cmd_CmdLCD+0 
	CALL        _DisplayLCD_Cmd+0, 0
;DisplayLCD_4bits.c,165 :: 		DisplayLCD_Cmd(0X01);
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Cmd_CmdLCD+0 
	CALL        _DisplayLCD_Cmd+0, 0
;DisplayLCD_4bits.c,168 :: 		}
L_end_DisplayLCD_Init:
	RETURN      0
; end of _DisplayLCD_Init

_DisplayLCD_Out:

;DisplayLCD_4bits.c,172 :: 		unsigned char *TextoLCD)
;DisplayLCD_4bits.c,174 :: 		LCD_RS_IO = 0; //TRATAR PRIMEIRO AS COORDENADAS X E Y
	BCF         PORTB+0, 4 
;DisplayLCD_4bits.c,175 :: 		switch(Linha)
	GOTO        L_DisplayLCD_Out7
;DisplayLCD_4bits.c,177 :: 		case 1: {
L_DisplayLCD_Out9:
;DisplayLCD_4bits.c,178 :: 		Coluna =  Coluna + 0X7F;  // 2 + 0X7F = 0X81
	MOVLW       127
	ADDWF       FARG_DisplayLCD_Out_Coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Out_Coluna+0 
;DisplayLCD_4bits.c,179 :: 		LCD_Write_Data(0,Coluna); //Comando, visto que estamos posicionando o cursor
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,181 :: 		break;
	GOTO        L_DisplayLCD_Out8
;DisplayLCD_4bits.c,183 :: 		case 2: {
L_DisplayLCD_Out10:
;DisplayLCD_4bits.c,184 :: 		Coluna = Coluna + 0xBF;  //2 + 0xBF = 0XC1
	MOVLW       191
	ADDWF       FARG_DisplayLCD_Out_Coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Out_Coluna+0 
;DisplayLCD_4bits.c,185 :: 		LCD_Write_Data(0,Coluna);
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,187 :: 		break;
	GOTO        L_DisplayLCD_Out8
;DisplayLCD_4bits.c,189 :: 		}
L_DisplayLCD_Out7:
	MOVF        FARG_DisplayLCD_Out_Linha+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Out9
	MOVF        FARG_DisplayLCD_Out_Linha+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Out10
L_DisplayLCD_Out8:
;DisplayLCD_4bits.c,190 :: 		DisplayLCD_Out_Cp(TextoLCD); //Escreve no LCD "BOM DIA"
	MOVF        FARG_DisplayLCD_Out_TextoLCD+0, 0 
	MOVWF       FARG_DisplayLCD_Out_Cp_TextoLCD+0 
	MOVF        FARG_DisplayLCD_Out_TextoLCD+1, 0 
	MOVWF       FARG_DisplayLCD_Out_Cp_TextoLCD+1 
	CALL        _DisplayLCD_Out_Cp+0, 0
;DisplayLCD_4bits.c,191 :: 		}
L_end_DisplayLCD_Out:
	RETURN      0
; end of _DisplayLCD_Out

_DisplayLCD_Out_Cp:

;DisplayLCD_4bits.c,199 :: 		void DisplayLCD_Out_Cp(unsigned char *Ponteiro)
;DisplayLCD_4bits.c,202 :: 		while(*Ponteiro) //loop até encontrar o caractere NULL (ZERO)
L_DisplayLCD_Out_Cp11:
	MOVFF       FARG_DisplayLCD_Out_Cp_Ponteiro+0, FSR0
	MOVFF       FARG_DisplayLCD_Out_Cp_Ponteiro+1, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Out_Cp12
;DisplayLCD_4bits.c,204 :: 		LCD_Write_Data(1,*Ponteiro);  //RS =1, ESCREVENDO NO LCD
	MOVLW       1
	MOVWF       FARG_LCD_Write_Data_RS+0 
	MOVFF       FARG_DisplayLCD_Out_Cp_Ponteiro+0, FSR0
	MOVFF       FARG_DisplayLCD_Out_Cp_Ponteiro+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,206 :: 		++Ponteiro;
	INFSNZ      FARG_DisplayLCD_Out_Cp_Ponteiro+0, 1 
	INCF        FARG_DisplayLCD_Out_Cp_Ponteiro+1, 1 
;DisplayLCD_4bits.c,207 :: 		}
	GOTO        L_DisplayLCD_Out_Cp11
L_DisplayLCD_Out_Cp12:
;DisplayLCD_4bits.c,209 :: 		}
L_end_DisplayLCD_Out_Cp:
	RETURN      0
; end of _DisplayLCD_Out_Cp

_DisplayLCD_Chr:

;DisplayLCD_4bits.c,214 :: 		unsigned char Tchar)
;DisplayLCD_4bits.c,216 :: 		LCD_RS_IO = 0; //TRATAR PRIMEIRO AS COORDENADAS X E Y
	BCF         PORTB+0, 4 
;DisplayLCD_4bits.c,217 :: 		switch(Linha)
	GOTO        L_DisplayLCD_Chr13
;DisplayLCD_4bits.c,219 :: 		case 1: {
L_DisplayLCD_Chr15:
;DisplayLCD_4bits.c,220 :: 		Coluna =  Coluna + 0x7F;
	MOVLW       127
	ADDWF       FARG_DisplayLCD_Chr_Coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Chr_Coluna+0 
;DisplayLCD_4bits.c,221 :: 		LCD_Write_Data(0,Coluna);
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,223 :: 		break;
	GOTO        L_DisplayLCD_Chr14
;DisplayLCD_4bits.c,225 :: 		case 2: {
L_DisplayLCD_Chr16:
;DisplayLCD_4bits.c,226 :: 		Coluna += 0xBF;
	MOVLW       191
	ADDWF       FARG_DisplayLCD_Chr_Coluna+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_DisplayLCD_Chr_Coluna+0 
;DisplayLCD_4bits.c,227 :: 		LCD_Write_Data(0,Coluna);
	CLRF        FARG_LCD_Write_Data_RS+0 
	MOVF        R0, 0 
	MOVWF       FARG_LCD_Write_Data_Data+0 
	CALL        _LCD_Write_Data+0, 0
;DisplayLCD_4bits.c,229 :: 		break;
	GOTO        L_DisplayLCD_Chr14
;DisplayLCD_4bits.c,231 :: 		}
L_DisplayLCD_Chr13:
	MOVF        FARG_DisplayLCD_Chr_Linha+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Chr15
	MOVF        FARG_DisplayLCD_Chr_Linha+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayLCD_Chr16
L_DisplayLCD_Chr14:
;DisplayLCD_4bits.c,232 :: 		DisplayLCD_Chr_Cp(Tchar); //ESCREVE NO LCD
	MOVF        FARG_DisplayLCD_Chr_Tchar+0, 0 
	MOVWF       FARG_DisplayLCD_Chr_Cp_Tchar+0 
	CALL        _DisplayLCD_Chr_Cp+0, 0
;DisplayLCD_4bits.c,234 :: 		}
L_end_DisplayLCD_Chr:
	RETURN      0
; end of _DisplayLCD_Chr

_ConfigMCU:

;DisplayLCD_4bits.c,236 :: 		void ConfigMCU()
;DisplayLCD_4bits.c,239 :: 		ANSELB = 0;     //Configura PORTB como I/O digital
	CLRF        ANSELB+0 
;DisplayLCD_4bits.c,243 :: 		}
L_end_ConfigMCU:
	RETURN      0
; end of _ConfigMCU

_main:

;DisplayLCD_4bits.c,244 :: 		void main() {
;DisplayLCD_4bits.c,246 :: 		ConfigMCU();
	CALL        _ConfigMCU+0, 0
;DisplayLCD_4bits.c,248 :: 		DisplayLCD_Init();         //Inicializar display no modo 4 bits
	CALL        _DisplayLCD_Init+0, 0
;DisplayLCD_4bits.c,249 :: 		DisplayLCD_Cmd(LCD_Clear);
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Cmd_CmdLCD+0 
	CALL        _DisplayLCD_Cmd+0, 0
;DisplayLCD_4bits.c,250 :: 		DisplayLCD_Out(1,1, "  LCD Display  ");
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Out_Linha+0 
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Out_Coluna+0 
	MOVLW       ?lstr1_DisplayLCD_4bits+0
	MOVWF       FARG_DisplayLCD_Out_TextoLCD+0 
	MOVLW       hi_addr(?lstr1_DisplayLCD_4bits+0)
	MOVWF       FARG_DisplayLCD_Out_TextoLCD+1 
	CALL        _DisplayLCD_Out+0, 0
;DisplayLCD_4bits.c,251 :: 		DisplayLCD_Out(2,1, "  4-bit mode");
	MOVLW       2
	MOVWF       FARG_DisplayLCD_Out_Linha+0 
	MOVLW       1
	MOVWF       FARG_DisplayLCD_Out_Coluna+0 
	MOVLW       ?lstr2_DisplayLCD_4bits+0
	MOVWF       FARG_DisplayLCD_Out_TextoLCD+0 
	MOVLW       hi_addr(?lstr2_DisplayLCD_4bits+0)
	MOVWF       FARG_DisplayLCD_Out_TextoLCD+1 
	CALL        _DisplayLCD_Out+0, 0
;DisplayLCD_4bits.c,252 :: 		DisplayLCD_Chr(2, 13, 'A');
	MOVLW       2
	MOVWF       FARG_DisplayLCD_Chr_Linha+0 
	MOVLW       13
	MOVWF       FARG_DisplayLCD_Chr_Coluna+0 
	MOVLW       65
	MOVWF       FARG_DisplayLCD_Chr_Tchar+0 
	CALL        _DisplayLCD_Chr+0, 0
;DisplayLCD_4bits.c,253 :: 		DisplayLCD_Chr_Cp('%');
	MOVLW       37
	MOVWF       FARG_DisplayLCD_Chr_Cp_Tchar+0 
	CALL        _DisplayLCD_Chr_Cp+0, 0
;DisplayLCD_4bits.c,255 :: 		while(1);
L_main17:
	GOTO        L_main17
;DisplayLCD_4bits.c,256 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
