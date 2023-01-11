
# GNU Radio Companion.

----------------------------------------------------------------------------------------

To open `.grc` files, download GNU Radio and GNU Radio Companion.
Open from terminal: `gnuradio-companion &` vs `gnuradio-companion`
Two files: `.grc` files which store flowgraphs and `.py`  

In the `options` block, the *Id* is the name of the python file. *Title* is the description of the flowgraph

## Python variables in GRC
GNU Radio Companion (GRC) uses python datatypes. numbers can be floating points or integers. type conversion (using `int()` or `float()`) can be done within variable blocks

GRC will display numbers in SI units. variables can also be strings, lists, tuples.

Also diffent dataype in block properties have different colors.
- `floats` are orange
- `ints` are green
- `strings` are purple

Each block acts like a function. These blocks can also take variable blocks as parameters, just by writing the passing the ID of the variable block.

You can also create dependent variables by passing ID of a variable to another block

It is possible to disable and enable different blocks

### List comprehension for GNU Radio
list compprehensions can be used to write functions in a variable. Example below
```py
# below, loop through a list, add 1 to all elements, and then multiply each by 2
list_variable = [0, 1, 2, 3]
list_commprehesion_example = [(i + 1) * 2 for i in list_variable]
```
In GNU radio, each variable block substitues a variable in python, where the `id` is the name of the variable and `value` is the value of the variable

## Signal Data Types
Every input and output port in a block will have a datatype. they are color coded. To see click `Help; Types`. You can change the datatypes by either going into the block, or using the up and down arrow keys.

To do a datatype conversion between blocks, you can use a **type converter** for example: **`Chart to Float Block`**

In GNU radio, `byte` and `char` data type is the same.

### Packing Bits
Packing bits into a byte important to represent binary data. The **`Pack K Bits`** block takes k bits and places them into a byte by *little endianess* (stores least significant bit first)

The **`Unpack K Bits`** block unpacks a byte into a string of bits. It complely undoes what the *Pack K Bits* block does.


## Blocks
These are used to create flowgraphs.  
Some below:

- **`Signal Source Block`**: this create a complex sinusoid
- **`QT GUI Frequency Sink Block`**: displays the magnitude of the frequency spectrum
- **`QT GUI Time Sink Block`**: displays the time domain
- **`Throttle Block`**: is used for the flow control in the absence of radio hardware
- **`Import Block`**: you can use this to import python modules directly on the flowgraph. For example, some blocks can use *numpy arrays*, so using the Import Block you can import the numpy module the same way as python.


### QT GUI Widgets
references: <https://wiki.gnuradio.org/index.php?title=Runtime_Updating_Variables>

These blocks allow interaction and modification to a flowwgraph while running. 
- The **`QT GUI Range`** for example works like a variable block. This block has a `start` and `stop` value, and also a `step` value for the slider.

- The **`QT GUI Chooser`** creates a drop down menu of pre determined options

### Hier Blocks and Parameters
Hierarchical Block or **Hier Block**. These are used to wrap together multiple blocks into a single block. To create one, highlight the blocks that will compose the Hier Block and select `more/create heir block`. This creates a new flowgraph. In the options block, change `generate options` to Hier Block.

A **Category** is where the block can be found in the block library, instead of **Core** where the rest of standard GNU blocks are located

In hier blocks there are *variables* and *parameters*. Variables exist internally in the block, where as parameters are interfaces for the block to accept a value from an external source. To add a parameter, use the **`parameter block`**. Variables and Parameters can't have the same name

A **`Pad Source Block`** and **`Pad Sink Block`** are needed to act as *input* and *output* ports.

Once the Hier Block is completed, use `Generate the Flow graph` and this will create a `.py` file and a `.yml` file in the `/home/$USER/.grc_gnuradio/` directory (For GNU Radio v3.8). If using GNU Radio v3.10, the files are saved in the same directory where the overall flowgraph is created.

### Streams and Vectors
Blocks can be connected using either **streams** or **vectors**.
- A **stream** carries 1 sample for each time instance and produces serialized data. It must have a data type
- A **vector** can carry multple samples per time instances. They can represent data in parallel

# Python Blocks
Embedded Python Block is a tool to prototype a block within a flowgraph. Within the Python Block, there is the *blk* class.
- **`gr.sync_block.__init__()`** you can add any parameters here
- `in_sg` is a list with the inputs for the block
- `ouit_sig` is a list with the outputs for the block
- `name` is a string with the name for the python block


## Messages
messages are an asynchronous way to send information between blocks.
- they are good at conveing control data
- mainting a consistent state across blocks
- there is no sample-clock based guarantee when the messages will arrive
- they are not associated with a specific sample like a tag
- message input and output ports do not need to be conected in grc
- message ports use the *polymorphic type (PMT)*
    - needs to import pmt module: `import pmt`

### Message Handler
first, it is neccessary to add `self.selector = True` under the `__init()__` function
the message handler is the function which is called when the message is received 
```py
def handle_msg(self, msg):
    self.selector = pmt.to_bool(msg)
```
the funcion `pmt.to_bool()` takes the mssage and converts it to python boolean data type.

