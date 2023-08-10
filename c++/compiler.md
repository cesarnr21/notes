# Compilation Proccess
Compilation proccess between `C` and `C++` is almost the same

**Compiler &rarr; Linker &rarr; Executable**

* [Compilation Proccess](#compilation-proccess)
    * [Compiler](#compiler)
    * [Linker](#linker)
  * [Macros](#macros)
      * [#include](#include)
      * [#define](#define)
    * [Conditional Compilation](#conditional-compilation)
      * [Difference Between #if and #ifdef](#difference-between-if-and-ifdef)
    * [Predefined Macros](#predefined-macros)
  * [C and C++ Compilers](#c-and-c-compilers)
* [Compilation Methods](#compilation-methods)
  * [Make \& Makefiles](#make--makefiles)
    * [.PHONY Targets](#phony-targets)
    * [Variables, GNU functions and patterns](#variables-gnu-functions-and-patterns)
  * [CMake](#cmake)
    * [Basic `CMakeLists.txt`](#basic-cmakeliststxt)
      * [Build/Compile](#buildcompile)
      * [Install](#install)
      * [Testing](#testing)
    * [Sample CMakeLists.txt files](#sample-cmakeliststxt-files)
    * [More commands](#more-commands)

### Compiler
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

### Linker

1. combine all `.obj` files into a single executable program by replacing the references of the undefined symbols with the correct addresses
2. linking library files and programs
3. checks that cross-file dependencies are resolved properly
    - to create an executable from object files:
    ```bash
    $ ld -o [ file_name ] [ file_name.o ] [ other_libraries ]
    ```

Most errors with missing or multiple declarations happen here

> Note: when compiling a c/c++ file without main function, the linker will throw up an error
> `undefined symbols for architecture`
> To compile several files separate and then combine them, use a `-c` flag


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

## C and C++ Compilers
* Clang, used by Apple devices
* GNU used by Linux

Some compiler flags:
* `-c`
* `-fpic`
* `-Wall`
* `-Werror`

---

# Compilation Methods

## Make & Makefiles

- To preview the build proccess, use `make -n`


**Reference: <https://opensource.com/article/18/8/what-how-makefile>**

Use makefiles to build/compile projects. 
Parts of a Makefile:
- **Target:** works like a function or declaring a function
- **Prerequisites/Dependencies** 
- **Recipe:** The actual commands to be executed

```makefile
target: prerequisites
    recipe
```


**Multiple Targets:** with mutliple targets, the first target will be assigned as the **default target** and it will be the only one executed.
```makefile
say_hello: # default target
  @echo "Hello World"

generate: 
  @echo "Creating empty text files"         # adding `@` stops the entire command from being echoed
  touch file-{1..10}.txt                    # this command will be completely shown

clean:
  @echo "Cleaning up.."
  rm *.txt
```
the output of the makefile above will only be: `Hello World`
to set the **default target** use
```makefile
.DEFAULT_GOAL := [target_name]
```

Run multiple targets. use `all` as the default target `(by placing it first)` and and call the rest of the targets a sub targets
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

### .PHONY Targets
When the target is a file, `make` will only recompile a file if it has changed, so if the target isn't file, then declared as a `.PHONY` target.  
`make` will run it's recipe regradless if there is a file with the same target name, or whether that file has changed



### Variables, GNU functions and patterns
**GNU Make Documentation: <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>**
**Make Tutorial with several options (if/else statements, variables, etc): <https://makefiletutorial.com/>**
A Makefile to compile a single file `hello.c`
```makefile
# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

# define two .PHONY targets
.PHONY = all clean

all: hello

hello: hello.o
  @echo "Checking.."
   gcc -lm hello.o -o hello

hello.o: hello.c
  @echo "Creating object.."
  gcc -c hello.c

clean:
  @echo "Cleaning up..."
  rm -rf hello.o hello
```

Makefile above rewritten to use variables and compile two files `hello.c` and `bye.c` or more. Also, use GNU function `wildcard` and `substitution reference`
```makefile
# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

# define two .PHONY targets
.PHONY = all clean

# compiler to use
CC := gcc

# flags to be used in recipe
LINKERFLAG := -lm

SRCS := $(wildcard *.c)         # `$wildcard [pattern]` is a function that will create of files that match the pattern, in this case files with `.c` type
OBJS := $(SRCS:.c=.o)           # substitution reference for object files
BINS := $(SRCS:%.c=%)           # substitution reference for executables

all: ${BINS}

%: %.o                          # substitution reference
	@echo "creating executable $@"
	${CC} ${LINKERFLAG} $< -o $@
	@echo ""

%.o: %.c                        # substitution reference
	@echo "compiling object $@"
	${CC} -c $<
	@echo ""

clean:
	@echo "Cleaning up..."
	rm -rf ${OBJS} ${BINS}

display:
	@echo "source files list: ${SRCS}"
	@echo "object files list: ${OBJS}"
	@echo "executables list: ${BINS}"
```

another use of a variable can be used to group multiple things together for example:
```makefile
# variables
cc := gcc
objects := main.o kbd.o command.o display.o insert.o search.o files.o utils.o

# Example Makefile

# Get the path for where this Makefile lives
MAKEFILE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: test
test:
	@echo "+ $@"
	@echo "Working Directory: ${MAKEFILE_DIR}"

```
useful help target that can be placed at the bottom of a file
```makefile
help:
	@awk 'BEGIN {FS = ":.##"; printf "Usage: make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_-]+:.?##/ { printf "  \033[36m%-10s\033[0m %s\n",    $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
```

## CMake
**difference between Make and CMake?**  
CMake is higher level than make, and can actually be used to generate Makefiles. It is used more for cross-platform applications. Makefiles for Linux will often not work on MacOS and will not work on Windows, whereas CMake can be used to generate platform specfic Makefiles

**cmake tutorial: <https://cmake.org/cmake/help/latest/guide/tutorial/index.html>**

### Basic `CMakeLists.txt` 
Basic cmake commands.
- first command is **`cmake_minimum_required(VERSION <min>...<max>)`** the max `...<max>` is optional
- then **`project(<name>)`** to set up the project name and optional `project(<name> VERSION <version#>)`
- **`add_executable(<name> <source_file>)`** create an excutable using the specified source code

* `set(variable <file directory>)` can be used to make a variable
* `message("message here")` can be used to print messages
* `list` can be used to create a variable that store a lists of objects. Also allows new operations (append, sort, insert, etc)

#### Build/Compile
With multiple directories for a project, at the root directory of the project, is the main `CMakeLists.txt` file, but each project subdirectory also has their own `CMakeLists.txt` file.

- **`add_library()`** is used add directories that have source files needed to compile project. It's included at `CMakeLists.txt` file in the subdirectory. syntax/optional: `add_library(<name> <source_files>)`

- Then use **`add_subdirectory()`** to add that library to the main `CMakeLists.txt` file. syntax/optional: `add_subdirectory(<library_name>)`

- Then, the library target is linked to the executable target using **`target_link_libraries()`**. This makes sure that the library is also built. syntax/optional: `target_link_libraries(<executable> <interface> <library_name>)`

- Add the library's header file location and add the library subdirectory with **`target_include_directories()`**. This is done so that the target can import the headers from the library

- Types of Libraries: **PUBLIC | PRIVATE | INTERFACE | SHARED | STATIC | MODULE**
    + **STATIC** Libraries serve as archives of object files that are used when linking tagets
    + **SHARED** Libraries on the other hand are linked dynamically and are loaded at runtime

> sometimes these libaries can be optional: <https://cmake.org/cmake/help/latest/guide/tutorial/Adding%20a%20Library.html#exercise-2-making-our-library-optional>

#### Install
- **`install()`** is used to install libraries, headers, and executables
    + install libraries to the `lib/` directory
    + install headers to the `include/` directory
    + install executable to `build/` directory

#### Testing
CMake uses **CTest** for tests
1. Enable testing with **`enable_testing()`**
2. Use **`add_test()`** to add a test.
    + syntax: `add_test(<name> <command> <executable> <parameters>)`


### Sample CMakeLists.txt files
Project Structure:
```
.
├── CMakeLists.txt
├── tutorial.cxx
└── lib
    ├── CMakeLists.txt
    └── source.cxx
```

File `./CMakeLists.txt`
```cmake
cmake_minimum_required(VERSION 3.10)
project(tutorial)

# Set C++ standard to 11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD REQUIRED True)

add_executable(tutorial tutorial.cxx)

# Linking for Compiling/Build
target_link_libraries(tutorial PUBLIC ${EXTRA_LIBS})
target_include_directories(tutorial PUBLIC "${PROJECT_BINARY_DIR}")

# Installing
install(TARGETS Tutorial DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h" DESTINATION include)
```

File `./lib/CMakeLists.txt`
```cmake
add_library(MathFunctions source.cxx)

target_include_directories(library_name INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

# link our compiler flags interface library
target_link_libraries(MathFunctions tutorial_compiler_flags)

# install libs
set(installable_libs MathFunctions tutorial_compiler_flags)
install(TARGETS ${installable_libs} DESTINATION lib)

# install include headers
install(FILES MathFunctions.h DESTINATION include)
```

### More commands
- `find_package()` can let you search for c/c++ libraries and include them in the project
- `set(CMAKE_CXX_STANDARD <c++ standard>)` and `set(CMAKE_CXX_STANDARD REQUIRED True)` to enable support for a specific C++ standard.
> Note: the standard has to be set before any call to `add_executable()`
- `target_include_directories(<target> <interface> <path>)` this specifies the include directories when compiling a target. `interface` can be either `PRIVATE` or `PUBLIC`
- `target_compile_options()` can be used to add options to the compile process for the target
- `add_custom_command()` <https://cmake.org/cmake/help/latest/guide/tutorial/Adding%20a%20Custom%20Command%20and%20Generated%20File.html>


