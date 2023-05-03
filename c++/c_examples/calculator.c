#include <stdio.h>

int main() {
    int num1, num2;
    float result = 0;
    char op;

    printf("enter first number:  ");
    scanf("%d",&num1);
    printf("enter second number: ");
    scanf("%d",&num2);

    printf("choose operation to perform ( + - * /): ");
    scanf(" %c",&op);

    switch(op) {
        case '+':
            result=num1+num2;
            break;

        case '-':
            result=num1-num2;
            break;

        case '*':
            result=num1*num2;
            break;

        case '/':
            result=num1/num2;
            break;
            
        default:
            printf("Invalid Operation. \n");
    }

    printf("Result: %d %c %d = %0.2f\n", num1, op, num2, result);

    return 0;
}
