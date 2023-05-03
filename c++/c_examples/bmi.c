
#include <stdio.h>

int mass, weight, height;
float bmi;
int feet, inch;

int cal() {
    int h1, h2;
    float result;

    h1 = feet*0.3048;
    h2 = inch*0.0254;

    height = h1 + h2;
    weight = mass*0.454;
    result = weight/(height^2);

    return result;
}

int main() {
    printf("Enter you weight in Pounds: \n");
    scanf("%d", &mass);
    printf("\nEnter your height.\n");
    printf("Feet: ");
    scanf("%d", &feet);
    printf("Inches: ");
    scanf("%d", &inch);
    bmi = cal(feet, inch, mass);

    if (bmi < 18) {
        printf("\nYour BMI is %0.2f, therefore you are underweight.\n", bmi);
    }

    else if (bmi >= 18 && bmi < 25) {
        printf("\nYour BMI is %0.2f, therefore you have a healthy weight.\n", bmi);
    }

    else if (bmi >= 25 && bmi < 30) {
        printf("\nYour BMI is %0.2f, therefore you are a little overweight.\n", bmi);
    }

    else if (bmi >= 30) {
        printf("\nYour BMI is %0.2f, therefore you are obese, hit the gym\n", bmi);
    }

    else {
        printf("\nthere is something with this program\n");
        printf("\nthe BMI is %0.2f\n", bmi);
    }

    return 0;
}
