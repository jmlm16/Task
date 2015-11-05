#include <hidef.h> /* for EnableInterrupts macro */
#include "derivative.h" /* include peripheral declarations */
#include "MCUinit.h"

#define LED0 PTCD_PTCD0
#define LED1 PTCD_PTCD1
#define LED2 PTCD_PTCD2
#define LED3 PTCD_PTCD3
#define LED4 PTCD_PTCD4
#define LED5 PTCD_PTCD5

#define LED6 PTED_PTED6
#define LED7 PTED_PTED7

#define BTN PTDD_PTDD3
int readADC(int ch);
void ejeX(int ac);
void ledsoff();

void main(void)
{
    int i;
    int samples[] = {0, 0, 0};
    const int adch[] = {0x01, 0x08, 0x09};

    EnableInterrupts; /* enable interrupts */
    /* include your code here */
    MCU_init();

    /* loop forever */
    for (;;) {
        for (i = 0; i < 3; i++) {
            samples[i] = readADC(adch[i]);
        }

        ejeX(samples[0]);

        __RESET_WATCHDOG(); /* feeds the dog */
    }
    /* please make sure that you never leave main */
}

int readADC(int ch)
{
    int adc;
    ADCSC1 = ch;

    while (!ADCSC1_COCO);
    adc = ADCR;
    return adc;
}

void ledsoff()
{

    LED0 = 1;
    LED1 = 1;
    LED2 = 1;
    LED3 = 1;
    LED4 = 1;
    LED5 = 1;
    LED6 = 1;
    LED7 = 1;
}

void ejeX(int ac)
{
    int nled = (ac - 64) / 16;

    ledsoff();
    switch (7 - nled) {
        case 0:
            LED0 = 0;
            break;

        case 1:
            LED1 = 0;
            break;

        case 2:
            LED2 = 0;
            break;

        case 3:
            LED3 = 0;
            break;

        case 4:
            LED4 = 0;
            break;

        case 5:
            LED5 = 0;
            break;

        case 6:
            LED6 = 0;
            break;

        case 7:
            LED7 = 0;
            break;
    }
}

