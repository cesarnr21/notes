/*
Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

Example 1:

Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
*/

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

