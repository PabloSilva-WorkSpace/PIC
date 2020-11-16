//AN0/RA0 -> TRIMPOT -> LÊR O TRIMPOT
//TENSÃO DE REFERENCIA INTERNA DO ADC  -> 0V a 3.3V
 // CONFIGURA OS PINOS DO LCD
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

void main() {
  unsigned int Leitura_ADC;
  unsigned char Texto[10];
  
#ifdef P18F45K22
  ANSELA.B0 = 1;        //Somente RA0/AN0 como ADC
  ANSELB = 0;           //PortB como I/O digital
#endif
  
  TRISA.RA0 = 1;        //Entrada pois estamos usando AN0
  PORTA.RA0 = 1;        //Opcional
  
  ADCON0 = 0B00000001;  //AN0 -> AD ligado
  ADCON1 = 0B00001110;  //AN0/RA0 config. como AD, tensão de referencia interna do ADC.
  ADCON2 = 0B10101010;  //justificativa para direita, Fosc/32, 12Tad
  
  Lcd_Init();                        //Inicializa display no modo 4 bits
  Lcd_Cmd(_LCD_CLEAR);               //Apaga display
  Lcd_Cmd(_LCD_CURSOR_OFF);          //Desliga cursor
  Lcd_Out(1,1,"ADC: ");              //Linha x Coluna
    
  while(1)
   {
     ADCON0.GO_DONE = 1;           //Start na conversão do ADC
     while(ADCON0.GO_DONE == 1);   //Aguardar o término da conversão
     //Leitura_ADC = ADRESH + ADRESL;//0 a 1023
     
    Leitura_ADC = ((ADRESH << 8) | (int)ADRESL);  //0 a 1023 pois ADC é 10bits
    /*
     ADRESH = 0B11011100;
     (ADRESH << 8) =>  11011100 00000000
                      |         00011101  (NÃO)
                    
                    //CONVERTER  PARA O MESMO TAMANHO
                      11011100 00000000
                    | 00000000 00011101  (SIM)
    leitura_ADC =  <- 11011100 00011101
                      
    */
    WordToStr(Leitura_ADC, Texto);
    LCD_Out(1,5, Texto);
    Delay_ms(20);
   
   }

}

