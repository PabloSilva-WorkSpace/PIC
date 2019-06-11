/*************************************************
Definições:
          RB0 -> Tecla
          RD0 -> Led
*************************************************/

void main(){
//Variaveis locais
unsigned char flagAux = 0;

#ifdef P18F45K22
   ANSELB = 0;  //Configura todos os pinos do PORTB como digitais
   ANSELD = 0;  //Configura todos os pinos do PORTB como digitais
#else
    ADCON1 |= 0X0F; //Configura todos os pinos ADC como digital (ex: PIC18F4520)
#endif

    //Tecla
    TRISB.RB0 = 1; //Configura o pino RB0 como entrada
    PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC já coloca nível 1 em PORTx.Rx0

    //Led
    TRISD.RD0 = 0; //Configura o pino RD0 como saída
    PORTD.RD0 = 0; //Led off

    while(1)
    {
        if(PORTB.RB0 == 0 && flagAux == 0) //Tecla esta sendo acionada em nível 0 (zero)
        {
            PORTD.RD0 = ~LATD.RD0; //Toogle (Inverte o estado lógico do led)
            flagAux = 1;
            Delay_ms(40); //Trata o debounce
        }
        if(PORTB.RB0 == 1 && flagAux == 1)
        {
            flagAux = 0;
            Delay_ms(40); //Trata o debounce
        }
    }
}