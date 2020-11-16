#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 03 - ADC/Project_ADC-002/main.c"
#line 13 "C:/Users/pablo/Desktop/Github/PIC/Unidade 03 - ADC/Project_ADC-002/main.c"
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


unsigned int ADCRead(unsigned char Canal)
{
 switch(Canal)
 {
 case 0:{
 ADCON0 = 0B00000001;
 break;
 }
 case 1:{
 ADCON0 = 0B00000101;
 break;
 }
 }
 Delay_us(40);
 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE == 1);
 return ( ( (int)ADRESH << 8 ) | ( (int)ADRESL ) );
}


void ConfigADC()
{










 TRISA.RA0 = 1;
 TRISA.RA1 = 1;
 ADCON0 = 0B00000001;
 ADCON1 = 0B00001101;
 ADCON2 = 0B10101010;

}


void ConfigLCD()
{
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "ADC-AN0: ");
 Lcd_Out(2, 1, "ADC_AN1: ");
}


void main()
{
 unsigned int Leitura_ADC;
 unsigned char Texto[7];

 ConfigADC();
 ConfigLCD();

 while( 1 )
 {

 Leitura_ADC = ADCRead(0);
 WordToStr(Leitura_ADC, Texto);
 LCD_Out(1, 10, Texto);
 Delay_ms(20);

 Leitura_ADC = ADCRead(1);
 WordToStr(Leitura_ADC, Texto);
 LCD_Out(2, 10, Texto);
 Delay_ms(20);
 }
}