## Block Tags
Tags are way to convey information along signals in a time-synchronous fashion. They are associated with specific RF samples. 
- `self.add_item_tag(output_port_number, absolute_index, key, value)`: adds them
- `tag_tuple = self.get_tags_in_window(input_port_number, relative_index_start, relative_index_stop))`: used to read them
- `tag_tuple = self.get_tags_in_window(input_port_number, 0, len(input_items[input_port_number])))`


# Signal Proccessing

## Low Pass Filter and Filter Taps
For Low pass filters, you can use the **`Low Pass Filter Block`**


# Out of Tree Modules (OOT)
**Reference: <https://wiki.gnuradio.org/index.php?title=Creating_Python_OOT_with_gr-modtool>**

To install and compile OOT modules, download these:
```sh
sudo apt-get install gnuradio-dev cmake libspdlog-dev clang-format
```

To create a OOT module use: `gr_modtool newmod module_name`
This creates a directory with files and code to make up the OOT module.

- **`apps/`**
- **`cmake/`**
- **`CMakelist.txt`**
- **`docs/`**
- **`examples/`**
- **`grc/`**: yaml files describing the blocks are stored here
- **`include/`**: overall cpp header file stored here
- **`lib/`**: main cpp and header file stored here
- **`MANIFEST.md`**
- **`python/`**: main python files are stored here

### Creating an OOT Block
To add a block to the gr-custom_module use `gr_modtool add oot_block_name`. to remove use `gr_modtool rm oot_block_name`. to see other avialable commands use `gr_modtool`

When creating a new block, it will ask you a couple questions:
- **Block Type**
- language (python/cpp)
- copyright holder:
- python QA Code

> note: if creating a cpp block, remember to add the datatype for the parameter

**Files added for Python OOT:**
- adds main python file to `python/` directory
- adds a yaml file to `grc/` directory
- also adds the new block to the `grc/CMakelist.txt` file so that the two files created are also installed the module is compiled and installed.

After editing the embedded python block inside the `python/`, the yaml file in the `grc/` directory needs to be edited to match the changes (edit the parameters, inputs, and outputs)

**Fies added for CPP OOT:**
- the main files for the operation files are added in the `lib/` directory. `block_name.cc` and `block_name.h`
- adds cpp header file to `include/module_name/` directory
- adds a yaml file to `grc/` directory
- also adds the new block to the `grc/CMakelist.txt` file so that the two files created are also installed the module is compiled and installed.

**Editing the CPP Block**  
First open the `block_name.h` to add add the variables that will hold the value of the block parameters. create the variables under:

```cpp
class block_name : public block_name
{
    private :
        // add here
        bool _selector; // to store the selector parameter
        
    public:
        // whatever
};
```
To defined the operation of the block, edit the `block_name.cpp` file:

```cpp
#include "multDivSelect_impl.h"
#include <gnuradio/io_signature.h>

namespace gr {
    namespace customModule {

        // add dtype below
        using input_type = float;
        using output_type = float;

        multDivSelect::sptr multDivSelect::make(bool selector) {
            return gnuradio::make_block_sptr<multDivSelect_impl>(selector);
        }


        /*
         * The private constructor
         */
        multDivSelect_impl::multDivSelect_impl(bool selector)
            : gr::sync_block("multDivSelect",
                             gr::io_signature::make(
                                 1 /* min inputs */, 1 /* max inputs */, sizeof(input_type)),
                             gr::io_signature::make(
                                 1 /* min outputs */, 1 /*max outputs */, sizeof(output_type)))
        {
            // store the value of the parameters here
            _selector = selector;
        }

        /*
         * Our virtual destructor.
         */
        multDivSelect_impl::~multDivSelect_impl() {}

        int multDivSelect_impl::work(int noutput_items, gr_vector_const_void_star& input_items, gr_vector_void_star& output_items) {
            auto in = static_cast<const input_type*>(input_items[0]);
            auto out = static_cast<output_type*>(output_items[0]);

            // Do <+signal processing+>

            // Tell runtime system how many output items we produced.
            return noutput_items;
        }

    } /* namespace customModule */
} /* namespace gr */
```

Now edit the yaml file.

**Writing YAML Files:**
```yml
id: this is the name of the block
label: this is the description for the block

parameters:
- id: unique_id
  label: human_readable_name
  category: these_are_used_with_large_sets
  dtype: data_type
  default: default_value
  hide: the_visibility_of_parameter
  options: 
  option_labels:
```


### Building and Installing OOT Block

 
Now that the block is written, create a `build/` directory on the top level directory of the custom_module. Enter that directory and use CMake to create makefiles for the module.

```sh
hostname:module_name/build$ cmake ..
```
After the make files are ready, use `make` to compile the module and then install the module for use:
```sh
make 
# and
sudo make install
sudo ldconfig
```

this adds the block to the Core of the GNU Radio Blocks, and can now be searched with the rest of the core
When making any changes to the python and yaml files, it is neccessary to recompiled and reinstall the module


## ZMQ Blocks
There are two groups, some for data stream and some for transporting messages. They come in Sink and Souce Block pairs:
- **PUB - SUB** is like broadcasting, the PUB block sends data that can be sent to multiple SUBS
- **PUSH - PULL** point to point link with equal peers
- **REQ - REP** is a point to point link, one reqeuest input gives a one reply output

