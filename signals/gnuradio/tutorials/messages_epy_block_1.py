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

    def __init__(self, num_samples_count = 128):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='selector_control',   # will show up in GRC
            in_sig=[np.complex64],
            out_sig=[np.complex64]
        )
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).
        self.num_samples_count = num_samples_count
        self.port_name = 'message_output'
        self.message_port_register_out(pmt.intern(self.port_name))
        self.state = True
        self.counter = 0

    def handle_msg(self, msg):
        self.selector = pmt.to_bool(msg)

    def work(self, input_items, output_items):
        """example: multiply with constant"""

        self.counter = self.counter + len(output_items[0])

        if (self.counter > self.num_samples_count):
            pmt_msg = pmt.from_bool(self.state)
            self.message_port_pub(pmt.intern(self.port_name), pmt_msg)
            self.counter = 0

        output_items[0][:] = input_items[0]
        return len(output_items[0])
