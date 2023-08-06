# Python Bindings
Use C and C++ code/libraries in Python. **reference: <https://realpython.com/python-bindings-overview/#python-bindings-overview>**

**Marshalling** is the process of transforming the memory representation of a data object to make it suitable for storage/transmission. This is needed since Python and C/C++ store data in different ways, a `uint8_` integer in C will only take up 8 bits of memory, whereas all variables in python will take up multiple bytes.

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

- **Cython**
    + not a bindings packaage, but a compiler for python which use uses c datatypes and allows you to write python code that is much faster
