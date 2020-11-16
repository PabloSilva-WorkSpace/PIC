#line 1 "C:/Users/Microgenios/Google Drive/Novos Cursos Online/Microcontroladores PIC Programação em C/Unidade 02 - LCD/Exemplos de Programas/08 - DISPLAY_LCD_MIKROC/main.c"
#line 50 "C:/Users/Microgenios/Google Drive/Novos Cursos Online/Microcontroladores PIC Programação em C/Unidade 02 - LCD/Exemplos de Programas/08 - DISPLAY_LCD_MIKROC/main.c"
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






void main(){
 unsigned char _x;

 ANSELB = 0;
 ANSELD = 0;

 TRISD.RD0 = 1;
 PORTD.RD0 = 1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"PRIMEIRA LINHA");
 Lcd_Out(2,1,"SEGUNDA COLUNA");

 while( 1 )
 {
 for(_x = 0; _x < 16; _x++)
 {
 LCD_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(300);
 }

 for(_x = 0; _x < 16; _x++)
 {
 LCD_Cmd(_LCD_SHIFT_LEFT);
 Delay_ms(300);
 }
 }
}
