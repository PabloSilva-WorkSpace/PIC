#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_004_Tecla+Led+Contador/Project_004_Tecla_Led_Contador.c"
#line 8 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_004_Tecla+Led+Contador/Project_004_Tecla_Led_Contador.c"
void ManipulaLeds(unsigned char);


unsigned char ucContador = 0;


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

unsigned char flagAux = 0;





 ADCON1 |= 0X0F;



 TRISB.RB0 = 1;
 PORTB.RB0 = 1;
 Delay_ms(1000);


 TRISD = 0;
 PORTD = 0;


 Delay_ms(50);

 while(1)
 {
 if(PORTB.RB0 == 0 && flagAux == 0)
 {
 ManipulaLeds(++ucContador);
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
