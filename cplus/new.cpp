#include <iostream>
using namespace std;

int main() {
    // the largest 16-bit unsigned value
    unsigned short x{65535};
    cout << "x was: " << x << endl;

    // the number below is out of range
    x = 65536;
    cout << "x is now: " << x << endl;

    // the number is still out of range
    x = 65537;
    cout << "x is now: " << x << endl;

    // you can declare a bigger 32 bit unsigned integer value
    uint32_t y = 65537;
    cout << "on the other hand y = " << y << endl;

    return 0;
}
