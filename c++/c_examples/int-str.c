
// this supposed to transfer int to strings
#include <stdio.h>

void convert(int input, char* buffer) {
    int remainder = 0;
    int i;

    for(i = 0; input > 0; i++) {
        remainder = input % 10;
        input = input / 10;
        buffer[i] = remainder + '0'; // this is what makes an int into a char
    }

    buffer[i] = '\0';

    int len;
    for(len = 0; buffer[len] != '\0'; ++len); // find the lenght of the string
    printf("Lenght of the String is %d\n", len);

    int temp;
    for(int x = 0; x < (len / 2); x++) {    // loop to reverse the string
        temp = buffer[x];
        buffer[x] = buffer[len - x - 1];
        buffer[len -x - 1] = temp;
    }
}

int main() {
    char buffer[10];
    int input = 123456;
    convert(input, buffer);
    printf("Number printed as a string: %s\n", buffer);
    return 0;
}
