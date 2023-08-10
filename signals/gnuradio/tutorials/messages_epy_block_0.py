"""
Embedded Python Blocks:

Each time this file is saved, GRC will instantiate the first class it finds
to get ports and parameters of your block. The arguments to __init__  will
be the parameters. All of them are required to have default values!
"""

import numpy as np
from gnuradio import gr
import pmt


class blk(gr.sync_block):  # other base classes are basic_block, decim_block, interp_block
    """Embedded Python Block example - a simple multiply const"""

    def __init__(self):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='multiplexer',   # will show up in GRC
            in_sig=[np.complex64, np.complex64],
            out_sig=[np.complex64]
        )
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).
        self.select_port_name = 'select_port'
        self.message_port_register_in(pmt.intern(self.select_port_name))
        self.set_msg_handler(pmt.intern(self.select_port_name), self.handle_msg)
        self.selector = True

    def handle_msg(self, msg):
        self.selector = pmt.to_bool(msg)

    def work(self, input_items, output_items):
        """example: multiply with constant"""
        if (self.selector):
            output_items[0][:] = input_items[0]
        else:
            output_items[0][:] = input_items[1]


        return len(output_items[0])

