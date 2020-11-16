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



const char character1[] = {31,17,16,16,17,31,6,14};

void CustomChar1(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(0X40);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

const char character2[] = {31,21,21,31,27,31,17,31};

void CustomChar2(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(0X48);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 1);
}

void ConfigMCU()
{
#ifdef P18F45K22
  ANSELB = 0;
#else
  ADCON1 |= 0X0F;
#endif
}
void main(){
  unsigned char ucX;
  ConfigMCU();                       //Inicializa MCU

  Lcd_Init();                        //Inicializa display no modo 4 bits
  Lcd_Cmd(_LCD_CLEAR);               //Apaga display
  Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
  Lcd_Out(1,1,"PRIMEIRA LINHA");     //Linha x Coluna
  Lcd_Out(2,1,"MA OCA");

  for(ucX = 0; ucX < 16; ++ucX)
  {
     LCD_Cmd(_LCD_SHIFT_RIGHT);
     Delay_ms(500);
  }
  
  for(ucX = 0; ucX < 16; ++ucX)
  {
     LCD_Cmd(_LCD_SHIFT_LEFT);
     Delay_ms(500);
  }
  CustomChar1(2,3);
  CustomChar2(2,8);
  
 while(TRUE);
}