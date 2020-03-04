/*************************************************
Defini��es:
          RB0 -> Tecla
          PORTD -> Leds
*************************************************/

#define TRUE 1

void main() {
//Diretivas de pr�-compila��o = Instru��es para o compilador
    #ifdef P18F45K22
        ANSELD = 0;  //Configura o PORTD como digital - ser� usado com o Led
        ANSELB = 0;  //Configura o PORTB como digital - ser� usado com a tecla
        INTCON2.RBPU = 0;  //Habilita a chave global dos resistores de pull-up (INTCON2.RBPU) presente no PORTB
        WBPU = 1;  //Habilita o resistor de pull-up interno no pino RB0
    #else
        INTCON2.RBPU = 0;  //Habilita a chave global dos resistores de pull-up presente no PORTB
        ADCON1 |= 0x0F;  //Configura todos os pinos compartilhados, ou multiplexados, como digital
    #endif

//Configura��es
    //Configura��es do PORTB
    TRISB.RB0 = 1; //Configura o pino 0 do PORTB como entrada
    //Configura��es do PORTD
    TRISD = 0; //Configura o PORTD como sa�da
    PORTD = 0; //Estabelece n�vel zero na sa�da do PORTD (todos os pino do PORT) - Para os leds iniciarem apagados

//Loop principal (Polling)
    while(TRUE){
        if(Button(&PORTB, 0, 50, 0)){
            PORTD ^= 0xFF;
            Delay_ms(300);
        }
    }
}