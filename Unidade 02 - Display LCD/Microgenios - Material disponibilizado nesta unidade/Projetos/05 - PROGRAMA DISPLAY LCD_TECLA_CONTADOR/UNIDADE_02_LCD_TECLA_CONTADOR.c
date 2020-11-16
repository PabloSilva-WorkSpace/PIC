/*******************************************************************************
 EMPRESA: Microgenios Soluções Eletrônicas Ltda.
    SITE: www.microgenios.com.br | www.microgenios.com
    FONE: (+55 11) 5084-4518 | 3384-5598

 PROGRAMA EXEMPLO:
         OBJETIVO: Estudo do display LCD
                   TECLA - UP - RD0
                   TECLA -DOWN - RD1
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
  *Chave de pull-up do PORTD.RD0 e RD1 em ON
  *J17 = GND
*******************************************************************************/
/*Include*/

/*Diretivas de pré-compilação*/
 #define TRUE  1
 #define TECLA_UP PORTD.RD0
 #define TECLA_DOWN PORTD.RD1

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
  ANSELD = 0;
#else
  ADCON1 |= 0X0F;
#endif

  TRISD.RD0 = 1; //Entrada TECLA
  PORTD.RD0 = 1; //opcional

  TRISD.RD1 = 1; //segunta tecla
  PORTD.RD1 = 1;
}


void main(){
  signed int Contador = 0;
  unsigned char Texto[7]; //0 ao 6
  
  ConfigMCU();                       //Inicializa MCU

  Lcd_Init();                        //Inicializa display no modo 4 bits
  Lcd_Cmd(_LCD_CLEAR);               //Apaga display
  Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
  Lcd_Out(1,1,"Valor:");     //Linha x Coluna

  
 while(TRUE)
 {
    if(TECLA_UP == 0)
     {
       //Não podemos carregar Contador diretamente na função LCD_Out, pois
       //Contador não é String. Repare na sintaxe da função LCD_Out (consulte o help do mikroC)
       //que devemos enviar o endereço de um vetor, pois na função temos um ponteiro.
       //Neste caso devemos converte Contador para string, e por isso, usamos a lib WordToSTr.
       //Ex: Contador = 65535;
       Contador++;    //0 a 65535 + 0 = 6, logo a matriz deve ser de no  mínimo 6 bytes
       WordToStr(Contador, Texto);  //WordToStr é para variável do tipo: unsigned int e consome 6 bytes da matriz
                                    //IntToStr é para variável do tipo: signed int e consome 7 bytes da matriz por causa do sinal
       //Após a conversão temos:
       
       //Texto[0] = '6 '
       //Texto[1] = '5 '
       //Texto[2] = '5 '
       //Texto[3] = '3 '
       //Texto[4] = '5 '
       //Texto[5] =  0   //obrigatóriamente a matriz deve suportar o NULL, caso contrário - PAU!!!

       Lcd_Out(1,7, Texto); //Escreve no LCD o valor de Contador: Portanto teremos - Valor:65535
      //************************************
      
      //Segue um exemplo da função LCD_Out
      //void Lcd_Out(char Linha, char Coluna, char * Text)
      //{
      //  (...posiciona cursor...)
      //  while(*Text != 0)     //Enquanto não encontra o NULL continua imprimindo os caracteres no LCD
      //   {
      //     LCD_Chr_Cp(*Text); //LCD print
      //     Text++;            //Incrementa endereço para pegar o próximo byte da matriz Texto
      //   }
      //}

      //NUNCA ESQUEÇA A DIFERENÇA ENTRE UM CHAR E UMA STRING!
      // 'A'  = Caracter  = 65  <- ISSO É UM NÚMERO, MUITO FÁCIL ARMAZENAR EM MEMÓRIA
      // "AB"  = String  = 'A' + 'B' + 0    ->VETOR CHAR[3]   <- ISSO É UM ARRANJO DE BYTES, E DEVE SER ARMAZENADO EM UM ARRAY
       
      Delay_ms(300);
       
     }
     
     if(TECLA_DOWN == 0)
      {
        Contador--;
        intToStr(Contador, Texto);
        LCD_Out(1,7, Texto);
        Delay_ms(300);
      
      }

 }

}

