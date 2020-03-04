/*************************************************
Defini��es:
          RB0 -> Tecla
          RD0 -> Led
*************************************************/

#define TRUE 1

void main() {
//Variaveis locais
unsigned char i = 0B00000000;
unsigned char auxFlagRB0 = 0;
unsigned char auxFlagRB1 = 0;

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
    TRISB.RB0 = 1; //Configura o pino 0 do PORTB como entrada - Contagem crescente
    TRISB.RB1 = 1; //Configura o pino 1 do PORTB como entrada - Contagem decrescente
    //Configura��es do PORTD
    TRISD = 0; //Configura o PORTD como sa�da
    PORTD = 0; //Estabelece n�vel zero na sa�da do PORTD (todos os pino do PORT) - Para os leds iniciarem apagados

//Loop principal (Polling)
    while(TRUE){
        //L�gica do bot�o no PORTD.RD0 - Contagem crescente
        if(PORTB.RB1 == 0 && auxFlagRB1 == 0){
            i = ~((~i) <<= 1);  //Equivale a sequencia de comandos: i = ~i; i <<= 1; i = ~i;
            PORTD = i;
            auxFlagRB1 = 1;
            Delay_ms(50);
        }
        if(PORTB.RB1 == 1 && auxFlagRB1 == 1){
            auxFlagRB1 = 0;
            Delay_ms(50);
        }
        
        //L�gica do bot�o no PORTD.RD0 - Contagem decrescente
        if(PORTB.RB0 == 0 && auxFlagRB0 == 0){
            i >>= 1;
            PORTD = i;
            auxFlagRB0 = 1;
            Delay_ms(50);
        }
        if(PORTB.RB0 == 1 && auxFlagRB0 == 1){
            auxFlagRB0 = 0;
            Delay_ms(50);
        }
    }
}