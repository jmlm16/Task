#include "C8051F340.h"
#include "lcdalfanum340.h"

// Peripheral specific initialization functions,
// Called from the Init_Device() function
void PCA_Init()
{
    PCA0CN    = 0x40;
    PCA0MD    &= ~0x40;
    PCA0MD    = 0x00;
    PCA0CPM0  = 0x42;
    PCA0CPH0  = 0x80;
}

void Timer_Init()
{
    TCON      = 0x10;
    TMOD      = 0x02;
    TL0       = 0x0A;
    TH0       = 0x0A;
}

void Port_IO_Init()
{
    P3MDOUT   = 0xEE;
    P0SKIP    = 0xFF;
    P1SKIP    = 0xFF;
    P2SKIP    = 0xFF;
    P3SKIP    = 0x07;
    XBR1      = 0x41;
}

void Oscillator_Init()
{
    OSCICN    = 0x83;
}

// Initialization function for device,
// Call Init_Device() from your main program
void Init_Device(void)
{
    PCA_Init();
    Timer_Init();
    Port_IO_Init();
    Oscillator_Init();
}

sbit led1 = P3^1;
sbit led2 = P3^2;
sbit led3 = P3^3;
sbit bot1 = P2^5;
sbit bot2 = P2^6;
sbit bot3 = P2^7;

main()
{
    char hola[16] = {"texto1"};
    char hola2[16] = {"texto2"};
    char ind = 0;

    Init_Device();
    LCD_Init();
    LCD_DisplayString (1, 1, hola);
    LCD_DisplayString (2, 1, hola2);

    while (1)
    {
        if (bot1 == 0)
        {
            ind += 15;
            PCA0CPH0 = ind;
            while (bot1 == 0);
        }
        led2 = !bot2;
        led3 = !bot3;
    }
}

