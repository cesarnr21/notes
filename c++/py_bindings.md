# Python Bindings
Use C and C++ code/libraries in Python. **reference: <https://realpython.com/python-bindings-overview/#python-bindings-overview>**

**Marshalling** is the process of transforming the memory representation of a data object to make it suitable for storage/transmission. This is needed since Python and C/C++ store data in different ways, a `uint8_` integer in C will only take up 8 bits of memory, whereas all variables in python will take up multiple bytes.

* [Python Bindings](#python-bindings)
  * [PyBind11](#pybind11)
    * [Proccess](#proccess)
      * [PYBIND11\_MODULE](#pybind11_module)
      * [Classes](#classes)
    * [Build with setuptools](#build-with-setuptools)
    * [Integration with CMake](#integration-with-cmake)
  * [ctypes](#ctypes)
      * [1. Load the Library](#1-load-the-library)
      * [2. Wrap the input paramets](#2-wrap-the-input-paramets)
      * [3. Define the return type of the function](#3-define-the-return-type-of-the-function)
  * [Other](#other)

---

## PyBind11
* Used for C++11 and newer
* Like CFFI, creates a separate python module
* unlike CFFI, the bindings are defined with C++ code instead of Python
* supports C++ classes unlike ctypes and CFFI
* Dynamic attributes
    + In Python, attributes can be added dynamically, meaning that new attributes can assigned after the object was created.
    + in C++, the only attributes avialable are those explicitly defined in the `class`

### Proccess
> basic use: [PyBind11 Documentation](https://pybind11.readthedocs.io/en/stable/basics.html)
* Write a simple function with C++. To create bindings then add the `pybind11` code/macro.

* Example File:
    ```c++
    #include <pybind11/pybind11.h> // pybind header

    namespace py = pybind11;

    float add_nums(float num1, float num2) {
        float result = num1 + num2;

        return result;
    }

    /* define the python module using the pybind macro
     * PYBIND11_MODULE(module_name, variable_type)
     * use `def` to define a function for use in Python
        * variable_type.def("python_function_name", c++_function_pointer, "function documentation")
     *
     */
    PYBIND11_MODULE(cal, handle) {
        handle.doc() = "The documentation for the module goes here";
        handle.def("add_nums", &add_nums, "a function that adds two numbers");
    }
    ```

* Compile file above using:
    ```sh
    c++ -O3 -Wall -shared -std=c++11 -fPIC $(python3 -m pybind11 --includes) [file_name.cc] -o [module_name]$(python3-config --extension-suffix)
    ```

* Import into python and call function
    ```py
    import cal

    result = cal.add_nums(2, 4)
    print(result)
    ```

#### PYBIND11_MODULE
> [reference](https://pybind11.readthedocs.io/en/stable/reference.html#_CPPv4I0DpEN7module_3defER7module_PKcRR4FuncDpRK5Extra)

The Macro creates the entry point to be used the Python interpreter imports the module. The Macro has two inputs `module_name` and `variable_type`
There are 3 common variable types:
* `handle`
* `m`
* `class`

#### Classes
To create bindings for a *struct* or a *class*, use `class_`

```c++
struct Pet {
    Pet(const std::string &name) : name(name) { }
    void setName(const std::string &name_) { name = name_; }
    const std::string &getName() const { return name; }

    std::string name;
};

// PyBind11 Code
#include <pybind11/pybind11.h>

namespace py = pybind11;

PYBIND11_MODULE(example, m) {
    py::class_<Pet>(m, "Pet")
        .def(py::init<const std::string &>())
        .def("setName", &Pet::setName)
        .def("getName", &Pet::getName);
}
```
The function `init` is used to wrap the the corresposding class construcutor

### Build with setuptools
Reference: <https://pybind11.readthedocs.io/en/stable/compiling.html>
You could call cmake from the `setup.py` script

### Integration with CMake
Useful to integrate PyBind11 with CMake to simplify the compiling proccess for more complex C++ code. Example `CMakeLists.txt` in the root directory

```cmake
cmake_minimum_required(VERSION 3.22)
project(cal)

# can be useful to include the pybind11.h header from the PyBind11 python package
find_package(Python COMPONENTS Interpreter Development)
add_subdirectory(pybind11)

pybind11_add_module(cal cal.cc)
```

* After writing the `CMakeLists.txt` file, run `cmake .` to create Makefiles
* Run `make` to finish compiling the C++
* Import the module in Python and use it.

---

## ctypes
`ctypes` is the package in the standard python library for creating python bindinga to call low level libraries and marshalling data between python and C. To create the python bindings for the example file below, use `ctypes`:

**Example C++ file**
```c++
#include <iostream>

float cmult(int int_param, float float_param) {
    float return_value = int_param * float_param;
    std::cout << "In cmult : int: " << int_param  << "float << " << float_param << "returning" << return_value << std::endl;
    return return_value;
}
```

#### 1. Load the Library
**reference: <https://docs.python.org/3.5/library/ctypes.html#loading-shared-libraries>**
1. Compile the C/C++ files into [position-independent code](https://www.google.com/search?q=position-independent+code&oq=position&aqs=chrome.0.69i59j69i57j0i20i263i433i512j0i67i433i650j0i433i512j69i60l3.1531j0j7&sourceid=chrome&ie=UTF-8) using: `gcc/g++ -c -Wall -Werror -fpic [ source_file.cc ]` for individual files
2. Create a **shared library** file from the object file: `gcc/g++ -shared -o [ libary_name.so ] [ object_file.o ]`
    * reference: <https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html>
3. Load the shared library using ctypes, for example, create a `CDLL` object with the full path of the library
    ```py
    import ctypes

    library = ctypes.CDLL('shared_library_path/library.so')
    ```

#### 2. Wrap the input paramets
Note the datatypes for the parameters for the `cmult()` function above, `int_param` is an integer and `float_param` is a float.

Any parameters passed to `ctypes` are assumed to be integeres, or the need to be defined explictly.
```py
x = 6

# explictly cast y as c type float
y = ctypes.c_float(2.3)

answer = library.cmult(x, y)
```

#### 3. Define the return type of the function
`ctypes` also assumes that the function will return integers, therefore, the return value could be mashalled incorrectly.

```py
c_lib.cmult.restype = ctypes.c_float
answer = library.cmult(x, y)
```

---

## Other

There are other Python packages that can be used to create python bindings for c and c++
- **C Foreign Function Interface (CFFI)** for Python
    + scales better for bigger for bigger projects, automation
    + needs a python program that will create the bindings and create a python module
    + once the new module is installed, it can be imported anywhere

- **PyBind11**
    + Used for C++11 and newer
    + Like CFFI, creates a separate python module
    + unlike CFFI, the bindings are defined with C++ code instead of Python
    + supports C++ classes unlike ctypes and CFFI
    + Dynamic attributes

`c++ -O3 -Wall -shared -std=c++11 -fPIC $(python3 -m pybind11 --includes) cesar.cc -o cal$(python3-config --extension-suffix)`


- **Cython**
    + not a bindings packaage, but a compiler for python which use uses c datatypes and allows you to write python code that is much faster
