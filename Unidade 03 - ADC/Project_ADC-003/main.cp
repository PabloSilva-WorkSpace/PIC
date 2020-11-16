#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 03 - ADC/Project_ADC-003/main.c"
#line 8 "C:/Users/pablo/Desktop/Github/PIC/Unidade 03 - ADC/Project_ADC-003/main.c"
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
 unsigned int Valor_ADC = 0;
 unsigned char Tensao[6];






 TRISA.RA0 = 1;
 ADCON1 = 0B00001110;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"ADC-AN0: ");

 ADC_Init();

 while( 1 )
 {
 Valor_ADC = ADC_Read(0);
 Valor_ADC = Valor_ADC * (1000/1023.);
 Tensao[0] = (Valor_ADC/1000) + '0';
 Tensao[1] = (Valor_ADC/100)%10 + '0';
 Tensao[2] = '.';
 Tensao[3] = (Valor_ADC/10)%10 + '0';
 Tensao[4] = (Valor_ADC/1)%10 + '0';
 Tensao[5] = 0;

 Lcd_Out(1, 10, Tensao);
 Delay_ms(20);
 }
}
