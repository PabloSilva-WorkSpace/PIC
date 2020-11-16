/**********************************************************************************************************
  # Projeto: Pisca-pisca com o TIMER0
***********************************************************************************************************
  # PORTD.RD0 -> Configurar como sa�da e conectar ao led
***********************************************************************************************************
  # CicloM�quina = Fosc/4 = 8MHz/4 = 2MHz -> Per�odo = 1/2MHz = 0.5us
***********************************************************************************************************
  # TempoEstouro = Per�odo_CicloM�quina * Prescaler * (Modo_8_16bits - CargaInicial)

  Portanto para 1 segundo (1s = 1.000.000us), teremos:

    1.000.000us = 0.5us * 128 * (65536 - X)
    1.000.000us / (0.5us * 128) = 65536 - X
    15625 = 65536 - X
    X = 49911 (0xC2F7) Carga Inicial

  TMR0L = 0xF7;
  TMR0H = 0xC2;

**********************************************************************************************************
  # Dica: C�lculo de tempo m�ximo para Periodo_CicloM�quina = 0.5us

  TempoM�ximo = 0.5us * 256 * (65536 - 0) = 8.388.608us, ouseja, aproximadamente 8.4s

**********************************************************************************************************
  # Configura��o do registrador T0CON

  T0CON = 0B00000110;
**********************************************************************************************************/

void Flasher(void);

void ConfigMCU()
{
#ifdef P18F45K22
    ANSELD = 0;
#else
    ADCON1 |= 0x0F;
#endif
    TRISD = 0;   /* Configura��o do PORTD como sa�da */
    PORTD = 0;   /* Desliga (OFF) as sa�das do PORTD */
}


void ConfigTIMER()
{
    T0CON = 0B00000110;  /* Configura��o do TIMER0: {Modo = Timer; Prescaler = 1:128; Modo = 16 bits} */
    TMR0L = 0xF7;        /* Configura��o da carga inicial - Byte menos significativo */
    TMR0H = 0xC2;        /* Configura��o da carga inicial - Byte mais significativo  */
    INTCON.TMR0IF = 0;   /* Reset o bit (flag) de overflow, ou estouro, do TIMER0    */
    T0CON.TMR0ON = 1;    /* Liga o TIMER0 */
}


void main()
{
    unsigned int i = 0;

    ConfigMCU();
    ConfigTIMER();

    while(1)
    {
        if(INTCON.TMR0IF == 1)   /* Monitora o flag de overflow do TIMER0 */
        {
            /* Recarregar TIMER0 novamente para 1 segundo */
            TMR0L = 0xF7;        /* Configura��o da carga inicial - Byte menos significativo */
            TMR0H = 0xC2;        /* Configura��o da carga inicial - Byte mais significativo  */
            INTCON.TMR0IF = 0;   /* Reset o bit (flag) de overflow, ou estouro, do TIMER0    */
            
            i++;
            if(i >= 5){
                Flasher();
                i = 0;
            }
        }
    }
}


void Flasher(void)
{
    PORTD.RD0 = ~ LATD.RD0;   /* Toggle - Inverte o estado logico do led conectado a sa�da PORTD.RD0 */
}