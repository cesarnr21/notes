
# C++ Language Notes

**References:**
- **[Programiz: Learn C Programming](https://www.programiz.com/c-programming)**
- **[Programiz: Learn C++ Programming](https://www.programiz.com/cpp-programming])**
- **[LearnCPP](https://www.learncpp.com/)**

Recursion: **<https://www.programiz.com/c-programming/c-recursion>**


## Intro
- **Compiler** will seuquentially go through each source code, checks for errors and then it creates **object files**

### Basic Syntax

It looks like most of the things from C translate to C++
One new thing: using namespace std;

#### Inputs/Outputs
example code: 
```c++
#include <iostream>
using namespace std;

int main() {
    int num;
    cout << "Enter an integer: ";
    cin >> num;   // Taking input
    cout << "The number is: " << num;
    return 0;
}
```

#### Type Conversion

C++ allows us to convert from 1 data type to another
```c++
#include <iostream>
using namespace std;

int main() {
   int num_int;
   double num_double = 9.99;
   num_int = num_double;
   cout << "num_int = " << num_int << endl;
   cout << "num_double = " << num_double << endl;

   return 0;
}
```
how often this will result in data loss. above for example, the output will be num_int = 9 and num = 9.99
this kind of conversion is called implicit or automatic conversion

**C++ Explicit Conversion**
explicit conversion is when the user manually changes the data type
the best way to do this is using c-style type casting
(data_type)expression;
```c++
int num_int = 26;
double num_double;
num_double = (double)num_int;
```
there also is function-style casting: data_type(expression);
```c++
int num_int = 26;
double num_double;
num_double = double(num_int);
```

#### Function Overloading

In C++ functions function the same way as they do in C. the only difference is that C++ can handle function overloading.
With **Function Overloading**, different functions can have the same name if they have a different number or different types of arguments(inputs) example these are all different functions:
```c++
int test() { }
int test(int a) { }
float test(double a) { }
int test(int a, double b) { }
```
**Default Parameters** 
When making a function, it is possible to provide default values for when a function is called without passing arguments. Example:
```c++
// two default arguments defined
void display(char = '*', int = 3);

int main() {
    int count = 5;

    cout << "No argument passed: ";
    // *, 3 will be parameters
    display(); //there is not passed argument

    cout << "First argument passed: ";
    // #, 3 will be parameters
    display('#'); //First argument passed

    cout << "Both arguments passed: ";
    // $, 5 will be parameters
    display('$', count); //Both arguments passed

    return 0;
}

void display(char c, int count) {
    for(int i = 1; i <= count; ++i) {
        cout << c;
    }
    cout << endl;
}
```
In the function above
1. `display()` is called without passing any arguments. In this case, display() uses both the default parameters `c = *` and `n = 1`.
2. `display('#')` is called with only one argument. In this case, the first becomes '#'. The second default parameter` n = 1` is retained.
3. when `display('#', count)` is called with both arguments. In this case, default arguments are not used.

#### C-Strings
C++ support c-strings that work the same way strings work in c.they are simply char arrays. the last element of the array is `\0`
> note: when using cin >> to read a string, it will only read characthers until it encounters a space.
example"

```c++
char str[100];
cout << "Enter a string: ";
cin >> str;
cout << "You entered: " << str << endl;

```
to read a line of strings, including whitespaces, cin.get
```c++
char str[100];
cout << "Enter a string: ";
cin.get(str, 100);
cout << "You entered: " << str << endl;
```
#### String Object
Unlike c-strings, a string objecr has no fixed length
to read a string object use the `getline()` function
```c++
string str;
cout << "Enter a string: ";
getline(cin, str);

cout << "You entered: " << str << endl;
```

Differennces between the two:
```c++
#include <iostream>
using namespace std;

void display(char *);
void display(string);

int main() {
    string str1;
    char str[100];

    cout << "Enter a string: ";
    getline(cin, str1); //string object

    cout << "Enter another string: ";
    cin.get(str, 100, '\n');  //char array

    display(str1);
    display(str);
    return 0;
}

void display(char s[]) {
    cout << "Entered char array is: " << s << endl;
}

void display(string s) {
    cout << "Entered string is: " << s << endl;
}
```
#### Structures and Functions
Example: 
```c++
#include <iostream>
using namespace std;

struct Person {
    char name[50];
    int age;
    float salary;
};

void displayData(Person);   // Function declaration

int main() {
    Person p;
    cout << "Enter Full name: ";
    cin.get(p.name, 50);
    cout << "Enter age: ";
    cin >> p.age;
    cout << "Enter salary: ";
    cin >> p.salary;

    // Function call with structure variable as an argument
    displayData(p);

    return 0;
}

void displayData(Person p) {
    cout << "\nDisplaying Information." << endl;
    cout << "Name: " << p.name << endl;
    cout <<"Age: " << p.age << endl;
    cout << "Salary: " << p.salary;
}
```

### Different variables

floating vs double: they are both used to represent decimals but double has twice the decimal places of floating.
<long double> will always take at least double the memory bits of float or int

string formatting with variables.
- `int` → `%d`
- `float` → `%f`
- `char` → `%c`
- `string` → `%s`
- `poinhters` → `%p`

**storage classes** if a variable is declared inside of a function, then it only exits inside that function and can only be used by that function.

If a variable is declared outside of any function, then it is a global variable and can be used by function

**static variables**
The value of a static variable stays the same until the end of the program. example:
```c++
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
in the function above, the first output will be 6 and the second will be 11. This is because when the value was increased to 6 at the first `display()`, the value of c stayed the same until it was increased again for second `display()`.

#### strings
strings are simply char arrays. the last element of the array is `\0`
>note: when using scanf to read a string, it will only read characthers until it encounters a space. example"

```c
char name[];
printf("enter name:");
scanf("%s", name);  //input Cesar Nunez
printf("%s", name); //output will be Cesar
```
to read a line of strings, including whitespaces, use `fgets()` and `puts()`

```c
char name[30];
printf("Enter name: ");
fgets(name, sizeof(name), stdin);  /  /input Cesar Nunez
printf("Name: ");
puts(name);    // output will be Cesar Nunez
```
For commmonly used string functions use `#include <string>`

More examples [here](https://web.stanford.edu/class/archive/cs/cs106b/cs106b.1132/handouts/08-C++-Strings.pdf)

#### Arrays
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
to scan or print the value of an individual element use `scanf("%d", mark[i])`

#### multi-dimensional arrays
these are arrays if arrays. example: `int mark[3][4]` here mark is a two dimmesional 2D array that can store 12 elements, in 3 rows and 4 columns.

In the same way you can declare a 3-dimmensional 3D array by `int mark[3][4][6]` that can store 72 elements, etc

other ways to initialized and define arrays
```c++
int mark[2][3] = {{1,2,3},{4,5,6}};

int mark[2][3][4] = {
    {{3, 4, 2, 3}, {0, -3, 9, 11}, {23, 12, 23, 2}},
    {{13, 4, 56, 3}, {5, 9, 3, 5}, {3, 1, 4, 9}}
    };
```

### Pointers
**Pointers** are variables that store addresses rather than values

for example: 
```c++
int* pc, c;  //
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
>note: keep in mind the difference
```c
// both &c and pc are addresses
pc = &c;

// both c and *pc values 
*pc = c;
```


### Loops
#### For Loop
```c
for (i = 1; i < 11; ++i) {
  printf("%d ", i);
}
```
> Note: also look for the difference between ++i and i++ 
++i increments i and evaluates to the new value of i and 
i++ evaluates to the old value of i, and increments i



#### While and Do..While Loops

> Note: the difference between the While and Do...while loops, is that the do...while loop will perform the loop at least once.

**while**
```c
int i = 1;

while (i <= 5) {
  printf("%d\n", i);
  ++i;
}
```
**do while**
```c
do {
printf("Enter a number: ");
scanf("%lf", &number);
sum += number;
}
while(number != 0.0);
```
#### Break and Continue inside of Loops
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


#### Switch Function
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
>notes: this function will only work with constant variables such as integers and character strings (int and char)

You can also combine cases by not using the 'break' at the end of each case. For example
```c
int number=5;

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

#### Structures and Unions
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



--------------------------------------


## Objects and Classes

**Classes** This is the blueprint for an object. syntax:
```c++
class className {
//data, functions, or anything
};
```
example
```c++
class Room {
    public:
        double length;
        double breadth;  //these are data members
        double height;   

        double calculateArea() {   
            return length * breadth;
        }

        double calculateVolume() {   
            return length * breadth * height;
        }

};
```
**Objects**to use the data and acces function defined in the class, we need to create objects. continuing the example above:
```c++
// sample function
void sampleFunction() {
    // create objects
    Room room1, room2;
}

int main(){
    // create objects 
    Room room3, room4;
}
```
the objects created above are room1, room2, room3, and room4
example using classes and objects:
```c++
#include <iostream>
using namespace std;
// create a class
class Room {

   public:
    double length;
    double breadth;
    double height;

    double calculateArea() {
        return length * breadth;
    }

    double calculateVolume() {
        return length * breadth * height;
    }
};

int main() {
    Room room1; // create object of Room class
    room1.length = 42.5; // assign values to data members
    room1.breadth = 30.8;
    room1.height = 19.2;
    // calculate and display the area and volume of the room
    cout << "Area of Room =  " << room1.calculateArea() << endl;
    cout << "Volume of Room =  " << room1.calculateVolume() << endl;

    return 0;
}
```

### Private and Public Members
When using the keyword `private`, the data memebers and functions from the class cannot be accessed by another function. Using the same example from above:
```c++
#include <iostream>
using namespace std;

class Room {

   private:
    double length;
    double breadth;
    double height;

   public:

    // function to initialize private variables
    void getData(double len, double brth, double hgt) {
        length = len;
        breadth = brth;
        height = hgt;
    }

    double calculateArea() {
        return length * breadth;
    }

    double calculateVolume() {
        return length * breadth * height;
    }
};

int main() {
    Room room1;
    room1.getData(42.5, 30.8, 19.2);
    cout << "Area of Room =  " << room1.calculateArea() << endl;
    cout << "Volume of Room =  " << room1.calculateVolume() << endl;
    return 0;
}
```
the keyword `public` on the other hand works exactly the opposite way.

### Constructors
They are a memebr function that is called when an object is created. it has the same as the class and does not have a return type. Example:
```c++
class  Wall {
   public:
    Wall() { // create a constructor
        // code
    }
};
```

### Inheritance

It allows us to create a new class of objects derived from an existing class. the derived class inherits the features of the base class. examples below:
```c++
class Animal {
    // eat() function
    // sleep() function
};

class Dog : public Animal {
    // bark() function
};
```
above for example, the a class 'dogs' is derived from a base class 'animal'. the class dogs has all of the features of the base class.

the program below shows some inheritance example
```c++
#include <iostream>
using namespace std;

// base class
class Animal {
   public:
    void eat() {
        cout << "I can eat!" << endl;
    }
    void sleep() {
        cout << "I can sleep!" << endl;
    }
};

// derived class
class Dog : public Animal {
   public:
    void bark() {
        cout << "I can bark! Woof woof!!" << endl;
    }
};

int main() {
    // Create object of the Dog class
    Dog dog1;

    // Calling members of the base class
    dog1.eat();
    dog1.sleep();

    // Calling member of the derived class
    dog1.bark();

    return 0;
}
```

#### protected members
they are like private members and cannot be accessed by other classes or functions. But protected can be accessed by classes derived from the base class.
more examples:
```c++
class Base {
    public:
        int x;
    protected:
        int y;
    private:
        int z;
};

class PublicDerived: public Base {
    // x is public
    // y is protected
    // z is not accessible from PublicDerived
};

class ProtectedDerived: protected Base {
    // x is protected
    // y is protected
    // z is not accessible from ProtectedDerived
};

class PrivateDerived: private Base {
    // x is private
    // y is private
    // z is not accessible from PrivateDerived
}
```

#### Multilevel Inheritance
It is possible to derive a class from a derived class of another class. example:
```c++
class A { 
... .. ... 
};
class B: public A {
... .. ...
};
class C: public B  {
... ... ...
};
```

#### Multiple Inheritance
A class can also be derived from multiple base classes. examples bats are both winged animals and mammal
```c++
class Mammal {
  public:
    Mammal() {
      cout << "Mammals can give direct birth." << endl;
    }
};

class WingedAnimal {
  public:
    WingedAnimal() {
      cout << "Winged animal can flap." << endl;
    }
};

class Bat: public Mammal, public WingedAnimal {

};

int main() {
    Bat b1;
    return 0;
}
```

### Friend Functions and Friend Classes

**Friend Functions and Classes** can access the private and protected data of a class
```c++
class Distance {
    private:
        int meter;
        
        // friend function
        friend int addFive(Distance);

    public:
        Distance() : meter(0) {}
        
};

// friend function definition
int addFive(Distance d) {

    //accessing private members from the friend function
    d.meter += 5;
    return d.meter;
}

int main() {
    Distance D;
    cout << "Distance: " << addFive(D);
    return 0;
}
```
> note: all member functions of a friend class become friend functions*
```c++
class ClassB;

class ClassA {
   // ClassB is a friend class of ClassA
   friend class ClassB;
   ... .. ...
}

class ClassB {
   ... .. ...
}
```
example of a friend class below
```c++
// C++ program to demonstrate the working of friend class

#include <iostream>
using namespace std;

// forward declaration
class ClassB;

class ClassA {
    private:
        int numA;

        // friend class declaration
        friend class ClassB;

    public:
        // constructor to initialize numA to 12
        ClassA() : numA(12) {}
};

class ClassB {
    private:
        int numB;

    public:
        // constructor to initialize numB to 1
        ClassB() : numB(1) {}
    
    // member function to add numA
    // from ClassA and numB from ClassB
    int add() {
        ClassA objectA;
        return objectA.numA + numB;
    }
};

int main() {
    ClassB objectB;
    cout << "Sum: " << objectB.add();
    return 0;
}
```

--------------------------------------

## Templates

Template allow us to write generic programs. It is possible to create functions and classess to work with different data types. they are used ecause of reusability and flexibility
syntax: 
```c++
template <class T>
T someFunction(T arg) {
   ... .. ...
}
```
example:
```c++
// If two characters are passed to function template, character with larger ASCII value is displayed.

#include <iostream>
using namespace std;

int main() {
// template function
template <class T>
T Large(T n1, T n2) {
  return (n1 > n2) ? n1 : n2;
}

int main() {
  int integer1, integer2;
  float float1, float2;
  char character1, character2;

  cout << "Enter two integers:\n";
  cin >> integer1 >> integer2;
  cout << Large(integer1, integer2) <<" is larger." << endl;

  cout << "\nEnter two floating-point numbers:\n";
  cin >> float1 >> float2;
  cout << Large(float1, float2) <<" is larger." << endl;

  cout << "\nEnter two characters:\n";
  cin >> character1 >> character2;
  cout << Large(character1, character2) << " has larger ASCII value.";
return 0;
}
```
template class example:
```c++
#include <iostream>
using namespace std;

template <class T>
class Calculator {
private:
  T num1, num2;
  
public:
  Calculator(T n1, T n2)   {
    num1 = n1;
    num2 = n2;
  }
  
  void displayResult()   {
    cout << "Numbers are: " << num1 << " and " << num2 << "." << endl;
    cout << "Addition is: " << add() << endl;
    cout << "Subtraction is: " << subtract() << endl;
    cout << "Product is: " << multiply() << endl;
    cout << "Division is: " << divide() << endl;
  }
  
  T add() { return num1 + num2; }
  
  T subtract() { return num1 - num2; }
  
  T multiply() { return num1 * num2; }
  
  T divide() { return num1 / num2; }
};

int main() {
  Calculator<int> intCalc(2, 1);
  Calculator<float> floatCalc(2.4, 1.2);
  
  cout << "Int results:" << endl;
  intCalc.displayResult();
  
  cout << endl << "Float results:" << endl;
  floatCalc.displayResult();
  
  return 0;
}
```






