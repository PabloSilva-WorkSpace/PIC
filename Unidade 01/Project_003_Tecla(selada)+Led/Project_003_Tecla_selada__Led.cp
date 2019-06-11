#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_003_Tecla(selada)+Led/Project_003_Tecla_selada__Led.c"
#line 7 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_003_Tecla(selada)+Led/Project_003_Tecla_selada__Led.c"
void main(){

unsigned char flagAux = 0;





 ADCON1 |= 0X0F;



 TRISB.RB0 = 1;
 PORTB.RB0 = 1;


 TRISD.RD0 = 0;
 PORTD.RD0 = 0;

 while(1)
 {
 if(PORTB.RB0 == 0 && flagAux == 0)
 {
 PORTD.RD0 = ~LATD.RD0;
 flagAux = 1;
 Delay_ms(40);
 }
 if(PORTB.RB0 == 1 && flagAux == 1)
 {
 flagAux = 0;
 Delay_ms(40);
 }
 }
}
