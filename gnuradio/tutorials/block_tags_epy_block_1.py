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
            name='detection_counter',   # will show up in GRC
            in_sig=[np.float32],
            out_sig=[np.float32]
        )
        self.samples_since_dectection = 0


    def work(self, input_items, output_items):
        tag_tuple = self.get_tags_in_window(0, 0, len(input_items[0]))
        relative_offset_list = []

        for tag in tag_tuple:
            if (pmt.to_python(tag.key) == 'detect'):
                relative_offset_list.append(tag.offset - self.nitimes_read(0))

        relative_offset_list.sort()

        for index in range(len(output_items[0])):
            output_items[0][index] = self.samples_since_dectection

            if (len(relative_offset_list) > 0 and index >= relative_offset_list[0]):
                relative_offset_list.pop(0)
                self.samples_since_dectection = 0

            else:
                self.samples_since_dectection = self.samples_since_dectection + 1

        output_items[0][:] = input_items[0]
        return len(output_items[0])
