#line 1 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/03 - PROGRAMA DISPLAY LCD_ROTACIONAMENTO/UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c"
#line 50 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/03 - PROGRAMA DISPLAY LCD_ROTACIONAMENTO/UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c"
sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D4 at LATB0_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D7 at LATB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


void ConfigMCU();





const char character1[] = {31,17,16,16,17,31,6,14};

void CustomChar1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(0X40);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

const char character2[] = {31,21,21,31,27,31,17,31};

void CustomChar2(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(0X48);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 1);
}

void ConfigMCU()
{

 ANSELB = 0;
#line 98 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/03 - PROGRAMA DISPLAY LCD_ROTACIONAMENTO/UNIDADE_02_DISPLAY_LCD_ROTACIONAMENTO.c"
}
void main(){
 unsigned char ucX;
 ConfigMCU();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"PRIMEIRA LINHA");
 Lcd_Out(2,1,"MA OCA");

 for(ucX = 0; ucX < 16; ++ucX)
 {
 LCD_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(500);
 }

 for(ucX = 0; ucX < 16; ++ucX)
 {
 LCD_Cmd(_LCD_SHIFT_LEFT);
 Delay_ms(500);
 }
 CustomChar1(2,3);
 CustomChar2(2,8);

 while( 1 );
}
