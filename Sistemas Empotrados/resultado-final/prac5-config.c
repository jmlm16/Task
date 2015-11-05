/////////////////////////////////////
//  Generated Initialization File  //
/////////////////////////////////////

#include "C8051F340.h"

// Peripheral specific initialization functions,
// Called from the Init_Device() function
void PCA_Init()
{
    PCA0MD    &= ~0x40;
    PCA0MD    = 0x04;
    PCA0CPL4  = 0x3C;
    PCA0MD    |= 0x40;
}

void Timer_Init()
{
    TMOD      = 0x02;
    CKCON     = 0x02;
}

void UART_Init()
{
    SBRLL1    = 0x3C;
    SBRLH1    = 0xF6;
    SCON1     = 0x10;
    SBCON1    = 0x43;
}

void Port_IO_Init()
{
    P2MDOUT   = 0x01;
    P3MDOUT   = 0xEE;
    P0SKIP    = 0xFF;
    P1SKIP    = 0xFF;
    XBR1      = 0x40;
    XBR2      = 0x01;
}

void Oscillator_Init()
{
    int i = 0;
    CLKMUL    = 0x80;
    for (i = 0; i < 20; i++);    // Wait 5us for initialization
    CLKMUL    |= 0xC0;
    while ((CLKMUL & 0x20) == 0);
    CLKSEL    = 0x03;
    OSCICN    = 0x83;
}

// Initialization function for device,
// Call Init_Device() from your main program
void Init_Device(void)
{
    PCA_Init();
    Timer_Init();
    UART_Init();
    Port_IO_Init();
    Oscillator_Init();
}
