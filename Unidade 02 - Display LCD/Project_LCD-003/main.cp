#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-003/main.c"
#line 5 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-003/main.c"
void ConfigMCU();
#line 12 "C:/Users/pablo/Desktop/Github/PIC/Unidade 02 - Display LCD/Project_LCD-003/main.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


const char character1[] = {31,17,16,16,17,31,2,14};
const char character2[] = {31,21,21,31,27,31,17,31};


void CustomChar1(char pos_row, char pos_char)
{
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}


void CustomChar2(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(72);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 1);
}


void ConfigMCU()
{



 ADCON1 |= 0x0F;

}


void main()
{
 unsigned char ucX;

 ConfigMCU();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Primeira Linha");
 Lcd_Out(2,1,"Ma a!");


 for(ucX = 0; ucX <= 15; ++ucX){
 Delay_ms(500);
 LCD_Cmd(_LCD_SHIFT_RIGHT);
 }


 for(ucX = 0; ucX <= 15; ++ucX){
 Delay_ms(500);
 LCD_Cmd(_LCD_SHIFT_LEFT);
 }


 CustomChar1(2, 3);


 CustomChar2(2, 7);

 while(1){

 };
}
