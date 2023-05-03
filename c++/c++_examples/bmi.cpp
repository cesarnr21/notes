// Program to calculate the BMI Index of a person based on height and weight

#include <iostream>
using namespace std;

int main() {
    int mass, weight, height;
    float bmi;
    int feet, inch, h1, h2;

    cout << "Enter an your weight in pounds: ";
    cin >> mass;
    cout << "Enter your height below" << endl;
    cout << "Feet: ";
    cin >> feet;
    cout << "Inches: ";
    cin >> inch;

    h1 = feet*0.3048;
    h2 = inch*0.0254;
    height = h1 + h2;
    weight = mass*0.454;
    bmi = weight/(height^2);

    if (bmi < 18) {
        cout << "Your BMI is" << bmi << "therefore you are overweight" << endl;
    }

    else if (bmi >= 18 && bmi < 25) {
        cout << "Your BMI is" << bmi << "therefore you have a healthy weight" << endl;
    }

    else if (bmi >= 25 && bmi < 30) {
        cout << "Your BMI is" << bmi << "therefore you are a little overweight" << endl;
    }

    else if (bmi >= 30) {
        cout << "Your BMI is " << bmi << " therefore you are obese, hit the gym" << endl;
    }

    else {
        cout << "there is something wrong with this program" << endl;
    }

    return 0;
}
