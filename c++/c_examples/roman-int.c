
#include <stdio.h>
#include <string.h>

int convert(char);  // function prototype of conversion function

int main () {
    int i = 0, num = 0;
    char romanNumber[100]; // array for storing roman number
    char repeat[3];

    convert: 
    printf("Enter Roman number: ");
    scanf("%s", romanNumber);

    while(romanNumber[i]) {
        // if condition for checking validity of roman number
        if(convert(romanNumber[ i ]) < 0 ) {
        printf("\nInvalid Roman Number.\n");
        return 0;
    }

    // if condition for checking validity of roman number
    if((strlen(romanNumber) - i) > 2) {
        if(convert(romanNumber[ i ]) < convert(romanNumber[i + 2])) {
            printf("\nInvalid Roman Number.\n");
            return 0;
        }
    }

    // if condition for converting roman number into decimal number
    // true is first roman number is greater or equal to second
    if(convert(romanNumber[ i ]) >= convert(romanNumber[i + 1])) {
        num = num + convert(romanNumber[i]);
    }
    else {
        num = num + (convert(romanNumber[i + 1]) - convert(romanNumber[i]));
        i++;
    }

    i++;

    // displaying converted number
    printf("\nEquivalent decimal number: %d\n", num);

    /*
    The lines below are to repeat the program if the user desires
    still needs a little bit of work
    */
    again:
    printf("Do you want to execute this program again?\n");
    scanf("%s", repeat);

    // the repeating function still needs some work

    if(repeat == 'no') {
        return 0;
    }

    else if(repeat == 'yes') {
        repeat = 0;
        goto convert;
    }

    else {
        printf("Please answer with yes or no\n");
        goto again;
    }

    return 0;
}

// converting roman number into equivalent decimal value
int convert(char ch) {
    int value = 0;

    switch(ch) {
        case 'I': value = 1; break;
        case 'V': value = 5; break;
        case 'X': value = 10; break;
        case 'L': value = 50; break;
        case 'C': value = 100; break;
        case 'D': value = 500; break;
        case 'M': value = 1000; break;
        case 'i': value = 1; break;
        case 'v': value = 5; break;
        case 'x': value = 10; break;
        case 'l': value = 50; break;
        case 'c': value = 100; break;
        case 'd': value = 500; break;
        case 'm': value = 1000; break;
        case '\0': value = 0; break;
        default: value = -1;
    }

    return value;
}
