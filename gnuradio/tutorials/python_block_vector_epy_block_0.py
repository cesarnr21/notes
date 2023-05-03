"""
Embedded Python Blocks:

Each time this file is saved, GRC will instantiate the first class it finds
to get ports and parameters of your block. The arguments to __init__  will
be the parameters. All of them are required to have default values!
"""

import numpy as np
from gnuradio import gr


class blk(gr.sync_block):  # other base classes are basic_block, decim_block, interp_block
    """Embedded Python Block example - a simple multiply const"""

    def __init__(self, vector_size = 16):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name = 'max hold block',   # will show up in GRC
            in_sig=[(np.float32, vector_size), (np.float32, vector_size)],
            out_sig=[(np.float32, vector_size), (np.float32, vector_size)]
        )
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).

    def work(self, input_items, output_items):
        """example: multiply with constant"""
        for port_index in range(len(input_items)):
            for vector_index in range(len(input_items[port_index])):
                max_value = np.max(input_items[port_index][vector_index])

                for sample_index in range(len(input_items[port_index][vector_index])):
                    output_items[port_index][vector_index][sample_index] = max_value

        return len(output_items[0])
