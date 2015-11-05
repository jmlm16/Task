#include "C8051F340.h"

// Peripheral specific initialization functions,
// Called from the Init_Device() function
void PCA_Init()
{
    PCA0MD    &= ~0x40;
    PCA0MD    = 0x00;
}

void Timer_Init()
{
    TCON      = 0x40;
    TMOD      = 0x20;
    TH1       = 0x30;
}

void UART_Init()
{
    SCON0     = 0x10;
}

void ADC_Init()
{
    AMX0P     = 0x14;
    AMX0N     = 0x1F;
    ADC0CF    = 0x5C;
    ADC0CN    = 0x80;
}

void Port_IO_Init()
{
    P1MDIN    = 0xFB;
    P0MDOUT   = 0x10;
    P3MDOUT   = 0xEE;
    P1SKIP    = 0x04;
    XBR0      = 0x01;
    XBR1      = 0x40;
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
    ADC_Init();
    Port_IO_Init();
    Oscillator_Init();
}

main()
{
	Init_Device();

	while(1) {
		AD0BUSY = 1;
		while(AD0BUSY);
		SBUF0 = ADC0H;
		while(!TI0);
		TI0 = 0;
	}
}
