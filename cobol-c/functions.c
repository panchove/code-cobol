#include <stdio.h>
#include <string.h>

void c_display(const char *message)
{
    printf("Mensaje recibio de COBOL => %s\n", message);
}

void c_display_ptr(char *message)
{
    printf("PUNTERO COBOL recibido -> %x\n", message);
    printf("MENSAJE COBOL recibido -> %s\n", message);
    strcpy(message, "Hola a todos");
}