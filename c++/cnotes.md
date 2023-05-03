
## Memory in C

**Reference: <https://craftofcoding.wordpress.com/2015/12/07/memory-in-c-the-stack-the-heap-and-static/#:~:text=C%20has%20three%20different%20pools,not%20allocated%20in%20contiguous%20order>**

C has 3 different pools of memory:
- **Static Global Variable storage:** avialable throughout the entire program and is accessible to every funtion
    - Here every global variable is stored. These are declared outside of a function or when declared inside a function using `static`
    ```c
    void foo() {
        static int x = 5; // assigns value of 5 only once
        x++;
        printf("%d", x);
    }

    int main() {
        foo(); // x = 6
        foo(); // x = 7
        return 0;
    }
    ```
- **Stack:** local variable storage for funtions. When the funtion is not running, this is erased
- **Heap:** dynamic storage, large pool of memory, not allocated

## Pointers
**Example from Lutron Interview (passing by references by pointer):**

```c
#include <stdio.h>

void change(int input) {
    input = 10;
    printf("variable input is: %d\n", input);
}

int main() {
    int a = 5;
    change(a);
    printf("variable a is: %d\n", a);

    return 0;
}
```

The code above prints `a = 5` and the one below prints `a = 10`

```c
#include <stdio.h>

void change(int *input) {
    *input = 10;
    printf("variable input is: %d\n", *input);
}

int main() {
    int a = 5;
    change(&a);
    printf("variable a is: %d\n", a);

    return 0;
}
```

pointers are variables that store addresses rather than values
declaring pointer example:
```c
int* a;
// or
int* x, y;

int* pc, c;
c = 5;       // assign 5 as the value of c
pc = &c;     // assign the address of c to pc
```
another example
```c
int* pc, c;
c = 5;
pc = &c;
c = 1;
printf("%d", c);    // Output: 1
printf("%d", *pc);  // Ouptut: 1
```
look how with the code above, c is assigned the value of 5 and then its address is assigned to pc. After the value of c is changed to 1, the *pc is automatically changes to 1 because it is storing the address instead of a value.
Here is another example
```c
int* pc, c;
c = 5;
pc = &c;
*pc = 1;
printf("%d", *pc);  // Ouptut: 1
printf("%d", c);    // Output: 1
```
> note: keep in mind the difference
```c
// both &c and pc are addresses
pc = &c;

// both c and *pc values 
*pc = c;
```

## Structures and Unions
a structure is a collection of variables under a single. syntax:
struct name {
  dataType name1;
  dataType name2;
} variable1,variable2;

example the program below adds two distances: 
```c
struct Distance {
    int feet;
    float inch;
} dist1, dist2, sum;

printf("Enter feet: ");
scanf("%d", &dist1.feet);
printf("Enter inch: ");
scanf("%f", &dist1.inch);
printf("Enter feet: ");
scanf("%d", &dist2.feet);
printf("Enter inch: ");
scanf("%f", &dist2.inch);

// adding feet
sum.feet = dist1.feet + dist2.feet;
// adding inches
sum.inch = dist1.inch + dist2.inch;

// changing to feet if inch is greater than 12
while (sum.inch >= 12) {
++sum.feet;
sum.inch = sum.inch - 12;
}

printf("Sum of distances = %d\'-%.1f\"", sum.feet, sum.inch);
```
Another example
```c
#include <stdio.h>
struct student {
   char name[50];
   int age;
}; // s1;

// function prototype
void display(struct student s);

int main() {
   struct student s1;

   printf("Enter name: ");

   // read string input from the user until \n is entered
   // \n is discarded
   scanf("%[^\n]%*c", s1.name);

   printf("Enter age: ");
   scanf("%d", &s1.age);

   display(s1); // passing struct as an argument

   return 0;
}

void display(struct student s) {
   printf("\nDisplaying information\n");
   printf("Name: %s", s.name);
   printf("\nAge: %d", s.age);
}
```
Another Example
```c
#include <stdio.h>
struct student {
    char name[50];
    int age;
};

// function prototype
struct student getInformation();

int main() {
    struct student s;

    s = getInformation();

    printf("\nDisplaying information\n");
    printf("Name: %s", s.name);
    printf("\nRoll: %d", s.age);
    
    return 0;
}
struct student getInformation() {
  struct student s1;

  printf("Enter name: ");
  scanf ("%[^\n]%*c", s1.name);

  printf("Enter age: ");
  scanf("%d", &s1.age);
  
  return s1;
} 
```

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


