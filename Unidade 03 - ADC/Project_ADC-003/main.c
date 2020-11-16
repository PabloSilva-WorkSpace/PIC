
#define TRUE 1

/*******************************************************************************
 Variáveis Globais
*******************************************************************************/
/* Configuração dos pinos do LCD */
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
/* Direção dos pinos */
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void main() {
    unsigned int Valor_ADC = 0;
    unsigned char Tensao[6];
    
#ifdef P18F45K22
    TRISA.RA0 = 1;
    ANSELA = 0x01;
    ANSELB = 0;
#else
    TRISA.RA0 = 1;             /* Configura o pino RA0/AN0 como entrada */
    ADCON1 = 0B00001110;       /* Configura RA0/AN0 como ADC */
#endif

    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Out(1,1,"ADC-AN0: ");

    ADC_Init();
    
    while(TRUE)
    {
        Valor_ADC = ADC_Read(0); /* Chamada da rotina (função) que lê uma entrada analógica - neste caso AN0 */
        Valor_ADC = Valor_ADC * (1000/1023.);  /* Cria uma escala de 00.00 a 10.00 no display, enquanto a tensão de entrada no canal AN0 varia de 0V a 5V*/
        Tensao[0] = (Valor_ADC/1000)   + '0';
        Tensao[1] = (Valor_ADC/100)%10 + '0';
        Tensao[2] = '.';
        Tensao[3] = (Valor_ADC/10)%10  + '0';
        Tensao[4] = (Valor_ADC/1)%10   + '0';
        Tensao[5] = 0;

        Lcd_Out(1, 10, Tensao);
        Delay_ms(20);
    }
}




