#include "C8051F340.h"

sfr16 ADC0 = 0xbd;

sbit MOT_DIR = P2^1;

unsigned int acel[2];

bit xy;

void setServoPos(unsigned int grados);
void setMotorSpeed(unsigned char velocidad, bit direccion);

void main(void)
{
    Init_Device();
    TR0 = 1;

    while (1) { }
}

void ADC_ISR(void) interrupt 10
{
    unsigned int grados;
    unsigned char velocidad;
    bit direccion;

    acel[xy] = ADC0;
    xy = !xy;

    if (xy)
    {
        AMX0P = 0x13;

    } else {
        AMX0P = 0x14;
    }

    // Servo
    grados = (acel[0] - 440) * (180 / 128);
    setServoPos(grados);

    // Motor
    if (acel[1] < 505)
    {
        velocidad = 505 - acel[1];
        direccion = 1;
    } else {
        velocidad = acel[1] - 505;
        direccion = 0;
    }

    velocidad = velocidad * 4;
    setMotorSpeed(velocidad, direccion);

    AD0INT = 0;
}

void setServoPos(unsigned int grados)
{
    unsigned int Talto;
    unsigned int Tbajo;

    Talto = 1200 + (grados * 80 / 18) * 10;
    Tbajo = 0xFFFF - Talto;

    PCA0CPL0 = Tbajo % 256;
    PCA0CPH0 = Tbajo / 256;
}

void setMotorSpeed(unsigned char velocidad, bit direccion)
{
    MOT_DIR = direccion;

    if (direccion)
    {
        PCA0CPH1 = velocidad;
    } else {
        PCA0CPH1 = 0xFF - velocidad;
    }

}

