#include <C8051F340.h>
#include <math.h>
#include "lcd.h"
#include "utils.h"

sbit LED1 = P3 ^ 3;
sbit LED2 = P3 ^ 2;
sbit LED3 = P3 ^ 1;

void Init_Device(void);
void sendString(char string[]);
void receiveString(char v[]);
void enterAT(void);
int string2dec(char string[]);
int searchPosition(int db1, int db2);

void main(void)
{
    char v[16];
    char mensaje[16];
    char decibelios[16];
    int db1, db2, puesto;
    bit baliza = 0;
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

        delayAT();
        enterAT(); // Entrar en modo AT
        receiveString(v); // Esperar OK

        // Seleccionar baliza
        if (baliza) {
            sendString("ATDL11");
        } else {
            sendString("ATDL12");
        }

        receiveString(v); // Esperar OK

        sendString("ATCN"); // Salir del modo AT
        receiveString(v); // Esperar OK

        sendString("123456"); // Saludo a la baliza
        receiveString(mensaje); // Respuesta de la baliza

        delayAT();
        enterAT(); // Entrar en modo AT
        receiveString(v); // Esperar OK

        sendString("ATDB"); // Solicitar decibelios
        receiveString(decibelios); // Esperar decibelios

        sendString("ATCN"); // Salir del modo AT
        receiveString(v); // Esperar OK

        if (baliza) {
            db1 = string2dec(decibelios);
        } else {
            db2 = string2dec(decibelios);
            puesto = searchPosition(db1, db2);
            LCD_DisplayString(1, 1, "Puesto");
            LCD_DisplayNumber(2, 1, puesto); // Escribir puesto
        }

        baliza = !baliza;
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

void receiveString(char v[])i
{
    char i = 0;
    char rx_data = 0;

    while (rx_data != 0x0d) {
        while ((SCON1 & 0x01) != 0x01);
        rx_data = SBUF1;
        v[i] = rx_data;
        i++;
        SCON1 = SCON1 & (0xfe); // Limpiar RI1
    }
}

void enterAT()i
{
    int i = 0;
    for (i = 0; i < 3; i++) {
        SBUF1 = '+';
        while ((SCON1 & 0x20) != 0x20);
    }
}

int string2dec(char string[])i
{
    int n;

    if (string[0] <= '9') {
        n = string[0] - '0';
    } else {
        n = string[0] - 'A' + 10;
    }

    n = n * 16;

    if (string[1] <= '9') {
        n += string[1] - '0';
    } else {
        n += string[1] - 'A' + 10;
    }

    return n;
}

int searchPosition(int db1, int db2)i
{
    int i, puesto, min_error, tmp;
    min_error = 120;

    for (i = 0; i < 8; i++) {
        tmp = abs(db1 - balizaDB[i][0]);
        tmp += abs(db2 - balizaDB[i][1]);
        if (tmp < min_error) {
            min_error = tmp;
            puesto = i + 1;
        }
    }

    return puesto;
}

