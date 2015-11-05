#include <C8051F340.h>
#include "lcd.h"
#include "utils.h"

sbit LED1 = P3^3;
sbit LED2 = P3^2;
sbit LED3 = P3^1;


void Init_Device(void);
void sendString(char string[]);
void receiveString(char v[]);

void main(void)
{
    char v[16];
    Init_Device();
    LCD_Init();

    // Habilitar WDT
    PCA0CPH4 = 0;
    TR0 = 1;

    LED1 = 0;
    LED2 = 0;
    LED3 = 0;

    while (1) {
        // Limpiar el WDT
        PCA0CPH4 = 0;
        delayTx();
        sendString("Tere llama");
        receiveString(v);
        LCD_DisplayString (1, 1, v);
    }
}

void sendString(char string[])
{
    int i = 0;

    while (string[i] != 0) {
        SBUF1 = string[i];
        while ((SCON1 & 0x20) != 0x20);
        i++;
    }

    SBUF1 = 0x0d;
    while ((SCON1 & 0x20) != 0x20);
}

void receiveString(char v[])
{
    char i, rx_data = 0;

    while (rx_data != 0x0d) {
        while ((SCON1 & 0x01) != 0x01);
        rx_data = SBUF1;
        v[i] = rx_data;
        i++;
        SCON1 = SCON1 & (0xfe); // Limpiar RI1
    }
}


