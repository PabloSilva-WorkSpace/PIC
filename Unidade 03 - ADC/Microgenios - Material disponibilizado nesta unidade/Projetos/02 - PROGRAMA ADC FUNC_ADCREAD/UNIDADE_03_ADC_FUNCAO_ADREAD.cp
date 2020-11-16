#line 1 "C:/Users/Microgenios/Desktop/UNIDADE_03_ADC_CONVERSOR_ANALÓGICO_DIGITAL/02 - PROGRAMA ADC FUNC_ADCREAD/UNIDADE_03_ADC_FUNCAO_ADREAD.c"



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



unsigned int ADCRead(unsigned char Canal)
{
 switch(Canal)
 {
 case 0: {
 ANSELA.B0 = 1;
 TRISA.RA0 = 1;
 PORTA.RA0 = 1;

 ADCON0 = 0B00000001;
 ADCON1 = 0B00001110;

 break;
 }

 case 1: {
 ANSELA.B1 = 1;
 TRISA.RA1 = 1;
 PORTA.RA1 = 1;

 ADCON0 = 0B00000101;
 ADCON1 = 0B00001111;




 break;
 }

 }

 ADCON2 = 0B10101010;
 Delay_us(40);

 ADCON0.GO_DONE = 1;
 while(ADCON0.GO_DONE == 1);
 return ((ADRESH << 8) | (int)ADRESL);


}


void main() {
 unsigned int Leitura_ADC;
 unsigned char Texto[10];


 ANSELB = 0;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"ADC: ");

 while(1)
 {
 Leitura_ADC = ADCRead(0);
 WordToStr(Leitura_ADC, Texto);
 LCD_Out(1,5, Texto);
 Delay_ms(20);

 }

}
