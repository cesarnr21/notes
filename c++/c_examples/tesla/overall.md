
# Tesla Firmware Coding Challenge

## Macros
**#include**
difference between `<header.h>` and `"header.h"` are is that using the former looks for header files in the standard list of system directories, while `"header.h"` looks for header files in the current order:
1. in the directory containing the current file
2. in the qoute directories
3. in the standard list of system directories

**#define**
example: `#define PI 3.14`  
this i can also be used to define functions. example:
```c
#include <stdio.h>
#define PI 3.1415
#define circleArea(r) (PI*r*r) // defines 

int main() {
    float radius, area;

    printf("Enter the radius: ");
    scanf("%f", &radius);
    area = circleArea(radius);
    printf("Area = %.2f", area);

    return 0;
}
```

### Conditional Compilation
Difference between using the `if (statement)` and `#if` is that if statements are used during execution, whereas the conditional are used to include or skip before execution

Examples Below:

- `#ifdef`: checks if the Macro exist, is defined
```c
#ifdef MACRO
	// conditional code
#endif
```
- `#if`: checks the value of the macro is not 0, but any integer. note: it cannot check decimals  
**Difference Between #if and #ifdef** is that `#ifdef` checks where the macro exist (is defined) whereas `#if` checks the value of the macro and will execute if the value of the macro is not zero
```c
#include <stdio.h>
#define FOO 0

int main() {
    #if FOO
        // won't compile this because FOO is 0
        printf("#if works\n");
    #endif
    #ifdef FOO
        // will compile this
        printf("#ifdef works\n");
    #endif

    return 0;
}
```
- `#else`: can be used to perform something if the `#if` is false
```c
#if expression
	// conditional code
#else
	// conditional code
#endif
```
- `#elif`: can be used with `#if` and `#else`
```c
#if expression
	// conditional code
#elif expression1
	// conditional code
#elif expression2
	// conditional code
#else
	// will execute if all expressions above are 0
#endif
```

- `#defined`: used with `#if` to test if the macro is defined.  
**Difference Between #if and #ifdef** is that `#ifdef` only allows to check a single condition and `#if defined` allows you to do multple. example:
```c
#include <stdio.h>
#define FOO 0
#define MORE 1

int main() {
    #if defined FOO && MORE
        // will compile this since MORE and FOO together are not 0
        printf("#if works\n");
    #endif
    #ifdef FOO
        // will compile this
        printf("#ifdef works\n");
    #endif

    return 0;
}
```

### Predefined Macros
- `__DATE__`: a string containing the current date
- `__FILE__`: a string containing the file name
- `__LINE__`: integer containing the current line number
- `__STDC__`: if follows ANSI standard C, the value is a nonzero integer
- `__TIME__`: a string containing the current time

------------------------------------------------------------

## Bit Manipulation

These operators work at the bit-level

Examples Below:

- `& (bitwise AND)`: takes two numbers as inputs and does AND on every bit of two numbers. result of AND is only True if both bits are 1
- `| (bitwise OR)`: does OR on every bit of the two numbers. result of OR is only True if any of the two bits is 1.
- `^ (bitwise XOR)`: does XOR on every bit of the two numbers. result of XOR is only True if the values of both bits are different
- `<< (left shift)`: shifts the bits of the first operand, the second operand is the number of places to shift
- `>> (right shift)`: shifts the bits of the first operand, the second operand is the number of places to shift
- `~ (bitwise NOT)`: takes one number and invert all the bits of it


