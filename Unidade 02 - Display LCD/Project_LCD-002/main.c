
/* Protótipo de funções */
void ConfigMCU();


/* Variáveis Globais */
// Configuração dos pinos do LCD
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
// Direção dos pinos
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


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