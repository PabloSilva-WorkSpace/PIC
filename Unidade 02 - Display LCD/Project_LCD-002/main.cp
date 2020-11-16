#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-002/main.c"


void ConfigMCU();




sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


void ConfigMCU()
{



 ADCON1 |= 0x0F;

}


void main()
{
 ConfigMCU();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Primeira Linha");
 Lcd_Out(2,1,"Segunda Linha");

 while(1);
}
