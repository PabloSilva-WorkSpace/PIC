/*******************************************************************************
 EMPRESA: Microgenios Solu��es Eletr�nicas Ltda.
    SITE: www.microgenios.com.br | www.microgenios.com
    FONE: (+55 11) 5084-4518 | 3384-5598

 PROGRAMA EXEMPLO:
         OBJETIVO: Estudo do conversor ADC
            AUTOR: Fernando Simplicio.[fernando@microgenios.com.br]
********************************************************************************
 MICROCONTROLADOR: PIC18F45K22
 http://www.microchip.com/wwwproducts/Devices.aspx?dDocName=en546239

 PLACA DE DESENVOLVIMENTO: EASYPIC V7 (Super M�dulo Educacional)
 http://www.microgenios.com/?1.32.0.0,543

 M�DULOS DE EXPANS�O:

 SOFTWARE: mikroC PRO for PIC (vers�o 6 ou superior)
 http://www.microgenios.com/?3.5.0.0,48

************************ CONFIGURA��O DO KIT EASYPIC V7 ************************
 MICROCONTROLADOR: PIC18F45K22
 ALIMENTA��O: 3.3V
 CRISTAL: 8Mhz.

 CHAVES DE FUN��O:
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
  *J15.RA0 = ON  (USAR TRIMPOT P1)
  *J17 = GND
*******************************************************************************/
/*Include*/

/*Diretivas de pr�-compila��o*/
 #define TRUE  1

/*Vari�vel Global */
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

/*Fun��es*/

/*Programa Principal*/


void main(){
  unsigned int Valor_ADC = 0;
  unsigned char Tensao[10];

#ifdef P18F45K22
  TRISA.RA0 = 1;
  ANSELA = 0X01;
  ANSELB = 0;                        // Configure PORTB pins as digital
#else
  TRISA.RA0 = 1;
  ADCON1 = 0B00001110; //Configura RA0/AN0 como ADC
#endif

  Lcd_Init();                        // Initialize Lcd
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"ADC0:");   //Escreve na Linha x Coluna do LCD o texto "Alarme"

  ADC_Init();
  
 while(TRUE)
  {
    Valor_ADC = ADC_Read(0);
    Valor_ADC = Valor_ADC * (1234/1023.);    //0 ao 1023 -> 0 ao 1234
    Tensao[0] = (Valor_ADC/1000) + '0';      // 6 + '0'  = '6'
    Tensao[1] = (Valor_ADC/100)%10 + '0';    //'6' - '0' = 6
    Tensao[2] = '.';
    Tensao[3] = (Valor_ADC/10)%10 + '0';
    Tensao[4] = (Valor_ADC/1)%10 + '0';
    Tensao[5] = 0;  //terminador NULL*/
    

    //floatToStr(Valor_ADC , Tensao);
    //Tensao[5] = 0;
    
    Lcd_Out(1,6,Tensao); // Mostra os valores no display
    Delay_ms(20);
  }
}