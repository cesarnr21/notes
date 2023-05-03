# Compilation Proccess
Compilation proccess between `C` and `C++` is almost the same

**Compiler &rarr; Linker &rarr; Executable**

#### Compiler
1. **Preprocessor**
    - Header files on the other hand, can be opened multiple times during prepprosseing, dependingn how many source files or other header files include them
    - The compiler will run a preproccesor on the source files, this is the only time when the preprossesor and the compiler open the file.
        - the preprossesor will create a tranlation file from the source file, insert content from the header files at `#include` and remove code if `#if`, `#ifdef`, etc are evaluated to `false`.
        - to get a translation file, use `E-`:
        ```bash
        # creates file -> file_name.i
        $ gcc -E [ file_name.cpp ] -o [ file_name.i ]
        ```
        - preprocessed files are sent to the compiler for compilation


2. during compilation, the compiler checks for errors and converts it to assembly.
    - to see assembly code use `-S`:
    ```bash
    # creates assembly file -> file_name.s
    $ gcc -S [ file_name.i ]
    ```

3. then the back-end assembler makes it into binary  **object files (name.o, name.obj)**, if the program is made up of 3 `.cpp` files, then 3 `.obj` files are created 
    - to create an object file from an assembly file, use:
    ```bash
    $ as -o [ file_name.o ] [ file_name.s ]
    ```


    - object files contain the compiled code of the symbols defined in the input file, but not all symbols have to be defined.

> only files that are changed then have to recompiled

Most compiler errors usually come from syntax errors or logic

#### Linker

1. combine all `.obj` files into a single executable program by replacing the references of the undefined symbols with the correct addresses
2. linking library files and programs
3. checks that cross-file dependencies are resolved properly
    - to create an executable from object files:
    ```bash
    $ ld -o [ file_name ] [ file_name.o ] [ other_libraries ]
    ```

Most errors with missing or multiple declarations happen here


## Macros
#### #include
difference between `<header.h>` and `"header.h"` are is that using the former looks for header files in the standard list of system directories, while `"header.h"` looks for header files in the current order:
1. in the directory containing the current file
2. in the qoute directories
3. in the standard list of system directories

#### #define
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

#### Difference Between #if and #ifdef
is that `#ifdef` checks where the macro exist (is defined) whereas `#if` checks the value of the macro and will execute if the value of the macro is not zero

- `#ifdef` checks if the Macro exist, is defined
```c
#ifdef MACRO
  // conditional code
#endif
```

- `#if` checks the value of the macro is not 0, but any integer.
> note: it cannot check decimals  

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
- `#else` can be used to perform something if the `#if` is false
```c
#if expression
  // conditional code
#else
  // conditional code
#endif
```
- `#elif` can be used with `#if` and `#else`
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

- `#defined` used with `#if` to test if the macro is defined.  
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


---


# Compilation Methods

## Make & Makefiless
**Reference: <https://opensource.com/article/18/8/what-how-makefile>**

Use makefiles to build/compile projects. 
Parts of a Makefile:
- **Target:** works like a function or declaring a function
- **Prerequisites/Dependencies:** 
- **Recipe:** The recipe use prerequisites to make a target
an example with multiple targets and prerequisites.

  ```makefile
  # the prerequisites below are anther sub target 'sub_target' and a source c file
  fina_target: sub_target final_target.c # our final target
    recipe_to_create_final_target

  sub_target: sub_target.c
    recipe_to_create_sub_target
  ```
**Multiple Targets:** with mutliple targets, the first target will be assigned as the default target and it will be the only one executed.
```makefile
say_hello: # default target
  @echo "Hello World"

generate: 
  @echo "Creating empty text files"
  touch file-{1..10}.txt

clean:
  @echo "Cleaning up.."
  rm *.txt
```
the output of the makefile above will only be: `Hello World`
to set the default target use
```sh
.DEFAULT_GOAL := target_name
```

Now let's run multiple targets. use `all` as the default target and call as sub target as you want
```makefile
all: say_hello generate # call sub targets say_hello and 

say_hello:
  @echo "Hello World"

generate:
  @echo "Creating empty text files..."
  @touch file-{1..10}.txt

clean:
  @echo "Cleaning up..."
  rm *.txt

.PHONY: all say_hello generate clean
```

### Variables and Patterns
declaring a variable for a makefile
```makefile
cc := gcc
```

[example](https://opensource.com/article/18/8/what-how-makefile)
```makefile
# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = gcc                        # compiler to use

LINKERFLAG = -lm

SRCS := foo.c
BINS := foo

all: foo

foo: foo.o
  @echo "Checking.."
   gcc -lm foo.o -o foo

foo.o: foo.c
  @echo "Creating object.."
  gcc -c foo.c

clean:
  @echo "Cleaning up..."
  rm -rvf foo.o foo
```
another use of a variable can be used to group multiple things together for example:
```makefile
# variables
cc := gcc
objects := main.o kbd.o command.o display.o insert.o search.o files.o utils.o

# the target 'edit' will execute all the other targets
edit : $(objects)
  cc -o $(objects)
```

## CMake
**difference between Make and CMake?**  
CMake is higher level than make, and can actually be used to generate Makefiles. It is used more for cross-platform applications. Makefiles for Linux will often not work on MacOS and will not work on Windows, whereas CMake can be used to generate platform specfic Makefiles

