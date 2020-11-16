#line 1 "C:/Users/Microgenios/Desktop/UNIDADE_03_ADC_CONVERSOR_ANALÓGICO_DIGITAL/04 - PROGRAMA DESAFIO LCD_ADC/UNIDADE_03_DESAFIO_ADC_LCD.c"
#line 50 "C:/Users/Microgenios/Desktop/UNIDADE_03_ADC_CONVERSOR_ANALÓGICO_DIGITAL/04 - PROGRAMA DESAFIO LCD_ADC/UNIDADE_03_DESAFIO_ADC_LCD.c"
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


void ConfigMCU();



void ConfigMCU()
{

 ANSELB = 0;
 ANSELA.B0 = 1;
 ANSELA.B1 = 1;
#line 79 "C:/Users/Microgenios/Desktop/UNIDADE_03_ADC_CONVERSOR_ANALÓGICO_DIGITAL/04 - PROGRAMA DESAFIO LCD_ADC/UNIDADE_03_DESAFIO_ADC_LCD.c"
 TRISA.RA0 = 1;
 PORTA.RA0 = 1;

 TRISA.RA1 = 1;
 PORTA.RA1 = 1;

}
void main(){
 unsigned int Leitura_ADC;
 unsigned char Texto[10];

 ConfigMCU();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"S1:");
 Lcd_Out(2,1,"S2:");

 ADC_Init();

 while( 1 )
 {

 Leitura_ADC = ADC_Read(0);

 Leitura_ADC = (int)Leitura_ADC * (100./1023.);
 WordToStr(Leitura_ADC, Texto);
 LCD_Out(1,4, Texto);
 LCD_Chr_Cp('%');
 Delay_ms(20);


 Leitura_ADC = ADC_Read(1);

 Leitura_ADC = (int)Leitura_ADC * (255./1023.);
 WordToStr(Leitura_ADC, Texto);
 LCD_Out(2,4, Texto);
 Delay_ms(20);


 }
}
