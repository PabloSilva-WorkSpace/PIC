/***************************************
            *   'A'  = Caracter = 65
            *   "A"  = String = 'A' + '\0' = 65 00
            *   "AB" = String = 'A' + 'B' + '\0' = 65 66 00
****************************************/



/*******************************************************************************
 Protótipo de funções
*******************************************************************************/
void ConfigMCU();


#define TRUE 1
#define TECLA_DW PORTB.RB0
#define TECLA_UP PORTB.RB1


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


void ConfigMCU()
{
#ifdef P18F45K22
    ANSELB = 0;
#else
    ADCON1 |= 0x0F;
#endif
/* Configuração das teclas u */
    TRISB.RB0 = 1; /* Configura o pino RB0 como entrada - tecla down */
    TRISB.RB1 = 1; /* Configura o pino RB1 como entrada - tecla up */
}


void main()
{
    //unsigned int uiContador = 0;     /* 0 a 65535 => logo serão necessário 5 + 1 caracteres: {faixa de valores, NULL} */
    signed int uiContador = 0;     /* serão necessários 7 caracteres: {sinal, faixa de valores, NULL} */
    unsigned char ucTexto[7];

    ConfigMCU();                     /* Inicializa MCU */
    Lcd_Init();                      /* Inicializa o Display no modo 4-Bits*/
    Lcd_Cmd(_LCD_CLEAR);             /* Apaga display */
    Lcd_Cmd(_LCD_CURSOR_OFF);        /* Desliga cursor */
    Lcd_Out(1,1,"Valor: ");          /* Linha x Coluna*/

    while(TRUE){

        if(TECLA_UP == 0){
            uiContador++;   /* Exemplo: 1234 */
            //WordToStr(uiContador, ucTexto);    /* Exemplo: "1234" + '\0' (NULL)  */   /* Use esta função de conversão se uiContador for declarada como unsigned int */
            IntToStr(uiContador, ucTexto);   /* Use esta função de conversão se uiContador for declarada como signed int */
            //Texto[0] = ' '
            //Texto[1] = '1'
            //Texto[2] = '2'
            //Texto[3] = '3'
            //Texto[4] = '4'
            //Texto[5] = '\0' = 0
            Lcd_Out(1, 8, ucTexto);
            /*******************************************************************
            void Lcd_Out(char Linha, char Coluna, char * Text)
            {
                ...
                while(*Text != 0)
                {
                    LCD_Chr_Cp(*Text);
                    Text++;
                }
            }
            *******************************************************************/
            Delay_ms(300);
        }
        if(TECLA_DW == 0){
            uiContador--;
            //WordToStr(uiContador, ucTexto);   /* Use esta função de conversão se uiContador for declarada como unsigned int */
            IntToStr(uiContador, ucTexto);      /* Use esta função de conversão se uiContador for declarada como signed int */
            Lcd_Out(1, 8, ucTexto);
            Delay_ms(300);
        }
    };
}