#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_001_PiscaPisca/Project_001_PiscaPisca.c"
#line 6 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_001_PiscaPisca/Project_001_PiscaPisca.c"
void main(){




 ADCON1 |= 0X0F;



 TRISB.RB0 = 1;
 PORTB.RB0 = 1;


 TRISD.RD0 = 0;
 PORTD.RD0 = 0;

 while(1)
 {
 PORTD.RD0 = 1;
 Delay_ms(300);
 PORTD.RD0 = 0;
 Delay_ms(300);
 }
}
