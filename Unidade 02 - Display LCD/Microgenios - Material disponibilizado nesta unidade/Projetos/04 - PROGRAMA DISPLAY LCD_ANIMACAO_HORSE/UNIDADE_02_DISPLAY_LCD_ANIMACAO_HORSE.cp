#line 1 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/04 - PROGRAMA DISPLAY LCD_ANIMACAO_HORSE/UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c"
#line 57 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/04 - PROGRAMA DISPLAY LCD_ANIMACAO_HORSE/UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c"
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

const char character1A[] ={ 0, 0, 0, 0, 3, 7, 14, 14,
 32 , 32 , 32 , 32 , 15 , 31 , 31 , 31,
 32 , 32 , 32 , 32 , 3 , 31 , 31 , 31,
 32 , 1 , 31 , 31 , 31 , 27 , 19 , 16,
 12 , 24 , 16 , 1 , 1 , 1 , 32 , 32,
 31 , 31 , 30 , 23 , 32 , 32 , 16 , 32,
 31 , 31 , 3 , 2 , 18 , 2 , 1 , 32,
 28 , 28 , 4 , 4 , 8 , 32 , 32 , 32};

const char character2A[] = {0,0,0,0,0,7,15,30,
 32 , 32 , 32 , 32 , 14 , 31 , 31 , 31,
 32 , 32 , 32 , 32 , 7 , 31 , 31 , 31,
 32 , 2 , 31 , 31 , 31 , 27 , 19 , 16,
 16 , 32 , 32 , 1 , 1 , 1 , 32 , 32,
 31 , 31 , 27 , 18 , 1 , 1 , 17 , 32,
 31 , 31 , 1 , 1 , 1 , 1 , 32 , 32,
 24 , 28 , 4 , 8 , 16 , 32 , 16 , 32};

const char character3A[] = {0 , 0,0,7,15,30,28,24,
 32 , 32 , 32 , 15 , 31 , 31 , 31 , 31,
 32 , 32 , 32 , 3 , 31 , 31 , 31 , 31,
 1 , 31 , 31 , 31 , 27 , 27 , 16 , 16,
 19 , 19 , 2 , 2 , 4 , 32 , 32 , 32,
 31 , 7 , 14 , 6 , 1 , 32 , 32 , 32,
 15 , 7 , 19 , 15 , 32 , 16 , 32 , 32,
 16 , 24 , 12 , 4 , 2 , 1 , 32 , 32};


void SpecialChar(char frame) {
 char i;

 switch(frame)
 {
 case 1: {
 Lcd_Cmd(0X40);
 for (i = 0; i<64; i++){Lcd_Chr_CP(character1A[i]);}
 for(i = 0; i < 8; i++)
 {
 if(i < 4) Lcd_Chr_Cp(i);
 else Lcd_Chr(2, (1 + i-4), i);
 }
 break;
 }

 case 2: {
 Lcd_Cmd(0X40);
 for (i = 0; i<64; i++){Lcd_Chr_CP(character2A[i]);}
 for(i = 0; i < 8; i++)
 {
 if(i < 4) Lcd_Chr(1, 1 + i,i);
 else Lcd_Chr(2, (1 + i-4), i);
 }
 break;
 }

 case 3: {
 Lcd_Cmd(0X40);
 for (i = 0; i<64; i++){Lcd_Chr_CP(character3A[i]);}
 for(i = 0; i < 8; i++)
 {
 if(i < 4) Lcd_Chr(1, 1 + i,i);
 else Lcd_Chr(2, (1 + i-4), i);
 }
 break;
 }

 }
}



void ConfigMCU()
{

 ANSELB = 0;
#line 152 "C:/Users/Microgenios/Desktop/UNIDADE_02_DISPLAY_LCD_PROJETOS/04 - PROGRAMA DISPLAY LCD_ANIMACAO_HORSE/UNIDADE_02_DISPLAY_LCD_ANIMACAO_HORSE.c"
}
void main(){
 unsigned char ucX;
 ConfigMCU();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"");
 Lcd_Out(2,1,"");


 while( 1 )
 {

 for(ucX = 0; ucX < 9; ucX++)
 {
 SpecialChar( 1 );
 LCD_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(300);

 SpecialChar( 2 );
 LCD_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(300);

 SpecialChar( 3 );
 LCD_Cmd(_LCD_SHIFT_RIGHT);
 Delay_ms(300);
 }

 for(ucX = 0; ucX < 13; ucX++)LCD_Cmd(_LCD_SHIFT_RIGHT);
 }
}
