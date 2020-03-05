#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/displayLCD.c"
#line 1 "c:/users/pablo/desktop/github/pic/unidade 02 - display lcd/project_lcd-001/displaylcd.h"
#line 35 "c:/users/pablo/desktop/github/pic/unidade 02 - display lcd/project_lcd-001/displaylcd.h"
void DisplayLCD_Init( void );
void LCD_Enable( void );
void LCD_Write_Data( unsigned char, unsigned char );
void DisplayLCD_Cmd( unsigned char );
void DisplayLCD_Char( unsigned char, unsigned char, unsigned char );
void DisplayLCD_Char_CP( unsigned char );
void DisplayLCD_Print( unsigned char , unsigned char, unsigned char * );
void DisplayLCD_Print_CP( unsigned char * );
#line 6 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/displayLCD.c"
void DisplayLCD_Init( void )
{
#line 31 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/displayLCD.c"
  (TRISB.RB0)  = 0;
  (PORTB.RB0)  = 0;
  (TRISB.RB1)  = 0;
  (PORTB.RB1)  = 0;
  (TRISB.RB2)  = 0;
  (PORTB.RB2)  = 0;
  (TRISB.RB3)  = 0;
  (PORTB.RB3)  = 0;
  (TRISB.RB5)  = 0;
  (PORTB.RB5)  = 0;
  (TRISB.RB4)  = 0;
  (PORTB.RB4)  = 0;

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
 Delay_ms(1);

 DisplayLCD_Cmd(0x28);
 DisplayLCD_Cmd(0x0C);
 DisplayLCD_Cmd(0x06);
 DisplayLCD_Cmd(0x01);

}
#line 70 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/displayLCD.c"
void LCD_Enable( void )
{
 Delay_us(40);
  (PORTB.RB5)  = 1;
 Delay_us(40);
  (PORTB.RB5)  = 0;
 Delay_us(40);
}


void DisplayLCD_Cmd( unsigned char Cmd )
{
 LCD_Write_Data(0, Cmd);
}


void LCD_Write_Data( unsigned char RS, unsigned char Data )
{
  (PORTB.RB4)  = RS;

 Delay_ms(2);
  (PORTB.RB0)  = ((Data & 0x10) == 0x10);
  (PORTB.RB1)  = ((Data & 0x20) == 0x20);
  (PORTB.RB2)  = ((Data & 0x40) == 0x40);
  (PORTB.RB3)  = ((Data & 0x80) == 0x80);

 LCD_Enable();

 Data = Data << 4;
  (PORTB.RB0)  = ((Data & 0x10) == 0x10);
  (PORTB.RB1)  = ((Data & 0x20) == 0x20);
  (PORTB.RB2)  = ((Data & 0x40) == 0x40);
  (PORTB.RB3)  = ((Data & 0x80) == 0x80);

 LCD_Enable();
#line 110 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/displayLCD.c"
}


void DisplayLCD_Print(unsigned char linha, unsigned char coluna, unsigned char * pStr)
{
  (PORTB.RB4)  = 0;
 switch(linha)
 {
 case 1:{
 coluna = coluna + 0x7F;
 LCD_Write_Data(0, coluna);
 break;
 }
 case 2:{
 coluna = coluna + 0xBF;
 LCD_Write_Data(0, coluna);
 break;
 }
 }
 DisplayLCD_Print_CP(pStr);
}


void DisplayLCD_Print_CP(unsigned char * pStr)
{
 while(*pStr)
 {
 LCD_Write_Data(1, *pStr);
 ++pStr;
 }
}


void DisplayLCD_Char( unsigned char linha, unsigned char coluna, unsigned char Tchar )
{
  (PORTB.RB4)  = 0;
 switch(linha)
 {
 case 1:{
 coluna = coluna + 0x7F;
 LCD_Write_Data(0, coluna);
 break;
 }
 case 2:{
 coluna = coluna + 0xBF;
 LCD_Write_Data(0, coluna);
 break;
 }
 }
 DisplayLCD_Char_CP(Tchar);
}


void DisplayLCD_Char_CP( unsigned char Tchar )
{
 LCD_Write_Data(1, Tchar);
}
