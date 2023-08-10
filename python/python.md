
# Python Notes

[References](https://www.programiz.com/python-programming)

## Getting Started

> note: a new statement is created with a newline. to have statements that take up multiple lines use the (\) character*
syntax:

```py
a = 1 + 2 + 3 + \
    4 + 5 + 6 + \
    7 + 8 + 9
```
> comments: # for a single line and """ for multi line comments

**Docstrings (aka Documentation strings)**
these strings are used for documentation. they MUST have triple quotes after. example 
```py
def double(num):
    """Function to double the value"""
    return 2*num
print(double._doc_)
```
the code above will give output -> {function to double the value} or whatever is inside the triple quotes

**Constants** to use constants, declare them in a separate a module, a separate file with variables and functions, and then import them. example create a file 'constant.py'
```py
PI = 3.14
GRAVITY = 9.8
```
then in the file where you want to use them
```py
import constant

print(constant.PI)
print(constant.GRAVITY)
```

**Import**
you can either import entire module such as 'math' or 'time'
or you can also import specific functions or consants using the 'from' keyword. example:
```
>>> from math import pi
>>> pi
3.141592653589793
```

## namespace and scope

a name or indentifier is the name give to objects. '2' is the object stored and it is assiociated with name 'a'
Using the id() function, we can get the address of the function
```py
a = 2
print('id(2) =', id(2))
print('id(a) =', id(a))
```
since functions are objects too, a name can refer to them aswell. example
```py
def printHello():
    print("Hello")
a = printHello
a()
```
a **namespace** is a collection of names. A namespace containing all the built-in names is created when we start the Python interpreter and exists as long as the interpreter runs.
**scope** is the portion of a program from where a namespace can be accessed directly without interferance.
there are at least 3 nested scopes:

1. scope of the current function which has local names 
2. scope of the module which has global names
3. the outermost scope which has built-in names
 
 example:
 ```py
def outer_function():
    b = 20
    def inner_func():
        c = 30
a = 10
 ```
above 'a' is in the global namespace. 'b' is in the local namespace of the outer function and 'c' is in the local nested local namespace of the inner function

when we are inside the inner function, we can read and assign new values to 'c', and we can read the values of 'a' and 'b', however we can't assign new values to them.
if we try to assign a value to either 'a' or 'b' we will simply create a new variable that is part of the local namespace.
Using the keyword 'global' will allow us to make changes to the global name. example:
```py
def outer_function():
    global a
    a = 20

    def inner_function():
        global a
        a = 30
        print('a =', a)

    inner_function()
    print('a =', a)


a = 10
outer_function()
print('a =', a)
```
the output of the program will be a = 30, all three times

**Types of variables: Global and Local** Like in c++, there are global variables that can be accessed by any function in the program and there a local variables that can only be accessed by their respective functions
using the keyword 'global' is it possible to modify the global variable within a function. example:
```py
c = 1
def add():
    global c
    c = c + 2
    print("inside function: ", c)

add()
print("in main: ", c)
```

Global variables can be accessed across python modules by importing the modules where these are stored. for example example to access global variable 'x' from 'file' module:
```
import file
print(file.x)
```

## Import, Python Modules and Python Packages

the same way that we can access constants and values from other files(modules), we can also import functions. if we want to use a function 'add' from a python module 'example' use:
```
import example
print(example.add(2,3))
```
You can also import with renaming. example below:
```
import math as m
print("the value of pi is: ", m.pi)
```
we have renamed the math module as m. note that now we can't use math.pi to get the value of pi.
In addition, it is possible to import a single or multiple constant from a module, in order to not import the entire module. this is done using the keyword 'from' example:
```
from math import pi, e
print("The value of pi is: ", pi)
print("The value of e is: ", e)
```
when doing this we do not need the dot operator.

**Python Packages**
a packages are directories and modules are files. this means that packages contain may modules. this also means that packages can contain sub-packeges and more modules.
*note: a directory must have a file named '__init__.py' in order to be considered a package. this can either have code or be left empty*

You can access packages and modules using the dot operator.
example, if we wanted to use a function 'select_mode' from a module 'start' in a directory 'level' inside a directory 'game' , then we must reference the function with the full name. example:
```py
import game.level.start                  #import the module
game.level.start.select_mode(parameter)  #use the function from the module
```
above, 'game' and 'level' are directories(packages) and require the __init__.py file
and remember, if we only need the 'select_mode' function we can:
```py
from game.level.start import select_mode  #use the 'from' keyword
select_mode                               #now we can call the function directly
```

### Creating and Managing Python Virtual Enviroments
[Documentation Page 1](https://docs.python.org/3/tutorial/venv.html)  
[Documentation Page 2](https://docs.python.org/3/library/venv.html)


- **Create a Virtual Enviroment:** `python3 -m venv /path/env-name`. To make the current directory, the root directory for the enviroment, use: `python3 -m venv .`
- To activate the Virtual Enviroment use `source path/env-name/bin/activate`

> While here, the terminal will show you are inside the enviroment. this enviroment contains a different set of python packages than the global python enviroment

- To upgrade the version of python/pip in the enviromentm, use: `python -m venv /path/env-name --upgrade`
- To exit the enviroment use the `deactivate` command in any directory.

## Data Types 

to find out the data type of a variable use the type() function. example <type(a)> to find the data type of a

**list** 
[https://www.programiz.com/python-programming/list]
a list is a ordered sequence of items and they do not need to be the same datatype. example: a = [1, 2.2, 'string']

with python it is possible to use negative indexing to pick an individual item.
for example it is possible to use my_list[-1] to access the last item in the list. using my_list[-2] will give the second to last item

it is possible to slice and access a range of the list by using the ':' operator. example:
```py
# elements 3rd to 5th
print(my_list[2:5])

# elements beginning to 4th
print(my_list[:-5])

# elements 6th to end
print(my_list[5:])

# elements beginning to end
print(my_list[:])
```
you can insert an item into a list by squeezing them into an empty  slice
```py
odd = [1, 9]
odd[2:2] = [5,7] #inserts 5 and 7 starting in the second place
```
to delete an individual item or the entire list use 'del'
```py
my_list = ['a','b','c']
del my_list[2]   #delete item 3
del my_list      #delete the entire list
```

### Tuple

a tuple is a sequence that once created cannot be modified. they are defined by parentheses ()
however they can deleted using `del`
### strings
all of this rules apply the same for strings. 
to join multiple strings, use the '+' operator

### Set

A python **set** is a list with no order and is defined by braces {}. they also have unique values and will delete duplicates. example: 

```py
a = {1,2,2,3,3,3}
print(a)
```
the output will be: a = {1,2,3}

### Dictionary

**Dictionary** is a unordered collection of key and value(both of any datype) pairs. they are used when storing a lot of data. they are defined with braces. syntax: {key:value, key:value...}
example:
```
d = {1:'value', 'key':2}
print(type(d))
print("d[1] = ", d[1])
print("d['key'] = ", d['key'])
```
the outputs for the code will be: value and 2

**Converting Data Types**
to convert data types, simply use function such as float() and int().
examples:
```py
>>> int(10.6) #from float to integer
10
>>> int(-10.6) #from float to integer
-10
>>> float('2.5') #from string to float
2.5
>>> str(25) #from integer to string
'25'
>>> set([1,2,3]) #from list to set
{1, 2, 3}
>>> tuple({5,6,7}) #from set to tuple
(5, 6, 7)
>>> list('hello') #from string to list
['h', 'e', 'l', 'l', 'o']
```
However, none of the conversion above are permanent. to get around do something like
```
num = input('number')  #enter a number say 10
num = int(num) #now the value is officially made an interger
```

**operators** python uses the same operators as c.
However there are some differences. Examples:
```py
&& -----> 'and', # checks if both conditions are true 
|| -----> 'or', # is true if either condition is true
!= -----> 'not', # if the condition is false
== -----> 'is', # check if two variables are equal
=! -----> 'is not', #checks if two variable are NOT equal
```
**membership operators**
'in' and 'not in' are used to test whether a value or variable are found in sequence(string, list, typle, set, dictionary)
```py
x = 'Hello world'
y = {1:'a',2:'b'}

print('H' in x)
# Output: True

print('hello' not in x)
# Output: True

print(1 in y)
# Output: True

print('a' in y)
# Output: False
```

**Python Operator Overloading**
*some opperators can do multiples things in python. for example '+' sign can either add two numbers or merge two strings*




## Python Object Oriented Programming (OOP)

a **class** is a blueprint for an object. it contains all of the details about the name, colors, sizes, etc.
an **object** is the instantiation of a class.

imaginge you create a class like this.
```py
class operations():
    def __init__(self, num):
        # here declare stuff that should always be initiated
        self.num = num

    def square_num(self):
        return self.num**2
    
    def root_num(self):
        return int(self.num**(1/2))
```
then you can use the class like this.
```py
num = 4
from cal import operations

results = operations(num)
print("The number squared", results.square_num())
print("The the square root of the number", results.root_num())
```

defining a class in python using 'class'. you can create an object by calling the class similary to calling a function.
```py
class person:
  "This is a person class"
  age = 10

  def greet(self):
    print('Hello')

#create a new object of the person class
harry = person()
```

a **method** is a function inside the body of a class. they can be used to the define the behaviors of an object. examples:
```py
class parrot:
      # class attribute
      species = "bird"

      # instance attribute
      def __init__(self, name, age):
          self.name = name
          self.age = age

      # instance method
      def sing(self, song):
          return "{} sings {}".format(self.name, song)

      def dance(self):
          return "{} is now dancing".format(self.name)

# instantiate the parrot class
blue = parrot("blue", 10)
woo = parrot("woo", 15)

#acceess the class attributes
print("Blue is a {}".format(blue.__class__.species))
print("Woo is also a {}".format(woo.__class__.species))

# access the instance attributes
print("{} is {} years old".format( blue.name, blue.age))
print("{} is {} years old".format( woo.name, woo.age))

# call out instance methods
print(blue.sing("'Happy'"))
print(blue.dance())
```
the output to the code above is:
```
Blu is a bird
Woo is also a bird
Blu is 10 years old
Woo is 15 years old
Blue sings 'happy'
Blue is now dancing
```
above the class "parrot". the atributes of the class are defined inside the '__init__' method
our two objects are blue and woo
a class attribute is the same for all instances of the classes, example the species = "birds"
each instance of a classes can also have unique attributes

### Inheritance between classes

inheritance is a way of creating a new class for using the details from an old class without modifying it. example:
```py
class bird:
      def __init__(self):
          print("bird is ready")

      def whoIsThis(self):
          print("bird")

      def swin(self):
          print("swim faster")

class penguin(bird):
      def __init__(self):
          super().__init__
          print("penguin is ready")

      def whoIsThis(self):
          print("penguin")

      def run(self):
          print("run faster")

peggy = penguin()
peggy.whoIsThis()
peggy.swim()
peggy.run()
```
above 'penguin' is the child class of 'bird. output: 
```
bird is ready
penguin is ready
penguin
swim faster
run faster
```
**Polymorphism**
this allows us to use common interface for multiple forms of data. example:
```py
class parrot:
      def fly(self):
          print("parrot can fly")

      def swim(self)
          print("parrot can't swim")

class penguin:
      def fly(self):
          print("penguin can't fly")

      def swim(self)
          print("penguin can swim")

def flying_test()
    bird.fly()

blue = parrot()
peggy = penguin

flying_test(blue)
flying_test(peggy)
```
output:
```
parrot can fly
penguin can't fly
```

#### multiple inheritance

a class in a python can be derived from multiple base classes. example:
```py
class class1:
  pass

class class2:
  pass

class class3(class1, class2):
  pass
```
above, class3 is derived from both classes 1 and 2



## Basic Functions

### Flow Control: If statements and Loops

**If statement example**
in python, indentation is what determines what is part of the if statement. the body of the if statement is indicated by the indentation. The body starts with an indentation and the first unindented line marks the end.
example:
```py
num = 3
if num > 0:
    print(num, "is a positive number.")
print("This is always printed.")

num = -1
if num > 0:
    print(num, "is a positive number.")
print("This is also always printed.")
```
examples of if....elif....else
```py
if num > 0:
    print("Positive number")
elif num == 0:
    print("Zero")
else:
    print("Negative number")
```
**For Loops**
in python, for loops can be used to interate over a sequence(list, tuple, string). doing this is calle traveral.
example, the program below uses a for loop add up all of the numbers in the list:
```py
numbers = [6, 5, 3, 8, 4, 2, 5, 4, 11]

# variable to store the sum
sum = 0

# iterate over the list
for val in numbers:
  sum = sum+val

print("The sum is", sum)
```
the keyword 'break'  can be used to stop a for loop

**for loop with else**
the for loop can be used with else. the else part is executed if the items in the sequence used in for loop exhausts. example:
```py
digits = [0,1,5]
for i in digits:
  print(i)
else:
  print("No items left")
```
the output above will be '0','1','5', and 'No items left'
if the 'break' keyword is found, then the 'else' part will be ignored. example:
```py
student_name = input("Enter the name of the student: ")

marks = {'James':90, 'Jules':40, 'Arthur':77}
for student in marks:
  if student == student_name:
    print(marks[student])
    break
else:
  print("No marks for that student were found")
```
if the user inputs a name that matches one of the student names, then their grade will be outputed, if not then the else message will be printed.

**While Loop**
syntax ----> while test_expression: body of while
```py
#program to add all numbers from 1 to 10. 1+2+3....+n
n = 10
sum = 0
i = 1
while i <= n:
  sum = sum + 1
  i = i + 1
print("the sum is ", sum)
```
**while loop with else** they work the same way as they work for 'for loops'. they will only execute code when the while test_expression turns false
the keyword 'break' will also end the while loop and discard the 'else' part

#### Keywords: break and continue for loops, and pass statement

'break' will end the loop and move on to the next piece of code
'continue' will end the current iteration of the loop and and the loop continues with the next iteration

**Pass** statement is a null statement, meaning that the interpreter does not ignore the pass statement(unlike a comment), nothing happens when the 'pass' is executed
it is usually used like a placeholder. example, say if we have a loop, a class or a function that is not implemented yet, but we want to have them in the future, they can't have an empty body, so we can use 'pass' to give them a body that does nothing.
example:
```py
for anything in sequence:
  pass
```
or
```py
def function(anything)
  pass
```

### Python Functions

syntax for user-defined functions: 
```py
def function_name(parameters):
      """docstring"""
      statements
      return
```
def - defines and starts the function header. the return can return a value but this is optional
the docstring is a documentation string for what the function does. to see the string use _doc_. example:
```py
def greet():
      '''docstring'''

print(greet.__doc__)
```

**return** statement is used to exit a function and go back to the place from where it was called. example:
```py
num = int(input("enter a number: "))
```
**Scope and Lifetime of variables**
if a variable is declared inside the function, it is only visible inside the function. these are known as local variables. in addition, the only exits in memory while the function is running and once the function ends, the variables are destroyed

**Default Arguments**
to set a default argument, which will be overridden if another argument is assigned, and only be used if no argument is provided, use =. example:
```py
def greet(name, msg = "good morning"):
  print("Hello", name + ', ' + msg)

greet("kate")
greet("Bruce", "How are you")
```
in the code above, both calls are correct. since we provided a default argument for 'msg', it is not neccessary to provide the function with a second argument. however, it is necessary to always provide the function with a first argument for 'name'

**Arbitrary Arguments**
sometimes, we do not know the amount of arguments that will be passed into a function. it is necessary to work with an arbitrary number of arguments. examples:
```py
def greet(*names):
    for name in names:
      print("Hello", name)

greet("Monica", "Luke", "John")
```
above, we passed multiple arguments into a function. the arguments formed a sequence, and then were passed into the function.

### Python Recursion

a recursion is the proces of defining something in terms of itself.
a function can call another function, and it is possible for it to call itself. these are recursive functions. 
a base condition is needed to make sure the recursion stops. example:
```py
def factorial(x):
    """this is a recursive function to find the factorial of an interger"""

    if x == 1: #base condition, something like this is needed to make sure the recursion stops
      return 1
    else:
      return (x * factorial(x-1))

num = 3 
print("The factorial of", num, "is", factorial(num))
```

**Anonymyius or Lambda functions**
these functions are defined without a name. they are defined using the keyword 'lambda'
syntax ----> lambda arguments: expression. example:
```py
double = lambda x: x * 2
print(double(5))
```

### Exceptions

an exception is raised when your program encounters an error. the critical operation that can go wrong is placed inside the 'try' block and the code that handles the exception is inside the 'except' block
for example, the code below will divide 1 by values of a list. we import the 'sys' module to get the type of error.
```py
#import module sys to get the type of exception
import sys

list = ['a', 0, 2]

for entry in list:
    try:
      print("the entry is", entry)
      r = 1/int(entry)
      break
    except Exception as e:
      print("oops", e.__class__, "occurred.")
      print("next entry")
      print()
print("the reciprocal", entry, "is", r)
```
the outputs are below. as seen, when we try to divide 1 by either a or 0, you get an error but the program keeps going. when the input is 2, we get the right answer.
```py
#the first entry
The entry is a
Oops! <class 'ValueError'> occurred.
Next entry.

#the second entry
The entry is 0
Oops! <class 'ZeroDivisionError'> occurred.
Next entry.

#the third entry
The entry is 2
The reciprocal of 2 is 0.5
```

exceptions are raised when errors occur at runtime, but it is also possible to manually raise them the keyword 'raise'
```py
try:
  a = int(input("Enter a positive integer: "))
  if a <= 0:
    raise ValueError("That is not a positive number")
except ValueError as ve:
  print(ve)
```
you can also use 'try' with an else block
```py
# program to print the reciprocal of even numbers

try:
    num = int(input("Enter a number: "))
    assert num % 2 == 0
except:
    print("Not an even number!")
else:
    reciprocal = 1/num
    print(reciprocal)
```
also, the 'try' statement can be included an optional 'finally' block. no matter what happens, this code will always be executed. this is used to usually close files or disconnect from networks.

**User-Defined/Custom Exceptions**
to create custom exceptions, it is neccessary to create a class derived from the Exception class. Example:
```py
# define Python user-defined exceptions
class Error(Exception):
    """Base class for other exceptions"""
    pass

class ValueTooSmallError(Error):
    """Raised when the input value is too small"""
    pass

class ValueTooLargeError(Error):
    """Raised when the input value is too large"""
    pass

# you need to guess this number
number = 10

# user guesses a number until he/she gets it right
while True:
    try:
        i_num = int(input("Enter a number: "))
        if i_num < number:
            raise ValueTooSmallError
        elif i_num > number:
            raise ValueTooLargeError
        break
    except ValueTooSmallError:
        print("This value is too small, try again!")
        print()
    except ValueTooLargeError:
        print("This value is too large, try again!")
        print()

print("Congratulations! You guessed it correctly.")
```
**another example.**
```py
class SalaryNotInRangeError(Exception):
    """Exception raised for errors in the input salary.

    Attributes:
        salary -- input salary which caused the error
        message -- explanation of the error
    """

    def __init__(self, salary, message="Salary is not in (5000, 15000) range"):
        self.salary = salary
        self.message = message
        super().__init__(self.message)


salary = int(input("Enter salary amount: "))
if not 5000 < salary < 15000:
    raise SalaryNotInRangeError(salary)
```

### Comprehensions
A way to create lists, dictioraries, and sets without using loops.

**Example:**
```py
# Create a list to be used in comprehensions
numbers = [1, 2, 3, -3, -2, -1]

# Create a new list of these numbers’ squares
mylist = [x*x for x in numbers][1, 4, 9, 9, 4, 1]

# Create a new dictionary of these numbers’ exponentiation
mydict = {x: pow(10, x) for x in numbers}
# output {1: 10, 2: 100, 3: 1000, -3: 0.001, -2: 0.01, -1: 0.1}

# Create a set of these numbers’ absolutes

myset = {abs(x) for x in numbers}
# output {1, 2, 3}
```

### Python Iterators

an iterator is an object that can be iterated upon. iterable objects are list, tuples, strings, etc. 
using the `iter()` function in conjuntion with an iterable object returns an iterator. 
also using the `next()` function will iterate throught all the items of an iterator, until there is no more data. example:
```py
# define a list
my_list = [4, 7, 0, 3]

# get an iterator using iter()
my_iter = iter(my_list)

# iterate through it using next()

# Output: 4
print(next(my_iter))

# Output: 7
print(next(my_iter))

# next(obj) is same as obj.__next__()

# Output: 0
print(my_iter.__next__())

# Output: 3
print(my_iter.__next__())

# This will raise error, no items left
next(my_iter)
```
a way better way of doing the thing above is using a 'for loop' to print every element

### python generator

use a `yield` statement instead of a `return`. a function with atleast one `yield` statement is a generator
the different between `return` and `yield`
return: the return statement terminate the function completely
yield: the yield statement will pause the function, and if the function is called again, it will resume where it left off. example:
```py
# A simple generator function
def my_gen():
    n = 1
    print('This is printed first')
    # Generator function contains yield statements
    yield n

    n += 1
    print('This is printed second')
    yield n

    n += 1
    print('This is printed at last')
    yield n

# Using for loop
for item in my_gen():
    print(item)
```
output: 
```
This is printed first
1
This is printed second
2
This is printed at last
3
```
another example: the program below reverses a string
```py
def rev_str(my_str):
    length = len(my_str)
    for i in range(length - 1, -1, -1):
        yield my_str[i]


# For loop to reverse the string
for char in rev_str("hello"):
    print(char)
```
output: olleh

### Python Closures

References: <https://www.programiz.com/python-programming/closure>
A nested function is a function defined inside another function

### Python Decorator

contrinue: <https://www.programiz.com/python-programming/decorator>
A decorator can be used to add functionality to an existing code. this is also called **metaprogramming**

A function can be passed to another function as an argument. Example:
```py
def inc(x):
  return x + 1

def dec(x):
  return x - 1

def operate(func, x):
  result = func(x)
  return result

operate(dec,3) 
# output is 3 - 1 = 2

operate(inc,3)
# output 3 + 1 = 4
```
also a function ccan return another function
```py
def is_called():
  def is_returned():
    print("Hello Cesar")
  return is_returned

new = is_called()

new()
# calling 'new()' will make that equal, and a function can return another function
```

### Python Regular Expression (RegEx)

**Reference**
Programiz: <https://www.programiz.com/python-programming/regex>
Uses the **re** module <import re>
A **regular expression** is a sequence of characters that defines a search pattern. For example
```py
import re

pattern = '^a...s$' # this pattern is any 5 letter string starting with a and ending with s
test_string = 'abyss'
result = re.match(pattern, test_string) # match() function from the re module

if result:
  print("Search successful.")
else:
  print("Search unsuccessful.") 
```



## File Operations with Python

Steps: Open a file - read or write - close file: <https://www.programiz.com/python-programming/file-operation>
**Open and closing files**
Use the open function. for example:
```py
>>> f = open("test.txt")  # to open a file in the current directory
or
>>>f = open("C:/Python38/README.txt") # specifying a full path
```
It is possible to specify the mode while opening a file. The mode specification below:
```
'r' ----> opens in reading mode
'w' ----> opens in writing mode
'x' ----> opens a file for exclusive creation
'a' ----> opens a file for appending (adding data) at the end of the file
'+' ----> opens a file for updating (reading and writing)
't' ----> opens a file in text mode
'b' ----> opens the file in binary mode

examples:
f = open("test.txt", 'w') # opens the file in text mode for writing
f = open("img.bmp", 'r+b') # opens the file for reading and writing in binary mode
```
when working with files in text mode it is important to specify the encoding type.for linux 'utf-8'
syntax ----> f = open("test.txt", mode = 'r', encoding = 'utf-8')
to **close** the file you can use the close() function.
```py
f = open("test.txt", encoding = 'utf-8')
f.close()
```
but there is safer to make sure the file is closed.use try...finally. example:
```py
try:
  f = open("test.txt", encoding)
  # perform file operations
finally:
  f.close()
```
the best way to open and close file is with a 'with' block:
```py
with open("test.txt", encoding = 'uft-8')as f:
  #perform file operations
```
**Writing Files**
writing will overwrite into the file if it already exists. you write either a string for text files or a sqeunceof bytes for binary files.
```py
with open("/home/cesar/Documents/projects/python/test/new.txt", 'r+', encoding = 'utf-8') as f:
  f.write("a string\n")
  f.write("another string\n\n")
```
**Reading Files**
to read a file use read(size), the size is how much data it will read and return. If the read() is empty then it will read the entire file. Example:
```py
with open("new.txt", 'r', encoding = 'utf-8') as f:
  f.read(4) #read the firt 4 data, so like 4 characters from a string
  f.read() #read the rest of the file
```
we can change our current position using the seek() and tell() functions
```py
>>> f.tell() # get the current file position, in number of bytes
56

>>> f.seek(0) # return to the beginning of the fule
0

>>> print(f.read()) # read the entire files and prints it
>>> readline() #read an individual line
```

### Working with CSV Files

CSV -> comma separated value
[https://www.programiz.com/python-programming/csv]
We can use the open() to work with CSV files but there also is a dedicated CVS module. so we can 'import csv'
We can also read and write using functions from the csv module. example:
```py
import csv #import the module
with open("test.csv", 'r') as f: #open the module
  data = csv.reader(f) #read the data
  for row in data:
    print(row)
```
above we used thhe **csv.reader()** function to read data. its syntax is:
csv.reader(csvfile, dialect = 'excel', optional_parameters)

**csv.write()** 
use the function above to write data into the file. example:
```py
import csv
with open('protagonist.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["SN", "Movie", "Protagonist"])
    writer.writerow([1, "Lord of the Rings", "Frodo Baggins"])
    writer.writerow([2, "Harry Potter", "Harry Potter"])
```
**writing multiple rows from a 2-dimensional list**
```py
import csv
csv_rowlist = [["SN", "Movie", "Protagonist"], [1, "Lord of the Rings", "Frodo Baggins"],
               [2, "Harry Potter", "Harry Potter"]]
with open('protagonist.csv', 'w') as file:
    writer = csv.writer(file)
    writer.writerows(csv_rowlist)
```
**Writing to a CSV File with Tab Delimiter**
```py
import csv
with open('protagonist.csv', 'w') as file:
    writer = csv.writer(file, delimiter = '\t')
    writer.writerow(["SN", "Movie", "Protagonist"])
    writer.writerow([1, "Lord of the Rings", "Frodo Baggins"])
    writer.writerow([2, "Harry Potter", "Harry Potter"])
```
the syntax of the csv.writer() is:
csv.reader(csvfile, dialect = 'excel', optional_parameters)

**How to read a CSV files as a dictionary**
this can be dones using csv.DictReader(). its syntax is:
csv.DictReader(file, fieldnames = None, restkey = None)

for example if we have a 2 dimensional chart 'people':
```py
import csv
with open("people.csv",'r') as file:
     csv_file = csv.DictReader(file)
     for row in csv_file:
         print(dict(row))
```
**Using a dictionary to write a CSV File**
this is done sing csv.DictWriter() and its syntax is:
csv.DictWriter(file, fieldNames) 
file --------> the CSV file where you want to write
fieldName ---> a list object which should contain the column header specifying the order in which data should be written in the CSV files. examples:
```py
import csv
with open('players.csv', 'w', newline='') as file:
    fieldnames = ['player_name', 'fide_rating']
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerow({'player_name': 'Magnus Carlsen', 'fide_rating': 2870})
    writer.writerow({'player_name': 'Fabiano Caruana', 'fide_rating': 2822})
    writer.writerow({'player_name': 'Ding Liren', 'fide_rating': 2801})
```



## Useful Python Libraries

### unitest and pytest
for testing code, use `unittest`
to run unittest without `pytest`, use:
```py
if __name__ == '__main__':
    unittest.main()
```

### Textual
Develop Terminal based apps: <https://textual.textualize.io/>