## and Common pratices


All the ways to declare variables:

**Variables with a fixed width**
```c
// these are defined in the header below
#include <stdint.h>

// signed intergers
int8_t            // signed integer type with a width of exactly 8 bits
int64_t           // signed integer type with a width of exactly 64 bits
// for signed intergers, no padding bits are used and 2's complement is used for negative values

// unsigned integers
uint8_t           // unsigned integer with a witdth of exactyly 8 bits
uint64_t          // unsigned integer with 64 bits
```

**Other weird Declarations**
```c
/*
3 types of char types:
*/
char              // use char for your usual text characters
signed char       // use when you are dealing with numbers as characters.(range: -127 to 127)
unsigned char     // use when you are dealing with numbers as characters but (range: 0 to 255)

volatile int any_variable          
/*
 * sometimes a compiler will optimized a program to store a variable in a temporary register for quicker access.
 * Variables can be modified by code outside of the current scope(e.i. ISR and Multi-threaded applications)
 * use volatile to make sure that a the program accesses the lastest updated verion of the variable
 */

static

static void
main() {

extern


}

union
```


**Other**
```c

for (;;) {

}



```


# C Language Notes

References <https://www.programiz.com/c-programming>

## Different variables

floating vs double: they are both used to represent decimals but double has twice the decimal places of floating.
<long double> will always take at least double the memory bits of float or int

printf and scanf functions with variables.
```c
- int ------- %d
- float ----- %f
- char ------ %c
- strings --- %s
- pointers -- %p
```
**storage classes**
if a variable is declared inside of a function, then it only exits inside that function and can only be used by that function.

If a function is declared outside of any function, then it is a global variable and can be used by function

**static variables**
The value of a static variable stays the same until the end of the program. example:
```c
void display();

int main() {
    display();
    display();
}
void display() {
    static int c = 1;
    c += 5;
    printf("%d  ",c);
}
```
in the function above, the first output will be 6 and the second will be 11. This is because when the value was increased to 6 at the first display(), the value of c stayed the same until it was increased again for second display().

**strings**
strings are simply char arrays. the last element of the array is \0
>note: when using scanf to read a string, it will only read characthers until it encounters a space. example"

```c
char name[];
printf("enter name:");
scanf("%s", name);  //input Cesar Nunez
printf("%s", name); //output will be Cesar
```
to read a line of strings, including whitespaces, use fgets() and puts()

```c
char name[30];
printf("Enter name: ");
fgets(name, sizeof(name), stdin);  /  /input Cesar Nunez
printf("Name: ");
puts(name);    // output will be Cesar Nunez
```
commmonly used string functions
>note: these require the <string.h> header file
```c
strlen() // calculates the lenght of a string
strcpy() // copies a string to another
strcmp() // compares two strings
strcat() // concatenates two strings
```

### Arrays

An array is a variable that can store multiple values. 
> note: the first value of the array is stored as element 0.

```c
int data[100]     /// type arrayname [size] 
int mark[5] = {19, 10, 8, 17, 9}

// make the value of the third element to -1
mark[2] = -1;

// make the value of the fifth element to 0
mark[4] = 0;
```
to scan or print the value of an individual element use scanf("%d", mark[i]);

**multi-dimensional arrays**
these are arrays if arrays. example: int mark[3][4]; here mark is a two dimmesional 2D array that can store 12 elements, in 3 rows(3 x-axis) and 4 columns(4 y-axis).
In the same way you can declare a 3-dimmensional 3D array by int mark[3][4][6]; that can store 72 elements, etc

another way to declare arrays is by 
int mark[2][3] = {{1,2,3},{4,5,6}}; 
*look how this is composed of two elements composed of 3 values*
or a 3D array 

int mark[2][3][4] = {
    {{3, 4, 2, 3}, {0, -3, 9, 11}, {23, 12, 23, 2}},
    {{13, 4, 56, 3}, {5, 9, 3, 5}, {3, 1, 4, 9}}
    };
*above, there are 2 x-axis, then each one is composed of 3 arrays, and each array has 4 values*
example of a 2D array in code
```c
int temperature[CITY][WEEK];

// Using nested loop to store values in a 2d array
for (int i = 0; i < CITY; ++i) {
  for (int j = 0; j < WEEK; ++j) {
    printf("City %d, Day %d: ", i + 1, j + 1);
    scanf("%d", &temperature[i][j]);
  }
}
```
example of a 3D array in code 
```c
for (int i = 0; i < 2; ++i) {
  for (int j = 0; j < 3; ++j) {
    for (int k = 0; k < 2; ++k) {
      scanf("%d", &test[i][j][k]);
    }
  }
}
```



