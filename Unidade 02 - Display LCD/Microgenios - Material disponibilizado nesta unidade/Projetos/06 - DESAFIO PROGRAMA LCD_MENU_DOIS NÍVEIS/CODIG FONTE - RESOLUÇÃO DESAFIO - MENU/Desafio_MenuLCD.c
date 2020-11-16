/*******************************************************************************
 EMPRESA: Microgenios Solu��es Eletr�nicas Ltda.
    SITE: www.microgenios.com.br | www.microgenios.com
    FONE: (+55 11) 5084-4518 | 3384-5598

 PROGRAMA EXEMPLO:
         OBJETIVO: Estudo do display LCD
            AUTOR: Fernando Simplicio.[fernando@microgenios.com.br]
********************************************************************************
 MICROCONTROLADOR: PIC18F452K22
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
  *J17 = GND
*******************************************************************************/
#define SELECIONA_MENU PORTD.RD0
#define ENTER_MENU PORTD.RD1
#define RETORNA_MENU_PRINCIPAL PORTD.RD2

//**************************PROT�PIPOS******************************************
void CondicaoInicialMenu();
void ConfigMCU();

//**************************Vari�vel********************************************
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

int m_estado_nivel_um = 1;  //N�vel um do menu. Come�a m�quina de estado no nivel 1
int submenu = 0;            //Vari�vel que informa o n�vel do Menu
int m_estado_nivel_dois = 1;//N�vel dois do menu
int estado_selecionado = 1;

//******************************FUN��O******************************************
//Esta fun��o � chamada quando queremos voltar ao estado inicial do n�vel 1 do menu
void CondicaoInicialMenu()
{
  m_estado_nivel_um = 1;
  submenu = 0;             //for�a condi��o para voltar ao n�vel 1 do menu
  m_estado_nivel_dois = 1;
  estado_selecionado = 1;
  
  //Escreve novamente no LCD os textos do n�vel 1
  Lcd_Cmd(_LCD_CLEAR); //Apaga todos os textos do LCD e reescreve textos iniciais novamente.
  Lcd_Out(1, 1,">OPCAO1 [ENTER]");
  Lcd_Out(2, 1," OPCAO2        ");
}

//Configura o estado inicial dos pinos de IO do MCU.
void ConfigMCU()
{
#ifdef P18F45K22
  ANSELB = 0;
  ANSELD = 0;
#else
  ADCON1 |= 0X0F;
#endif
  TRISD.RD0 = 1; PORTD.RD0 = 1;  //SELE��O
  TRISD.RD1 = 1; PORTD.RD1 = 1;  //ENTER
  TRISD.RD2 = 1; PORTD.RD2 = 1;  //RETORNO
}

void main()
{
  ConfigMCU();
  
  Lcd_Init();                  //Inicializa display LCD
  Lcd_Cmd(_LCD_CLEAR);         //Apaga display
  Lcd_Cmd(_LCD_CURSOR_OFF);    //Desliga cursor

  //Mensagens Iniciais no display LCD
  Lcd_Out(1, 1,">OPCAO1 [ENTER]");
  Lcd_Out(2, 1," OPCAO2        ");

  while (1)
        {
        //Esse � o primeiro n�vel do menu.
        //Repare no programa que foi usando um comando Switch para manipular uma
        //pequena m�quina de estado atrav�s da vari�vel m_estado_nivel_um. Cada "case"
        //altera o valor da vari�vel estado_selecionado.
        
        if (SELECIONA_MENU == 0 && submenu == 0)
             {
                switch(m_estado_nivel_um)
                    {
                    case 1:
                         Lcd_Chr(1,1,'>'); LCD_Out(1,9,"[ENTER]");
                         m_estado_nivel_um = 2;
                         estado_selecionado = 1;
                         Lcd_Chr(2,1,' '); LCD_Out(2,9,"       ");
                    break;
                    case 2:
                         Lcd_Chr(2,1,'>'); LCD_Out(2,9,"[ENTER]");
                         m_estado_nivel_um = 1;
                         estado_selecionado = 2;
                         Lcd_Chr(1,1,' '); LCD_Out(1,9,"       ");
                    break;
                    }
             }

        //Se chegou aqui � por que o operador pressionou a tecla ENTER. Dependendo
        //do valor da vari�vel estado_selecionado (alterado no bloco acima), sabemos
        //qual o submenu escolhido.
        if (ENTER_MENU == 0)
          {
             switch(estado_selecionado)
                {
                case 1:
                   Lcd_Cmd(_LCD_CLEAR);
                   Lcd_Out(1, 1,"OPCAO1");
                   Lcd_Out(1,9,">SENSO1");
                   Lcd_Out(2,9," EQUIP1");
                   submenu = 1; //Informa que estamos no segundo n�vel do menu
                break;
                case 2:
                   Lcd_Cmd(_LCD_CLEAR);
                   Lcd_Out(1, 1,"OPCAO2");
                   Lcd_Out(1,9,">SENSO2");
                   Lcd_Out(2,9," EQUIP2");
                   submenu = 1; //idem
                break;
                }
             }

        //Esta rotina foi criada para manipular as op��es do segundo n�vel do menu.
        //Repare que somente no segundo n�vel do menu, esse if poder� ser verdadeiro
        if (SELECIONA_MENU == 0 && submenu == 1)
            {
             switch(m_estado_nivel_dois)
                 {
                 case 1:
                    Lcd_Chr(1,9,'>');
                    m_estado_nivel_dois = 2;
                    Lcd_Chr(2,9,' ');
                 break;
                 case 2:
                    Lcd_Chr(2,9,'>');
                    m_estado_nivel_dois = 1;
                    Lcd_Chr(1,9,' ');
                 break;
                 }
            }

        //Essa rotirna retorna para o n�vel um do menu, desde que o programa esteja no
        //n�vel dois do menu.
        if (RETORNA_MENU_PRINCIPAL == 0 && submenu == 1)
             {
               CondicaoInicialMenu();
             }

        Delay_ms(250); //Como nesse programa n�o foi usado nenhum tratador
                       //direto de debounce das teclas, foi empregado o delay.

        }

}