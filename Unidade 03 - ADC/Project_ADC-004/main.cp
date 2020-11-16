#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 03 - ADC/Project_ADC-004/main.c"
#line 17 "C:/Users/pablo/Desktop/Github/PIC/Unidade 03 - ADC/Project_ADC-004/main.c"
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

void main() {
 float Valor_ADC = 0;
 unsigned char Tensao[10];






 TRISA.RA0 = 1;
 ADCON1 = 0B00001110;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"AN0: ");

 ADC_Init();

 while( 1 )
 {
 Valor_ADC = ADC_Read(0);


 floatToStr(Valor_ADC, Tensao);

 Lcd_Out(1, 6, Tensao);
 Delay_ms(20);
 }
}
