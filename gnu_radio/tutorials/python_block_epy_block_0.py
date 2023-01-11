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

    def __init__(self, addition_flag = True):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='add or multiply block',   # will show up in GRC
            in_sig=[np.complex64,np.complex64],
            out_sig=[np.complex64]
        )
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).
        self.addition_flag = addition_flag

    def work(self, input_items, output_items):
        """example: add or multiply based on flag"""
        if (self.addition_flag == True):
            output_items[0][:] = input_items[0][:] + input_items[1][:]
        else:
            output_items[0][:] = input_items[0][:] * input_items[1][:]

        return len(output_items[0])
