#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_006_Tecla+PullUp+Led/Project_006_Tecla_PullUp_Led.c"
#line 9 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_006_Tecla+PullUp+Led/Project_006_Tecla_PullUp_Led.c"
void main() {







 INTCON2.RBPU = 0;
 ADCON1 |= 0x0F;




 TRISB.RB0 = 1;

 TRISD = 0;
 PORTD = 0;


 while( 1 ){
 if(PORTB.RB0 == 0){
 PORTD.RD0 = ~LATD.RD0;
 Delay_ms(300);
 }
 }
}
