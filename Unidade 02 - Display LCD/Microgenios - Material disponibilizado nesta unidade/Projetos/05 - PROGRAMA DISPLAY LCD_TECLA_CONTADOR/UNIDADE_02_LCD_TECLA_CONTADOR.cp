#line 1 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/05 - PROGRAMA DISPLAY LCD_TECLA_CONTADOR/UNIDADE_02_LCD_TECLA_CONTADOR.c"
#line 55 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/05 - PROGRAMA DISPLAY LCD_TECLA_CONTADOR/UNIDADE_02_LCD_TECLA_CONTADOR.c"
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
 ANSELD = 0;
#line 83 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/05 - PROGRAMA DISPLAY LCD_TECLA_CONTADOR/UNIDADE_02_LCD_TECLA_CONTADOR.c"
 TRISD.RD0 = 1;
 PORTD.RD0 = 1;

 TRISD.RD1 = 1;
 PORTD.RD1 = 1;
}


void main(){
 signed int Contador = 0;
 unsigned char Texto[7];

 ConfigMCU();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Valor:");


 while( 1 )
 {
 if( PORTD.RD0  == 0)
 {





 Contador++;
 WordToStr(Contador, Texto);










 Lcd_Out(1,7, Texto);
#line 142 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/05 - PROGRAMA DISPLAY LCD_TECLA_CONTADOR/UNIDADE_02_LCD_TECLA_CONTADOR.c"
 Delay_ms(300);

 }

 if( PORTD.RD1  == 0)
 {
 Contador--;
 intToStr(Contador, Texto);
 LCD_Out(1,7, Texto);
 Delay_ms(300);

 }

 }

}
