
#include <stdio.h>

/* Note: this still does not work.
 * Go here for the code: https://www.geeksforgeeks.org/reverse-a-string-using-recursion/
 */

void reverse(char *str) {
    if (*str) {
        reverse(str + 1);
        printf("%c", str);
    }
}

int main() {
    char a[100];
    printf("Enter a String to Reverse: ");
    scanf("%c", &a);
    reverse(a);
    return 0;
}
