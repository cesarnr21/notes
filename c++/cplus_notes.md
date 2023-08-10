
# C++ Language Notes

* [C++ Language Notes](#c-language-notes)
  * [To learn](#to-learn)
  * [Intro](#intro)
    * [Basic Rules](#basic-rules)
      * [Namespaces](#namespaces)
      * [Type Conversion](#type-conversion)
      * [Function Overloading](#function-overloading)
      * [C-Strings](#c-strings)
      * [String Object](#string-object)
      * [Structures and Functions](#structures-and-functions)
    * [Pointers](#pointers)
      * [Structures and Unions](#structures-and-unions)
  * [Objects and Classes](#objects-and-classes)
    * [Constructors](#constructors)
    * [Private and Public Members](#private-and-public-members)
    * [Inheritance](#inheritance)
      * [protected members](#protected-members)
      * [Multilevel Inheritance](#multilevel-inheritance)
      * [Multiple Inheritance](#multiple-inheritance)
    * [Friend Functions and Friend Classes](#friend-functions-and-friend-classes)
  * [Templates](#templates)


## To learn
- [ ] review the `#ifndef` and `#endif` macros for header files, etc. bottom of this site: <https://www.geeksforgeeks.org/header-files-in-c-cpp-and-its-uses/amp/>
- [ ] using the linker, working with header files
- [ ] using `extern`
- [ ] using **CMake** and **Make**
- [ ] multi-threading

**References:**
- **[Programiz: Learn C Programming](https://www.programiz.com/c-programming)**
- **[Programiz: Learn C++ Programming](https://www.programiz.com/cpp-programming)**
- **[LearnCPP](https://www.learncpp.com/)**
    - [ ] chapter 6: scope, duration, and linkage
    - [ ] chapter 7: just error  and chapter 20: for exceptions
    - [ ] chapter 8: conversion and function overloading
    - [ ] chapter 9: review pointers and chapter 12 for function pointers, chapter M smart pointers
    - [ ] chapter 11: arrays and dynamic memory allocation
    - [ ] chapter 13 : OOP, Chaper 16: object relationships, and Chapter 17: inheritance
    - [ ] chapter 19: for templates

- **Recursion: <https://www.programiz.com/c-programming/c-recursion>**


## Intro
Notes on the c and c++ **[compilers and compiling methods](compiler.md)**

### Basic Rules
most systax is the same as `C`

The `iostream` library included within the standard library is used for IO.
```cpp
#include <iostream>

int main() {
    int num;
    std::cout << "Enter an integer: ";
    std::cin >> num;   // Taking input
    std::cout << "The number is: " << num << std::endl;
    return 0;
}
```

#### Namespaces
```cpp
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
```cpp
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

**cpp Explicit Conversion**
explicit conversion is when the user manually changes the data type
the best way to do this is using c-style type casting
(data_type)expression;
```cpp
int num_int = 26;
double num_double;
num_double = (double)num_int;
```
there also is function-style casting: data_type(expression);
```cpp
int num_int = 26;
double num_double;
num_double = double(num_int);
```

#### Function Overloading

In cpp functions function the same way as they do in C. the only difference is that cpp can handle function overloading.
With **Function Overloading**, different functions can have the same name if they have a different number or different types of arguments(inputs) example these are all different functions:
```cpp
int test() { }
int test(int a) { }
float test(double a) { }
int test(int a, double b) { }
```
**Default Parameters** 
When making a function, it is possible to provide default values for when a function is called without passing arguments. Example:
```cpp
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
cpp support c-strings that work the same way strings work in c.they are simply char arrays. the last element of the array is `\0`
> note: when using cin >> to read a string, it will only read characthers until it encounters a space.
example"

```cpp
char str[100];
cout << "Enter a string: ";
cin >> str;
cout << "You entered: " << str << endl;

```
to read a line of strings, including whitespaces, cin.get
```cpp
char str[100];
cout << "Enter a string: ";
cin.get(str, 100);
cout << "You entered: " << str << endl;
```
#### String Object
Unlike c-strings, a string objecr has no fixed length
to read a string object use the `getline()` function
```cpp
string str;
cout << "Enter a string: ";
getline(cin, str);

cout << "You entered: " << str << endl;
```

Differennces between the two:
```cpp
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
```cpp
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



### Pointers
**Pointers** are variables that store addresses rather than values

for example: 
```cpp
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
```cpp
class className {
//data, functions, or anything
};
```
example
```cpp
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
**Objects** to use the data and acces function defined in the class, we need to create objects. continuing the example above:
```cpp
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
```cpp
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

### Constructors
They are a member function that initilizes an object, equivalent to the `__init__()` function in python. Usually `public` but it can also be `private`. it has the same as the class and does not have a return type. 

> Note: for some reason, creating constructors with parameters require the parameters and the class attributes to have different names.

Example:
```cpp
#include <iostream>

class Room {
    public:
        // declare some attributes
        float lenght;
        float depth;
        float height;
        std::string name;
        float area;

        // declare and define constructor to initialize objects objects
        Room(std::string name_hold, float len, float dep, float hgt) {
            name = name_hold;
            lenght = len;
            depth = dep;
            height = hgt;
            area = cal_area();
        }

        float cal_area() {
            return lenght * depth;
        }

        float cal_volume() {
            return lenght * depth * height;        }
};


int main() {
    Room room1("master bed", 15, 15, 12);

    std::cout << room1.name << " lenght: " << room1.lenght << " and area: " << room1.area << std::endl;
    std::cout << room1.name << " lenght: " << room1.lenght << " and area: " << room1.cal_area() << std::endl;

    return 0;
}



```

### Private and Public Members
When using the keyword `private`, the data memebers and functions from the class cannot be accessed by another function. Using the same example from above:
```cpp
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



### Inheritance

It allows us to create a new class of objects derived from an existing class. the derived class inherits the features of the base class. examples below:
```cpp
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
```cpp
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
```cpp
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
```cpp
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
```cpp
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
```cpp
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
```cpp
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
```cpp
// cpp program to demonstrate the working of friend class

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
```cpp
template <class T>
T someFunction(T arg) {
   ... .. ...
}
```
example:
```cpp
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
```cpp
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






