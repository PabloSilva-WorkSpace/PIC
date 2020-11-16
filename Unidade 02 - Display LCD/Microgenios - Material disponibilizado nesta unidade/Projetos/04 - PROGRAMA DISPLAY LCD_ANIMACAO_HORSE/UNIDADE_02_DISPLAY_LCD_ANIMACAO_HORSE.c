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

 referencia
 http://mcselec.com/index.php?option=com_content&task=view&id=231&Itemid=57
 
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
 
 #define FRAME1 1
 #define FRAME2 2
 #define FRAME3 3

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

const char character1A[] ={ 0,  0,   0,   0,   3,   7,   14,  14,
                           32 , 32 , 32 , 32 , 15 , 31 , 31 , 31,
                           32 , 32 , 32 , 32 , 3 , 31 , 31 , 31,
                           32 , 1 , 31 , 31 , 31 , 27 , 19 , 16,
                           12 , 24 , 16 , 1 , 1 , 1 , 32 , 32,
                           31 , 31 , 30 , 23 , 32 , 32 , 16 , 32,
                           31 , 31 , 3 , 2 , 18 , 2 , 1 , 32,
                           28 , 28 , 4 , 4 , 8 , 32 , 32 , 32};

const char character2A[] = {0,  0,   0,   0,   0,   7,   15,  30,
                           32 , 32 , 32 , 32 , 14 , 31 , 31 , 31,
                           32 , 32 , 32 , 32 , 7 , 31 , 31 , 31,
                           32 , 2 , 31 , 31 , 31 , 27 , 19 , 16,
                           16 , 32 , 32 , 1 , 1 , 1 , 32 , 32,
                           31 , 31 , 27 , 18 , 1 , 1 , 17 , 32,
                           31 , 31 , 1 , 1 , 1 , 1 , 32 , 32,
                           24 , 28 , 4 , 8 , 16 , 32 , 16 , 32};

const char character3A[] = {0 , 0,   0,   7,   15,   30, 28,  24,
                           32 , 32 , 32 , 15 , 31 , 31 , 31 , 31,
                           32 , 32 , 32 , 3 , 31 , 31 , 31 , 31,
                           1 , 31 , 31 , 31 , 27 , 27 , 16 , 16,
                           19 , 19 , 2 , 2 , 4 , 32 , 32 , 32,
                           31 , 7 , 14 , 6 , 1 , 32 , 32 , 32,
                           15 , 7 , 19 , 15 , 32 , 16 , 32 , 32,
                           16 , 24 , 12 , 4 , 2 , 1 , 32 , 32};


void SpecialChar(char frame) {
    char i;

 switch(frame)
  {
   case 1: {
              Lcd_Cmd(0X40);   //aponto para o endereço inicial da CGRAM
              for (i = 0; i<64; i++){Lcd_Chr_CP(character1A[i]);}
              for(i = 0; i < 8; i++)
               {
                 if(i < 4) Lcd_Chr_Cp(i);  //escrever na primeira linha
                 else Lcd_Chr(2, (1 + i-4), i);
               }
               break;
           }

    case 2: {
              Lcd_Cmd(0X40);
              for (i = 0; i<64; i++){Lcd_Chr_CP(character2A[i]);}
              for(i = 0; i < 8; i++)
               {
                 if(i < 4) Lcd_Chr(1, 1 + i,i);
                 else Lcd_Chr(2, (1 + i-4), i);
               }
               break;
           }
           
        case 3: {
              Lcd_Cmd(0X40);
              for (i = 0; i<64; i++){Lcd_Chr_CP(character3A[i]);}
              for(i = 0; i < 8; i++)
               {
                 if(i < 4) Lcd_Chr(1, 1 + i,i);
                 else Lcd_Chr(2, (1 + i-4), i);
               }
               break;
           }

  }
}

/*Programa Principal*/

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
  Lcd_Out(1,1,"");                   //Linha x Coluna
  Lcd_Out(2,1,"");


 while(TRUE)
  {

   for(ucX = 0; ucX < 9; ucX++)
    {
      SpecialChar(FRAME1);
      LCD_Cmd(_LCD_SHIFT_RIGHT);
      Delay_ms(300);

      SpecialChar(FRAME2);
      LCD_Cmd(_LCD_SHIFT_RIGHT);
      Delay_ms(300);

      SpecialChar(FRAME3);
      LCD_Cmd(_LCD_SHIFT_RIGHT);
      Delay_ms(300);
    }
    //LCD_Cmd(_LCD_CLEAR);
    for(ucX = 0; ucX < 13; ucX++)LCD_Cmd(_LCD_SHIFT_RIGHT);
  }
}