Different Operators
-----------------------
% -> will give you the remainder after an integer division. example:
```c
int a = 10, b = 20;
int  c = b%a
// the output will be c = 0
== ----- checks if equal to
!= ----- checks if the value are unequal *this is different from a=!b. here the value is simply set to be the opposite of the boolean value of b. so only TRUE or FALSE work*
* >= ----- greater than or equal
* <= ----- less than or equal
* && ----- AND operator, meaning that both conditions must be true
* || ----- OR operator, meaning that only one condition needs to be true
* ! ------ this is the opposite. 
```
for example:
```c
if (A && B) is TRUE, than !(A && B) is FALSE
```
* `+=` ----- add and assign value. example: c += a is equal to c = c + a
* `-= `----- subtract and assign. see above for example
* `*=` ----- multiply and assign
* `/=` ----- divide and assign
* `&` ------ returns the address of a varable. example: &a give the address of a
* `sizeof()` returns the size of the variable

> note: need more info in these last two

* `*`------- pointer to a variable. example: `*a;`
* `?:` ----- ternary operator. works just as an `if/else statement`. Here is the syntaxt: 
`variable = Expression1 ? Expression2 : Expression3`. If expression1 is true, the expression 2 is executed and return, if false then expression3 is selected. working example below:

```c
// C program to find largest among two
// numbers using ternary operator

#include <stdio.h>

int main()
{
  int m = 5, n = 4;

  (m > n) ? printf("m is greater than n that is %d > %d",
          m, n)
      : printf("n is greater than m that is %d > %d",
          n, m);

  return 0;
}
```

## For Loops, While and Do-While Loops

**For loop** for (initialize; testcondition; update) {
  executable code
}

> note: check if there is a difference between having the ++i at the beginning or the end of the for loop

```c
for (i = 1; i < 11; ++i) {
  printf("%d ", i);
}
```
> Note: also look for the difference between ++i and i++ 
++i increments i and evaluates to the new value of i and 
i++ evaluates to the old value of i, and increments i

**While Loop** while (condition) {
  executable code
}
```c
int i = 1;

while (i <= 5) {
  printf("%d\n", i);
  ++i;
}
```

**Do While Loop**  do {
  executable code
}
while(condition);

> Note: the difference between the While and Do...while loops, is that the do...while loop will perform the loop at least once.

```c
do {
printf("Enter a number: ");
scanf("%lf", &number);
sum += number;
}
while(number != 0.0);
```
**Break and Continue inside of Loops**
The break; statement ends the loop. For example:
```c
for (i = 1; i <= 10; ++i) {
      executable code

      if (condition) {
         break; //ends the loop
      }
   }
```
the continue; statement will end the current loop and start a new one. For example:
```c
for (i = 1; i <= 10; ++i) {
  executable code

  if (condition) {
   continue; //goes back to 'for'
  }
}
```

## Functions in C

example of a function:
```c
int addNumbers(int a, int b);         // declare function function prototype

int main() 
{
    int n1,n2,sum;

    printf("Enters two numbers: ");
    scanf("%d %d",&n1,&n2);

    sum = addNumbers(n1, n2);        // function call
    printf("sum = %d",sum);

    return 0;
}

int addNumbers(int a, int b)         // function definition
{
    int result;
    result = a+b;
    return result;                  
    
    /*the return result; returns the value of result and assign it to the variable that called the function above. so sum = result.*/
}
```
> note: in the example above, the value of the variables, n1 and n2 are tranfered to the variables a and b. in order for this to happen, the variables must be the same type.

**Switch Function**
In addition, for the conditions in the 
```c
switch(variable) {
    case(condition) :
      //statements
      break;
    case(condition) :
      //statements
      break;
    case(condition) :
      //statements
      break;
    default:
      //default statements
  }
```
> notes: this function will only work with constant variables such as integers and character strings (int and char)

You can also combine cases by not using the 'break' at the end of each case. For example
```c
int number = 5;
switch (number) {
  case 1: //if 1
  case 2: //if 2
  case 3: //if 3
    printf("One, Two, or Three.\n");
    break;
  case 4: //if 4
  case 5: //if 5
  case 6: //if 6
    printf("Four, Five, or Six.\n");
    break;
  default:
    printf("Greater than Six.\n");
}
```
The output for the code above is "Four, Five, or Six"




