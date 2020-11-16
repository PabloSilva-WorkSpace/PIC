#line 1 "C:/Users/pablo/Desktop/Github/PIC/Unidade 04 - Timer-Counter/Project_Timer-001/main.c"
#line 32 "C:/Users/pablo/Desktop/Github/PIC/Unidade 04 - Timer-Counter/Project_Timer-001/main.c"
void ConfigMCU()
{



 ADCON1 |= 0x0F;

 TRISD = 0;
 PORTD = 0;
}


void ConfigTIMER()
{
 T0CON = 0B00000110;
 TMR0L = 0xF7;
 TMR0H = 0xC2;
 INTCON.TMR0IF = 0;
 T0CON.TMR0ON = 1;
}


void main()
{
 ConfigMCU();
 ConfigTIMER();

 while(1)
 {
 if(INTCON.TMR0IF == 1)
 {
 PORTD.RD0 = ~ LATD.RD0;

 TMR0L = 0xF7;
 TMR0H = 0xC2;
 INTCON.TMR0IF = 0;
 }
 }
}
