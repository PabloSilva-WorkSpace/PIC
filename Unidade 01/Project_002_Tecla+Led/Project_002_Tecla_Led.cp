#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_002_Tecla+Led/Project_002_Tecla_Led.c"
#line 7 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_002_Tecla+Led/Project_002_Tecla_Led.c"
void main(){




 ADCON1 |= 0X0F;



 TRISB.RB0 = 1;
 PORTB.RB0 = 1;


 TRISD.RD0 = 0;
 PORTD.RD0 = 0;

 while(1)
 {
 if(PORTB.RB0 == 0)
 {
 PORTD.RD0 = ~LATD.RD0;
 Delay_ms(300);
 }
 }
}
