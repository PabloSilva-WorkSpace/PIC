



void main() {
    //Variáveis Locais
    unsigned char ucByte1 = 0B00000001;  //Equivalente a: unsigned char ucByte1 = 1;
    unsigned char ucByte2 = 0B10000000;  //Equivalente a: unsigned char ucByte1 = 128;

    #ifdef P18F45K22
        ANSELD = 0;
    #else
        ADCON1 = 0;
    #endif

    //Configurações do PORTD
    TRISD = 0;    //Define o PORTD como saída
    PORTD = 0;    //Defini nivel zero nas saídas do PORTD

    while(1){
        PORTD = (ucByte1 | ucByte2);
        ucByte1 <<= 1;    //Desloca (shift) os bits de ucByte1 1 posição para a esquerda
        ucByte2 >>= 1;    //Desloca (shift) os bits de ucByte2 1 posição para a direita
        //Reset values
        if(ucByte1 == 0){
            ucByte1 = 1;
        }
        if(ucByte2 == 0){
            ucByte2 = 128;
        }
        Delay_ms(100);
    }
}