#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 04 - Timer-Counter/Project_Timer-003/main.c"

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

union Data{
 unsigned char buffer[2];
 unsigned int value;
};

void main() {

 union Data TMR;
 unsigned char strData[7];






 ADCON1 |= 0x0F;



 T0CON = 0B00111000;
 TMR0H = 0xFF;
 TMR0L = 0xF6;
 INTCON.TMR0IF = 0;

 TRISA.RA4 = 1;

 TRISD = 0;
 PORTD = 0;

 T0CON.TMR0ON = 1;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Counter: ");

 while(1){
 TMR.buffer[1] = TMR0H;
 TMR.buffer[0] = TMR0L;
 WordToStr(TMR.value - 65526, strData);
 LCD_Out(1, 9, strData);
 if(INTCON.TMR0IF == 1){
 PORTD.RD0 = ~LATD.RD0;
 TMR0H = 0xFF;
 TMR0L = 0xF6;
 INTCON.TMR0IF = 0;
 }
 }
}
