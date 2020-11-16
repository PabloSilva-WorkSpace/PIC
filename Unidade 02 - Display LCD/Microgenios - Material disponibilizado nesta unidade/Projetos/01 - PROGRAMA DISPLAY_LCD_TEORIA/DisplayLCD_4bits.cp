#line 1 "C:/Users/Microgenios/Desktop/Material Curso PIC/Unidade 02 - LCD/Exemplos de Programas/07 - DISPLAY_LCD_TEORIA/DisplayLCD_4bits.c"
#line 43 "C:/Users/Microgenios/Desktop/Material Curso PIC/Unidade 02 - LCD/Exemplos de Programas/07 - DISPLAY_LCD_TEORIA/DisplayLCD_4bits.c"
void DisplayLCD_Out(unsigned char Linha, unsigned char Coluna, unsigned char *TextoLCD);
void DisplayLCD_Out_Cp(unsigned char *TextoLCD);
void DisplayLCD_Chr(unsigned char Linha, unsigned char Coluna, unsigned char TChar);
void DisplayLCD_Chr_Cp(unsigned char TChar);
void DisplayLCD_Cmd(unsigned char Data);
void DisplayLCD_Init();
void LCD_Enable();
void LCD_Write_Data(unsigned char RS, unsigned char Data);
void DisplayLCD_Out_Cp(unsigned char *Ponteiro);



void LCD_Write_Data(unsigned char RS, unsigned char Data)
{
#line 69 "C:/Users/Microgenios/Desktop/Material Curso PIC/Unidade 02 - LCD/Exemplos de Programas/07 - DISPLAY_LCD_TEORIA/DisplayLCD_4bits.c"
  (PORTB.RB4)  = RS;

 Delay_ms(2);
  (PORTB.RB0)  = ((Data & 0x10) == 0x10);
  (PORTB.RB1)  = ((Data & 0x20) == 0x20);
  (PORTB.RB2)  = ((Data & 0x40) == 0x40);
  (PORTB.RB3)  = ((Data & 0x80) == 0x80);

 LCD_Enable(void);

 Data = Data << 4;
  (PORTB.RB0)  = ((Data & 0x10) == 0x10);
  (PORTB.RB1)  = ((Data & 0x20) == 0x20);
  (PORTB.RB2)  = ((Data & 0x40) == 0x40);
  (PORTB.RB3)  = ((Data & 0x80) == 0x80);

 LCD_Enable(void);
#line 91 "C:/Users/Microgenios/Desktop/Material Curso PIC/Unidade 02 - LCD/Exemplos de Programas/07 - DISPLAY_LCD_TEORIA/DisplayLCD_4bits.c"
}

void LCD_Enable(void)
{
 Delay_us(40);
  (PORTB.RB5)  = 1;
 Delay_us(40);
  (PORTB.RB5)  = 0;
 Delay_us(40);
}

void DisplayLCD_Cmd(unsigned char CmdLCD)
{
 LCD_Write_Data(0, CmdLCD);
}

void DisplayLCD_Chr_Cp(unsigned char Tchar)
{
 LCD_Write_Data(1, Tchar);
}


void DisplayLCD_Init(){
#line 136 "C:/Users/Microgenios/Desktop/Material Curso PIC/Unidade 02 - LCD/Exemplos de Programas/07 - DISPLAY_LCD_TEORIA/DisplayLCD_4bits.c"
  (TRISB.RB0)  = 0;  (PORTB.RB0)  = 0;
  (TRISB.RB1)  = 0;  (PORTB.RB1)  = 0;
  (TRISB.RB2)  = 0;  (PORTB.RB2)  = 0;
  (TRISB.RB3)  = 0;  (PORTB.RB3)  = 0;
  (TRISB.RB5)  = 0;  (PORTB.RB4)  = 0;
  (TRISB.RB4)  = 0;  (PORTB.RB4)  = 0;

 Delay_ms(100);

  (PORTB.RB0)  = 1;
  (PORTB.RB1)  = 1;
 LCD_Enable();
 LCD_Enable();
 LCD_Enable();

 Delay_ms(1);

  (PORTB.RB0)  = 0;
  (PORTB.RB1)  = 1;
 LCD_Enable();
 LCD_Enable();
 LCD_Enable();

 Delay_ms(1);


 DisplayLCD_Cmd(0X28);
 DisplayLCD_Cmd(0X0C);
 DisplayLCD_Cmd(0X06);
 DisplayLCD_Cmd(0X01);


}


void DisplayLCD_Out(unsigned char Linha, unsigned char Coluna,
 unsigned char *TextoLCD)
{
  (PORTB.RB4)  = 0;
 switch(Linha)
 {
 case 1: {
 Coluna = Coluna + 0X7F;
 LCD_Write_Data(0,Coluna);

 break;
 }
 case 2: {
 Coluna = Coluna + 0xBF;
 LCD_Write_Data(0,Coluna);

 break;
 }
 }
 DisplayLCD_Out_Cp(TextoLCD);
}







void DisplayLCD_Out_Cp(unsigned char *Ponteiro)
{

 while(*Ponteiro)
 {
 LCD_Write_Data(1,*Ponteiro);

 ++Ponteiro;
 }

}



void DisplayLCD_Chr(unsigned char Linha, unsigned char Coluna,
 unsigned char Tchar)
{
  (PORTB.RB4)  = 0;
 switch(Linha)
 {
 case 1: {
 Coluna = Coluna + 0x7F;
 LCD_Write_Data(0,Coluna);

 break;
 }
 case 2: {
 Coluna += 0xBF;
 LCD_Write_Data(0,Coluna);

 break;
 }
 }
 DisplayLCD_Chr_Cp(Tchar);

}

void ConfigMCU()
{

 ANSELB = 0;
#line 243 "C:/Users/Microgenios/Desktop/Material Curso PIC/Unidade 02 - LCD/Exemplos de Programas/07 - DISPLAY_LCD_TEORIA/DisplayLCD_4bits.c"
}
void main() {

 ConfigMCU();

 DisplayLCD_Init();
 DisplayLCD_Cmd( (0x01) );
 DisplayLCD_Out(1,1, "  LCD Display  ");
 DisplayLCD_Out(2,1, "  4-bit mode");
 DisplayLCD_Chr(2, 13, 'A');
 DisplayLCD_Chr_Cp('%');

 while(1);
}
