

/* Includes */
#include "displayLCD.h"


/*******************************************************************************
Descrição: Configura os periféricos do uControlador que controlam, ou manipulam,
o display LCD
*******************************************************************************/
void ConfigMCU()
{
#ifdef P18F45K22
    ANSELB = 0;        /* Configura o PortB como I/O digital */
#else
    ADCON1 |= 0x0F;    /* Configura o PortB como I/O digital (por exemplo, no PIC18F4520) */
#endif
}


void main() {
    ConfigMCU();
    
    DisplayLCD_Init();
    DisplayLCD_Cmd(LCD_Clear);
    DisplayLCD_Print(1, 1, "   LCD Display   ");
    DisplayLCD_Print(2, 1, "   4-bit mode");
    DisplayLCD_Char(2, 14, 'A');
    DisplayLCD_Char_CP('%');
    
    while(1);
}