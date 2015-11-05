/*
make.c

make.c is the main project file.  The Run( ) task gets called on bootup, so
stick any initialization stuff in there.  In Heavy, by default we set the USB,
OSC, and Network systems active, but you don't need to if you aren't using
them.  Furthermore, only register the OSC subsystems you need - by default, we
register all of them.
*/

#include "config.h"

// include all the libraries we're using
#include "appled.h"
#include "dipswitch.h"
#include "servo.h"
#include "digitalout.h"
#include "digitalin.h"
#include "motor.h"
#include "pwmout.h"
#include "stepper.h"
#include "xbee.h"
#include "webserver.h"

void BlinkTask( void* parameters );
void pruebamidi(void* parametro);
void Run( ) // this task gets called as soon as we boot up.
{
    TaskCreate( BlinkTask, "Blink", 400, 0, 1 );
    TaskCreate(pruebamidi, "Prumidi", 1000, 0, 5);
    // Do this right quick after booting up - otherwise we won't be recognised
    Usb_SetActive( 1 );
}

// A very simple task...a good starting point for programming experiments.
// If you do anything more exciting than blink the LED in this task, however,
// you may need to increase the stack allocated to it above.
void BlinkTask( void* p )
{
    (void)p;
    Led_SetState( 1 );
    Sleep( 1000 );

    while ( true )
    {
        Led_SetState( 0 );
        Sleep( 900 );
        Led_SetState( 1 );
        Sleep( 5 );
    }
}

// Tarea encargada de gestionar nuestro dispositivo MIDI.
void pruebamidi( void* p )
{
    (void)p;
    char buffermidisalida[8] = {0x0C, 0xC0, 0, 0, 0x09, 0x90, 0x46, 0x70};
    char buffermidisalidaoff[8] = {0x0C, 0xC0, 0, 0, 0x08, 0x80, 0x46, 0x70};
    char bufferacelsalidamaracas[8] = {0x0C, 0xC9, 0, 0, 0x09, 0x99, 70, 0x70};
    char buffermidientrada[8];
    bool keyboard_active = false;
    Led_SetState(1);
    Sleep(6000);

    while (true) {
        if (DigitalIn_GetValue(2)) {
            Usb_Write(buffermidisalida, 8);
            keyboard_active = true;
        } else if (keyboard_active) {
            Usb_Write(buffermidisalidaoff, 8);
        }

        if (AnalogIn_GetValue(4) - 512 > 10)
            Usb_Write(bufferacelsalidamaracas, 8);

        Usb_Read(buffermidientrada, 8);

        Sleep(20);
    }
}
