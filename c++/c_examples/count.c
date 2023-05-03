
/* Write a program to return the lenght of any string entered in terminal */

#include <stdio.h>

char str[] = "Hello Cesar";
int len = 0;

// loop iterates forever
int for(;;) {
    if(*str == '\0') {
        break;
    }
    str++;
    len++;
}

