
/*******************************************************************************
   Defines
*******************************************************************************/
/* Connections between uC and display LCD */
#define LCD_DATA4_TRIS   (TRISB.RB0)
#define LCD_DATA4_IO     (PORTB.RB0)
#define LCD_DATA5_TRIS   (TRISB.RB1)
#define LCD_DATA5_IO     (PORTB.RB1)
#define LCD_DATA6_TRIS   (TRISB.RB2)
#define LCD_DATA6_IO     (PORTB.RB2)
#define LCD_DATA7_TRIS   (TRISB.RB3)
#define LCD_DATA7_IO     (PORTB.RB3)
#define LCD_RS_TRIS      (TRISB.RB4)
#define LCD_RS_IO        (PORTB.RB4)
#define LCD_EN_TRIS      (TRISB.RB5)
#define LCD_EN_IO        (PORTB.RB5)
/* Commands to LCD controller (Datasheet) */
#define LCD_Clear        (0x01)
#define LCD_Shift_Left   (0x18)
#define LCD_Shift_Right  (0x1C)
#define LCD_Cursor_Off   (0x0C)
#define LCD_Cursor_Blink (0x0D)
#define LCD_Cursor_Alt   (0x0F)
#define LCD_Cursor_Home  (0x02)
/* Others */
#define LCD_DATA_PORT_IO   (PORTB)
#define LCD_DATA_PORT_TRIS (TRISB)
#define LCD_4Bits  // or #define LCD_8Bits


/*******************************************************************************
   Protótipos das funções
*******************************************************************************/
void DisplayLCD_Init( void );
void LCD_Enable( void );
void LCD_Write_Data( unsigned char, unsigned char );
void DisplayLCD_Cmd( unsigned int );
void DisplayLCD_Char( unsigned char, unsigned char, unsigned char );
void DisplayLCD_Char_CP( unsigned char );
void DisplayLCD_Print( unsigned char , unsigned char, unsigned char * );
void DisplayLCD_Print_CP( unsigned char * );
