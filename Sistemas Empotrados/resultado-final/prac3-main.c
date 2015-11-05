//-----------------------------------------------------------------------------
// Includes
//-----------------------------------------------------------------------------

#include "c8051f3xx.h"
#include "F3xx_USB0_InterruptServiceRoutine.h"
#include "F3xx_USB0_Mouse.h"
#include "F3xx_USB0_Register.h"

/////////////////////////////////////
//  Generated Initialization File  //
/////////////////////////////////////

//#include "C8051F340.h"

// Peripheral specific initialization functions,
// Called from the Init_Device() function
void PCA_Init()
{
    PCA0MD    &= ~0x40;
    PCA0MD    = 0x00;
}

void Timer_Init()
{
    TMR2CN    = 0x04;
    TMR2RLH   = 0xF0;
}

void ADC_Init()
{
    AMX0P     = 0x14;
    AMX0N     = 0x1F;
    ADC0CF    = 0xFC;
    ADC0CN    = 0x82;
}

void Port_IO_Init()
{
    P1MDIN    = 0xF9;
    P3MDOUT   = 0xEE;
    P1SKIP    = 0x06;
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

void Interrupts_Init()
{
    EIE1      = 0x08;
    IE        = 0x80;
}

// Initialization function for device,
// Call Init_Device() from your main program
void Init_Device(void)
{
    PCA_Init();
    Timer_Init();
    ADC_Init();
    Port_IO_Init();
    Oscillator_Init();
    Interrupts_Init();
}

void USB0_Init (void)
{

   POLL_WRITE_BYTE (POWER, 0x08);      // Force Asynchronous USB Reset
   POLL_WRITE_BYTE (IN1IE, 0x07);      // Enable Endpoint 0-1 in interrupts
   POLL_WRITE_BYTE (OUT1IE,0x07);      // Enable Endpoint 0-1 out interrupts
   POLL_WRITE_BYTE (CMIE, 0x07);       // Enable Reset, Resume, and Suspend
                                       // interrupts
   USB0XCN = 0xE0;                     // Enable transceiver; select full speed
   POLL_WRITE_BYTE (CLKREC,0x80);      // Enable clock recovery, single-step
                                       // mode disabled

   EIE1 |= 0x02;                       // Enable USB0 Interrupts

                                       // Enable USB0 by clearing the USB
   POLL_WRITE_BYTE (POWER, 0x01);      // Inhibit Bit and enable suspend
                                       // detection
}

//-----------------------------------------------------------------------------
// Main Routine
//-----------------------------------------------------------------------------
char IN_PACKET[4];

void main(void)
{

   Init_Device ();
   USB0_Init ();

   EA = 1;
   while (1)
   {
      SendPacket (0);
   }
}


void miadc(void) interrupt 10
{
	AD0INT = 0;
	IN_PACKET[1] = ADC0H;
	IN_PACKET[1] = (char) (IN_PACKET[1]-128);
}
