#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_007_FuncaoButton/Project_007_FuncaoButton.c"
#line 9 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_007_FuncaoButton/Project_007_FuncaoButton.c"
void main() {







 INTCON2.RBPU = 0;
 ADCON1 |= 0x0F;




 TRISB.RB0 = 1;

 TRISD = 0;
 PORTD = 0;


 while( 1 ){
 if(Button(&PORTB, 0, 50, 0)){
 PORTD ^= 0xFF;
 Delay_ms(300);
 }
 }
}
