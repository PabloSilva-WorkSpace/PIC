/*************************************************
Definições:
          RB0 -> Tecla
          RD0 -> Led
*************************************************/
void main(){
 #ifdef P18F45K22
    ANSELB = 0;  //Configura todos os pinos do PORTB como digitais
    ANSELD = 0;  //Configura todos os pinos do PORTB como digitais
 #else
     ADCON1 |= 0X0F; //Configurar todos os pinos ADC como digital (ex: PIC18F4520)
#endif

     //Tecla
     TRISB.RB0 = 1; //Configurar o pino RB0 como entrada
     PORTB.RB0 = 1; //Opcional, pois internamente ao colocar TRISB.RB0 = 1 o uC já coloca nível 1 em PORTx.Rx0
     
     //Led
     TRISD.RD0 = 0; //Configurar o pino RD0 como saída
     PORTD.RD0 = 0; //Led off
     
     while(1)
     {
             PORTD.RD0 = 1; //Liga o led
             Delay_ms(300); //Delay de 300ms
             PORTD.RD0 = 0; //Desliga o led
             Delay_ms(300); //Delay de 300ms
     }
}