
/*
This file is to combine the functionality of all the programs in this directory

Functionality:
* Split function to separate individual letters in string
* Reverse strig function to reverse every character in the string
* Reverse word function to reverse every word in the string
* dynamic memory to accomodate for bigger arrays

* maybe have the option to work on text files and/or input strings
*/

#include <iostream>
#include <string>
#include "selectFuntion.cpp"

using namespace std;

int main() {
    cout << "Hello. The following functions are available: " << endl;
    cout << "SPLIT" << endl << "REVERSE" << endl << "COUNT";
    string function;
    getline(cin, function);
    select(function);                       // this function must be declared in the selectFuntion.cpp
}
