/*************************************************
Defini��es:
          RB0 -> Tecla
          RD0 -> Led
*************************************************/

//Prot�tipo de fun��es
void ManipulaLeds(unsigned char);

//Vari�veis globais
unsigned char ucContador = 0;

//Defini��o de fun��es
void ManipulaLeds(unsigned char i)
{
    switch(i){
        case 1:{PORTD.RD0 = 1; break;}
        case 2:{PORTD.RD1 = 1; break;}
        case 3:{PORTD.RD2 = 1; break;}
        default:{PORTD = 0; ucContador = 0; break;}
    }
}

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
    PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC j� coloca n�vel 1 em PORTx.Rx0; Por�m existe uma excess�o com rela��o ao PORTB, visto que esta porta � a �nica que, ao colocar TRISB = 1, internamente os resistores de PULL-UP s�o por default desligados.
    Delay_ms(1000);
    
    //Led
    TRISD = 0; //Configura o pino RD0 como sa�da
    PORTD = 0; //Leds off (Manipula todos os pinos do PORTD para zero)
    
    //Delay para iniciar o loop principal
    Delay_ms(50);
    
    while(1)
    {
        if(PORTB.RB0 == 0 && flagAux == 0) //Tecla esta sendo acionada em n�vel 0 (zero)
        {
            ManipulaLeds(++ucContador);
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