#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/main.c"
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
#line 11 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-001/main.c"
void ConfigMCU()
{



 ADCON1 |= 0x0F;

}


void main() {

 ConfigMCU();

 DisplayLCD_Init();
 DisplayLCD_Cmd( (0x01) );
 DisplayLCD_Print(1, 1, "   LCD Display   ");
 DisplayLCD_Print(2, 1, "   4-bit mode");
 DisplayLCD_Char(2, 14, 'A');
 DisplayLCD_Char_CP('%');

 while(1){

 }
}
