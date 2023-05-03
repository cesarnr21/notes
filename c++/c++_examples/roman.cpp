// Program to convert between Roman and Integer Numbers


/*
need to do:
* There are some issues with redefining the functions
* Need to write the roman function
*/

#include <iostream>
using namespace std;

char num;
char result;
int roman(num);
int integer(num);

int main() {
    int mode;

    cout << "Available Modes:" << endl << "1. Roman to Integer" << endl << "2. Integer to Roman" << endl;
    cout << "Enter a Number (1 or 2): ";
    cin >> mode;

    if(mode = 1) {
        cout << "Please enter a Roman Number to Convert to an Integer";
        cin >> num;
        result = integer(num);
        cout << num << " is " << result <<  endl;
    }

    else if(mode = 2) {
        cout << "Please enter an Integer to convert to Roman Symbols";
        cin >> num;
        // make all char in the string upper case
        result = roman(num);
        cout << num << " is " << result << endl;
    }

    else {
        cout << "Wrong Mode Selected Please try again" >> endl;

    }

    return 0;
}

int roman(num) {
    int value = 0;

    switch(num) {
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

int integer(char) {
    int value = 0;
    return value;
}
