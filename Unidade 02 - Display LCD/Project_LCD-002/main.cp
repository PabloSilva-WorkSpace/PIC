#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-002/main.c"


void ConfigMCU();



sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D4 at LATB0_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D7 at LATB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


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
