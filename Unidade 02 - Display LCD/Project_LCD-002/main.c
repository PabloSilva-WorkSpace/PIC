
/* Protótipo de funções */
void ConfigMCU();


/* Variáveis Globais */
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


void ConfigMCU()
{
#ifdef P18F45K22
    ANSELB = 0;
#else
    ADCON1 |= 0x0F;
#endif
}


void main() 
{
    ConfigMCU();                     /* Inicializa MCU */
    Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
    Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
    Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
    Lcd_Out(1,1,"Primeira Linha");   /* Linha x Coluna*/
    Lcd_Out(2,1,"Segunda Linha");
    
    while(1);
}