
/*******************************************************************************
   Defines
*******************************************************************************/
/* Connections between uC and display LCD */
#define LCD_DATA4_TRIS   (TRISD.RD4)
#define LCD_DATA4_IO     (PORTD.RD4)
#define LCD_DATA5_TRIS   (TRISD.RD5)
#define LCD_DATA5_IO     (PORTD.RD5)
#define LCD_DATA6_TRIS   (TRISD.RD6)
#define LCD_DATA6_IO     (PORTD.RD6)
#define LCD_DATA7_TRIS   (TRISD.RD7)
#define LCD_DATA7_IO     (PORTD.RD7)
#define LCD_RS_TRIS      (TRISE.RE2)
#define LCD_RS_IO        (PORTE.RE2)
#define LCD_EN_TRIS      (TRISE.RE1)
#define LCD_EN_IO        (PORTE.RE1)
/* Commands to LCD controller (Datasheet) */
#define LCD_Clear        (0x01)
#define LCD_Shift_Left   (0x18)
#define LCD_Shift_Right  (0x1C)
#define LCD_Cursor_Off   (0x0C)
#define LCD_Cursor_Blink (0x0D)
#define LCD_Cursor_Alt   (0x0F)
#define LCD_Cursor_Home  (0x02)
/* Others */
#define LCD_DATA_PORT_TRIS (TRISD)
#define LCD_DATA_PORT_IO   (PORTD)
#define LCD_4Bits  // or #define LCD_8Bits


/*******************************************************************************
   Protótipos das funções
*******************************************************************************/
void DisplayLCD_Init( void );
void LCD_Enable( void );
void LCD_Write_Data( unsigned char, unsigned char );
void DisplayLCD_Cmd( unsigned char );
void DisplayLCD_Char( unsigned char, unsigned char, unsigned char );
void DisplayLCD_Char_CP( unsigned char );
void DisplayLCD_Print( unsigned char , unsigned char, unsigned char * );
void DisplayLCD_Print_CP( unsigned char * );