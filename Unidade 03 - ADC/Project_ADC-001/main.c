/*******************************************************************************
Este projeto consiste em um programa que l� periodicamente a tens�o sobre o 
trimpot ANAL1, a qual esta na entrada AN0. Usaremos a tens�o de refer�ncia 
interna do ADC ( 0V a 5V ).

*******************************************************************************/


#define TRUE 1


/* Configura��o dos pinos do LCD */
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;
/* Dire��o dos pinos */
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


void ConfigADC()
{
#ifdef P18F45K22
    ANSELA.B0 = 1;   /* Configura��o individual do pino RA0 como ANALOG CHANNEL (AN0). Quando atribui-se o valor $1 (High Logic Level) o pino � configurado como DIGITAL I/O. */
    ALSELB = 0;      /* Configura o Port B como DIGITAL I/O */
    ADCON0 = 0B00000001;
    ADCON1 = 0B00001110;
    ADCON2 = 0B10101010;
#else
    TRISA.RA0 = 1;   /* Configura��o individual do pino RA0 como entrada. Quando atribui-se o valor $0 (Low Logic Level) o pino � configurado como sa�da. */
    ADCON0 = 0B00000001;   /* (1) Seleciona o ANALOG CHANNEL ; (2) START na convers�o; (3) LIGA/DESLIGA o m�dulo ADC*/
    ADCON1 = 0B00001110;   /* (1) Configura a tens�o de refer�ncia; (2) Configura os pinos entre ANALOG CHANNEL ou DIGITAL I/O*/
    ADCON2 = 0B10101010;   /* (1) Configura a justificativa do valor digital; (2) Configura o tempo de uma aquisi��o do ADC; (3) Configura o clock do ADC */
#endif
}


void ConfigLCD()
{
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Out(1, 1, "ADC: ");
}


void main()
{
    unsigned int Leitura_ADC;
    unsigned char Texto[7];

    ConfigADC();
    
    ConfigLCD();

    while(TRUE)
    {
        ADCON0.GO_DONE = 1; /* Comando de START para a convers�o do ADC */
        while(ADCON0.GO_DONE == 1); /* Aguarda o t�rmino da convers�o - No t�rmino da convers�o o m�dulo ADC transiciona o bit GO/DONE para zero ("Low Level Logic"). Este evento pode ser observado por POLLING ou INTERRUP��O, neste caso estamos usando POLLING. */
        Leitura_ADC = ( ( (int)ADRESH << 8 ) | ( (int)ADRESL ) );   /* O camando shift insere zeros nas posi��es desalocadas pelo deslocamento da palavra bin�ria. */
        WordToStr(Leitura_ADC, Texto);
        LCD_Out(1, 6, Texto);
        Delay_ms(20);
    }
}