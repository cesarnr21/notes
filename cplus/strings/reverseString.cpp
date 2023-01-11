
#include <iostream>
#include <string>

using namespace std;

int main() {
    string str;
    // string str = "Hello Cesar";
    //char option2[100] = "Hello Cesar";

    cout << "Enter a String to reverse: ";
    getline(cin, str);
    cout << "The string Entered is: " << str << endl;
    int len = str.length();
    int n = len - 1;

    for(int i = 0; i < (len/2); i++) {
        char temp = str[i];
        str[i] = str[n];
        str[n] = temp;
        n = n - 1;
    }

    cout << "The string reversed is: " << str << endl;

    return 0;
}
