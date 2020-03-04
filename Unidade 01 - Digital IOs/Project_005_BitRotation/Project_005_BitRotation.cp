#line 1 "C:/Users/silva93/Desktop/Github/PIC/Unidade 01/Project_005_BitRotation/Project_005_BitRotation.c"




void main() {

 unsigned char ucByte1 = 0B00000001;
 unsigned char ucByte2 = 0B10000000;




 ADCON1 = 0;



 TRISD = 0;
 PORTD = 0;

 while(1){
 PORTD = (ucByte1 | ucByte2);
 ucByte1 <<= 1;
 ucByte2 >>= 1;

 if(ucByte1 == 0){
 ucByte1 = 1;
 }
 if(ucByte2 == 0){
 ucByte2 = 128;
 }
 Delay_ms(100);
 }
}
