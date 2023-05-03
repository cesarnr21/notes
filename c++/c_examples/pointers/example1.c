
#include <stdio.h>

void change(int input) {
    input = 10;
    printf("variable input is: %d\n", input);
}

int main() {
    int a = 5;
    change(a);
    printf("variable a is: %d\n", a);

    return 0;
}
