#line 1 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/06 - DESAFIO PROGRAMA LCD_MENU_DOIS NÍVEIS/CODIG FONTE - RESOLUÇÃO DESAFIO - MENU/Desafio_MenuLCD.c"
#line 48 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/06 - DESAFIO PROGRAMA LCD_MENU_DOIS NÍVEIS/CODIG FONTE - RESOLUÇÃO DESAFIO - MENU/Desafio_MenuLCD.c"
void CondicaoInicialMenu();
void ConfigMCU();


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

int m_estado_nivel_um = 1;
int submenu = 0;
int m_estado_nivel_dois = 1;
int estado_selecionado = 1;



void CondicaoInicialMenu()
{
 m_estado_nivel_um = 1;
 submenu = 0;
 m_estado_nivel_dois = 1;
 estado_selecionado = 1;


 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1,">OPCAO1 [ENTER]");
 Lcd_Out(2, 1," OPCAO2        ");
}


void ConfigMCU()
{

 ANSELB = 0;
 ANSELD = 0;
#line 95 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/06 - DESAFIO PROGRAMA LCD_MENU_DOIS NÍVEIS/CODIG FONTE - RESOLUÇÃO DESAFIO - MENU/Desafio_MenuLCD.c"
 TRISD.RD0 = 1; PORTD.RD0 = 1;
 TRISD.RD1 = 1; PORTD.RD1 = 1;
 TRISD.RD2 = 1; PORTD.RD2 = 1;
}

void main()
{
 ConfigMCU();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1,">OPCAO1 [ENTER]");
 Lcd_Out(2, 1," OPCAO2        ");

 while (1)
 {





 if ( PORTD.RD0  == 0 && submenu == 0)
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




 if ( PORTD.RD1  == 0)
 {
 switch(estado_selecionado)
 {
 case 1:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1,"OPCAO1");
 Lcd_Out(1,9,">SENSO1");
 Lcd_Out(2,9," EQUIP1");
 submenu = 1;
 break;
 case 2:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1,"OPCAO2");
 Lcd_Out(1,9,">SENSO2");
 Lcd_Out(2,9," EQUIP2");
 submenu = 1;
 break;
 }
 }



 if ( PORTD.RD0  == 0 && submenu == 1)
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



 if ( PORTD.RD2  == 0 && submenu == 1)
 {
 CondicaoInicialMenu();
 }

 Delay_ms(250);


 }

}
