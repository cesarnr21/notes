#include <iostream>
using namespace std;

int main() {
    int size;
    int sum = 0;

    cout << "How many numbers do you want to add? ";
    cin >> size;
    int nums [size];

    for(int i = 0; i < size; i++) {
        cout << "Enter number " << i + 1 << ": ";
        cin >> nums[i];
        sum = sum + nums[i];
    }

    cout << "The sum of all the numbers you entered is " << sum << endl;

    return 0;
}
