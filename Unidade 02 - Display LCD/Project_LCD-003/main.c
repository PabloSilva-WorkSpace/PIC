
/*******************************************************************************
 Protótipo de funções
*******************************************************************************/
void ConfigMCU();


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


const char character1[] = {31,17,16,16,17,31,2,14};   /*Este vetor representa o caractere especial a ser criado: Ç */
const char character2[] = {31,21,21,31,27,31,17,31};  /*Este vetor representa o caractere especial a ser criado: "Smile" */


void CustomChar1(char pos_row, char pos_char)
{
    char i;
    Lcd_Cmd(64);   /* Este comando posiciona o cursor virtual no endereço 64 (0x40) - Primeiro caractere da CGRAM */
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);   /* Este comando transfere o caractere customizado na posição '0' da CGRAM para a posição (pos_row, pos_char) do visor - DDRAM */
}


void CustomChar2(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(72);   /* Este comando posiciona o cursor virtual no endereço 72 (0x48) - Segundo caractere da CGRAM */
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 1);   /* Este comando transfere o caractere customizado na posição '1' da CGRAM para a posição (pos_row, pos_char) do visor  - DDRAM */
}


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
    unsigned char ucX;

    ConfigMCU();                     /* Inicializa MCU */
    Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
    Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
    Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
    Lcd_Out(1,1,"Primeira Linha");   /* Linha x Coluna*/
    Lcd_Out(2,1,"Ma a!");

    /* Deslocar a mensagem no visor para a direita */
    for(ucX = 0; ucX <= 15; ++ucX){
        Delay_ms(500);
        LCD_Cmd(_LCD_SHIFT_RIGHT);
    }
    
    /* Deslocar a mensagem no visor para a esquerda */
    for(ucX = 0; ucX <= 15; ++ucX){
        Delay_ms(500);
        LCD_Cmd(_LCD_SHIFT_LEFT);
    }

    /* Escrever o primeiro caractere especial (customizado) no visor */
    CustomChar1(2, 3);

    /* Escrever o segundo caractere especial (customizado) no visor */
    CustomChar2(2, 7);
    
    while(1){
        //do nothing
    };
}





