/*******************************************************************************
Este projeto consiste em um programa que lê periodicamente a tensão sobre o
trimpot ANAL1, a qual esta na entrada AN0. Usaremos a tensão de referência
interna do ADC ( 0V a 5V ).

*******************************************************************************/


#define TRUE 1


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


unsigned int ADCRead(unsigned char Canal)
{
    switch(Canal)
    {
        case 0:{
            ADCON0 = 0B00000001;   /* Selecionamos o ANALOG CHANNEL AN0; e ligamos o módulo ADC */
            break;
        }
        case 1:{
            ADCON0 = 0B00000101;   /* Selecionamos o ANALOG CHANNEL AN1; e ligamos o módulo ADC */
            break;
        }
    }
    Delay_us(40); /* Tempo de aquisição - Refere-se ao tempo de carga do capacitor (Veja o tempo minímo no datasheet) */
    ADCON0.GO_DONE = 1; /* Comando de START para a conversão do ADC */
    while(ADCON0.GO_DONE == 1); /* Aguarda o término da conversão - No término da conversão o módulo ADC transiciona o bit GO/DONE para zero ("Low Level Logic"). Este evento pode ser observado por POLLING ou INTERRUPÇÂO, neste caso estamos usando POLLING. */
    return ( ( (int)ADRESH << 8 ) | ( (int)ADRESL ) ); /* O camando shift insere zeros nas posições desalocadas pelo deslocamento da palavra binária. */
}


void ConfigADC()
{
#ifdef P18F45K22
    ANSELA.B0 = 1;   /* Configuração individual do pino RA0 como ANALOG CHANNEL (AN0). Quando atribui-se o valor $1 (High Logic Level) o pino é configurado como DIGITAL I/O. */
    ANSELA.B1 = 1;   /* Configuração individual do pino RA1 como ANALOG CHANNEL (AN1). Quando atribui-se o valor $1 (High Logic Level) o pino é configurado como DIGITAL I/O. */
    ALSELB = 0;      /* Configuração do Port B como DIGITAL I/O */
    TRISA.RA0 = 1;   /* Configuração individual do pino RA0 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
    TRISA.RA1 = 1;   /* Configuração individual do pino RA1 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
    ADCON0 = 0B00000001;   /* Seleção do ANALOG CHANNEL AN0; e liga o módulo ADC */
    ADCON1 = 0B00001101;   /* Configuração da tensão de referência; e configuração dos pinos {0, 1} do port A como ANALOG CHANNEL (AN0 e AN1) */
    ADCON2 = 0B10101010;
#else
    TRISA.RA0 = 1;   /* Configuração individual do pino RA0 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
    TRISA.RA1 = 1;   /* Configuração individual do pino RA1 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino é configurado como saída. */
    ADCON0 = 0B00000001;   /* Seleção do ANALOG CHANNEL AN0; e liga o módulo ADC */
    ADCON1 = 0B00001101;   /* Configuramos da tensão de referência; e configuração dos pinos {0, 1} do port A como ANALOG CHANNEL (AN0 e AN1) */
    ADCON2 = 0B10101010;
#endif
}


void ConfigLCD()
{
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Out(1, 1, "ADC-AN0: ");
    Lcd_Out(2, 1, "ADC_AN1: ");
}


void main()
{
    unsigned int Leitura_ADC;
    unsigned char Texto[7];

    ConfigADC();
    ConfigLCD();

    while(TRUE)
    {
        /* Leitura do canal analógico AN0 */
        Leitura_ADC = ADCRead(0);
        WordToStr(Leitura_ADC, Texto);
        LCD_Out(1, 10, Texto);
        Delay_ms(20);
        /* Leitura do canal analógico AN1 */
        Leitura_ADC = ADCRead(1);
        WordToStr(Leitura_ADC, Texto);
        LCD_Out(2, 10, Texto);
        Delay_ms(20);
    }
}