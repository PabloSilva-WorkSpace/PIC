/* DESCRI��O DO PROJETO ********************************************************

  Este projeto realiza a leitura do canal anal�gico AN0 atrav�s do ADC. O valor 
  lido � armazenado na vari�vel Valor_ADC do tipo float, a qual � convertida em
  uma string e armazenada no vetor de char Tensao[]. Por fim a string armazenada
  em Tensao[] � escrita no display LCD.

*******************************************************************************/


#define TRUE 1

/*******************************************************************************
 Vari�veis Globais
*******************************************************************************/
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

void main() {
    float Valor_ADC = 0;
    unsigned char Tensao[10];

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
    Lcd_Out(1,1,"AN0: ");

    ADC_Init();

    while(TRUE)
    {
        Valor_ADC = ADC_Read(0); /* Chamada da rotina (fun��o) que l� uma entrada anal�gica - neste caso AN0 */
        //Valor_ADC = (float)ADC_Read(0) * (100.0/1023.0); /* Chamada da rotina (fun��o) que l� uma entrada anal�gica - neste caso AN0 */

        floatToStr(Valor_ADC, Tensao);

        Lcd_Out(1, 6, Tensao);
        Delay_ms(20);
    }
}