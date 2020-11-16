/*******************************************************************************
 EMPRESA: Microgenios Soluções Eletrônicas Ltda.
    SITE: www.microgenios.com.br | www.microgenios.com
    FONE: (+55 11) 5084-4518 | 3384-5598

 PROGRAMA EXEMPLO:
         OBJETIVO: Estudo do display LCD
            AUTOR: Fernando Simplicio.[fernando@microgenios.com.br]
********************************************************************************
 MICROCONTROLADOR: PIC18F452K22
 http://www.microchip.com/wwwproducts/Devices.aspx?dDocName=en546239

 PLACA DE DESENVOLVIMENTO: EASYPIC V7 (Super Módulo Educacional)
 http://www.microgenios.com/?1.32.0.0,543

 MÓDULOS DE EXPANSÃO:

 SOFTWARE: mikroC PRO for PIC (versão 6 ou superior)
 http://www.microgenios.com/?3.5.0.0,48

************************ CONFIGURAÇÃO DO KIT EASYPIC V7 ************************
 MICROCONTROLADOR: PIC18F45K22
 ALIMENTAÇÃO: 3.3V
 CRISTAL: 8Mhz.

 CHAVES DE FUNÇÃO:
  --------------------- -------------------------------------------------
 |SW1             |SW2            |SW3                 |SW4             |
 |RC7 ( 1) = OFF  |RC6 ( 1) = OFF |PORTA/E ( 1) = OFF  |DIS0 ( 1) = OFF |
 |RB2 ( 2) = OFF  |RB5 ( 2) = OFF |PORTB   ( 1) = OFF  |DIS1 ( 1) = OFF |
 |RB1 ( 3) = OFF  |RB2 ( 3) = OFF |PORTC   ( 1) = OFF  |DIS2 ( 1) = OFF |
 |RB4 ( 4) = OFF  |RB1 ( 4) = OFF |PORTD   ( 1) = OFF  |DIS3 ( 1) = OFF |
 |RA3 ( 5) = OFF  |RA2 ( 5) = OFF |READ-X  ( 1) = OFF  |BPWM ( 1) = OFF |
 |RB5 ( 6) = OFF  |RB7 ( 6) = OFF |READ-Y  ( 1) = OFF  |BCK  ( 1) = ON  |
 |RC5 ( 7) = OFF  |RC4 ( 7) = OFF |DRIVE_A ( 1) = OFF  |SCL  ( 1) = OFF |
 |RD7 ( 8) = OFF  |RD6 ( 8) = OFF |DRIVE_B ( 1) = OFF  |SDA  ( 1) = OFF |
  --------------------- -------------------------------------------------
 JUMPERS:
  *Chave RN4.ALL = NO MEIO
  *Chave RN2.ALL = NO MEIO
  *J17 = GND
*******************************************************************************/
/*Include*/

/*Diretivas de pré-compilação*/
 #define TRUE  1

/*Variável Global */
 // CONFIGURA OS PINOS DO LCD
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

/*Funções*/
void ConfigMCU();     //Prototipo de função

/*Programa Principal*/

void ConfigMCU()
{
#ifdef P18F45K22
  ANSELB = 0;
  ANSELA.B0 = 1;   //AN0
  ANSELA.B1 = 1;   //AN1
#else
  ADCON1 |= 0B00001101;  //AN0 e AN1
#endif

  TRISA.RA0 = 1; 
  PORTA.RA0 = 1;
  
  TRISA.RA1 = 1;
  PORTA.RA1 = 1;
  
}
void main(){
  unsigned int Leitura_ADC;
  unsigned char Texto[10];
  
  ConfigMCU();                       //Inicializa MCU

  Lcd_Init();                        //Inicializa display no modo 4 bits
  Lcd_Cmd(_LCD_CLEAR);               //Apaga display
  Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
  Lcd_Out(1,1,"S1:");     //Linha x Coluna
  Lcd_Out(2,1,"S2:");

  ADC_Init();
  
 while(TRUE)
 {
   //*****S1
   Leitura_ADC = ADC_Read(0); //S1 -> AN0
                              //S2 -> AN1
   Leitura_ADC = (int)Leitura_ADC * (100./1023.);
   WordToStr(Leitura_ADC, Texto);  //65535 + 0 = 6 posições
   LCD_Out(1,4, Texto);
   LCD_Chr_Cp('%');
   Delay_ms(20);

   //*****S2
   Leitura_ADC = ADC_Read(1); //S1 -> AN0
                              //S2 -> AN1
   Leitura_ADC = (int)Leitura_ADC * (255./1023.);
   WordToStr(Leitura_ADC, Texto);  //65535 + 0 = 6 posições
   LCD_Out(2,4, Texto);
   Delay_ms(20);
 

 }
}