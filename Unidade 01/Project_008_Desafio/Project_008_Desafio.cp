#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_008_Desafio/Project_008_Desafio.c"
#line 9 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_008_Desafio/Project_008_Desafio.c"
void main() {

unsigned char i = 0B00000000;
unsigned char auxFlagRB0 = 0;
unsigned char auxFlagRB1 = 0;








 INTCON2.RBPU = 0;
 ADCON1 |= 0x0F;




 TRISB.RB0 = 1;
 TRISB.RB1 = 1;

 TRISD = 0;
 PORTD = 0;


 while( 1 ){

 if(PORTB.RB1 == 0 && auxFlagRB1 == 0){
 i = ~((~i) <<= 1);
 PORTD = i;
 auxFlagRB1 = 1;
 Delay_ms(50);
 }
 if(PORTB.RB1 == 1 && auxFlagRB1 == 1){
 auxFlagRB1 = 0;
 Delay_ms(50);
 }


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
