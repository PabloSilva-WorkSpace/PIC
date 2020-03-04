#include "displayLCD.h"

/*******************************************************************************
Descrição: Configura a inicialização do display LCD no modo 4-Bits ou 8-Bits.
*******************************************************************************/
void DisplayLCD_Init( void )
{
#ifdef LCD_8Bits
    LCD_DATA_PORT_TRIS = 0;   /* Configura o PORTB como saída */
    LCD_DATA_PORT_IO = 0;     /* Configura os pinos do PORTB em "Low Level", isto é, 0 */
    LCD_EN_TRIS = 0;
    LCD_EN_IO = 0;
    LCD_RS_TRIS = 0;
    LCD_RS_IO = 0;
    /* Commands to init display LCD */
    Delay_ms(40);
    DisplayLCD_Cmd(0x38);
    Delay_ms(15);
    DisplayLCD_Cmd(0x38);
    Delay_ms(15);
    DisplayLCD_Cmd(0x06);
    Delay_ms(1);
    DisplayLCD_Cmd(0x0E);
    Delay_ms(1);
    DisplayLCD_Cmd(0x01);
    Delay_ms(1);
    //Em breve insirir os comandos
#endif

#ifdef LCD_4Bits
    LCD_DATA4_TRIS = 0;
    LCD_DATA4_IO   = 0;
    LCD_DATA5_TRIS = 0;
    LCD_DATA5_IO   = 0;
    LCD_DATA6_TRIS = 0;
    LCD_DATA6_IO   = 0;
    LCD_DATA7_TRIS = 0;
    LCD_DATA7_IO   = 0;
    LCD_EN_TRIS    = 0;
    LCD_EN_IO      = 0;
    LCD_RS_TRIS    = 0;
    LCD_RS_IO      = 0;
    /* Commands to init display LCD - Inicialização no modo 4-Bits*/
    Delay_ms(100);   //Tempo necessário para inicialização do LCD após power-on
    /* Envia 3 vezes o comando 0x03 */
    LCD_DATA4_IO = 1;
    LCD_DATA5_IO = 1;
    LCD_Enable();   /* 1º Clock */
    LCD_Enable();   /* 2º Clock */
    LCD_Enable();   /* 3º Clock */
    Delay_ms(1);
    /* Envia 2 vezes o comando 0x02 */
    LCD_DATA4_IO = 0;
    LCD_DATA5_IO = 1;
    LCD_Enable();   /* 1º Clock */
    LCD_Enable();   /* 2º Clock */
    /* Envia 2 vezes o comando 0x02 */
    DisplayLCD_Cmd(0x28);  // 2 linhas 7x5 em modo 4-Bits
    DisplayLCD_Cmd(0x0C);  // Display aceso sem cursor
    DisplayLCD_Cmd(0x06);  // Escreve deslocando o cursor para a direita
    DisplayLCD_Cmd(0x01);  // Limpa display e retorna o cursor para o inicio
#endif
}


/*******************************************************************************
Descrição: Executa um clock no display LCD
*******************************************************************************/
void LCD_Enable( void )
{
    Delay_us(40);
    LCD_EN_IO = 1;
    Delay_us(40);
    LCD_EN_IO = 0;
    Delay_us(40);
}


void DisplayLCD_Cmd( unsigned int Cmd )
{
    LCD_Write_Data(0, Cmd);   //RS = 0: Comando a ser processado
}


void LCD_Write_Data( unsigned char RS, unsigned char Data )
{
    LCD_RS_IO = RS;
#ifdef LCD_4Bits
    Delay_ms(2);
    LCD_DATA4_IO = ((Data & 0x10) == 0x10);
    LCD_DATA5_IO = ((Data & 0x20) == 0x20);
    LCD_DATA6_IO = ((Data & 0x40) == 0x40);
    LCD_DATA7_IO = ((Data & 0x80) == 0x80);
    
    LCD_Enable(void);     //Executa um clock no LCD
    
    Data = Data << 4;     //Rotaciona o nibble LSB para a posição do nibble MSB
    LCD_DATA4_IO = ((Data & 0x10) == 0x10);
    LCD_DATA5_IO = ((Data & 0x20) == 0x20);
    LCD_DATA6_IO = ((Data & 0x40) == 0x40);
    LCD_DATA7_IO = ((Data & 0x80) == 0x80);
    
    LCD_Enable(void);     //Executa um clock no LCD
#endif
#ifdef LCD_8Bits
    LCD_DATA_PORT_IO = Data;
    LCD_Enable(void);
#endif
}


void DisplayLCD_Print(unsigned char linha, unsigned char coluna, unsigned char * pStr)
{
    LCD_RS_IO = 0;   //Primeiramente é necessário escrever o comando (RS = 0) que permite posicionar o cursor na coordenada (X, Y) desejada
    switch(linha)
    {
        case 1:{
            coluna = coluna + 0x7F;         //O endereço referente a posição (linha, coluna) = (1, 1) é 0x80
            LCD_Write_Data(0, coluna);      //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
            break;
        }
        case 2:{
             coluna = coluna + 0xBF;        //O endereço referente a posição (linha, coluna) = (2, 1) é 0xC0
             LCD_Write_Data(0, coluna);     //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
             break;
        }
    }
    DisplayLCD_Print_CP(pStr);              //Escreve no LCD
}


void DisplayLCD_Print_CP(unsigned char * pStr)
{
    while(*pStr)   //Loop até encontrar o caractere NULL (ZERO)
    {
        LCD_Write_Data(1, *pStr);    //RS = 0 corresponde a escrever dado no LCD
        ++pStr;
    }
}


void DisplayLCD_Char( unsigned char linha, unsigned char coluna, unsigned char Tchar )
{
    LCD_RS_IO = 0;   //Primeiramente é necessário escrever o comando (RS = 0) que permite posicionar o cursor na coordenada (X, Y) desejada
    switch(linha)
    {
        case 1:{
            coluna = coluna + 0x7F;         //O endereço referente a posição (linha, coluna) = (1, 1) é 0x80
            LCD_Write_Data(0, coluna);      //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
            break;
        }
        case 2:{
             coluna = coluna + 0xBF;        //O endereço referente a posição (linha, coluna) = (2, 1) é 0xC0
             LCD_Write_Data(0, coluna);     //Chamada da função LCD_Write_Data para escrever o comando que posiciona o cursor na posição "coluna"
             break;
        }
    }
    DisplayLCD_Char_CP(Tchar);              //Escreve no LCD
}


void DisplayLCD_Char_CP( unsigned char Tchar )
{
    LCD_Write_Data(1, Tchar);   //RS = 1: Dado a ser escritio
}


/*******************************************************************************
Interessante:

'A' = 65
"A" = 'A' + '\0' ou 'A' + 0   -> O '\0' (ou 0) é o caractere NULL e informa o 
                                 fim da cadeia de caracteres

*******************************************************************************/