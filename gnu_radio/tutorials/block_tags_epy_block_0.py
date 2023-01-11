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

    def __init__(self, treshold = 1.0, report_period = 128):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='threshold_detector',   # will show up in GRC
            in_sig=[np.float32],
            out_sig=[np.float32]
        )
        self.threshold = treshold
        self.report_period = report_period

        self.timer = 0
        self.ready_for_flag = True

    def work(self, input_items, output_items):
        for index in range(len(input_items[0])):
            if (input_items[0][index] >= self.threshold and self.ready_for_flag == True):
                # define the key as 'detect'
                key = pmt.intern('detect')
                # get the detection value
                value = pmt.from_float(np.round(float(input_items[0][index]),2))
                # tag index to be written
                write_index = self.nitems_written(0) + index
                # add the tag object (key, value pair)
                self.add_item_tag(0, write_index, key, value )
                # tag has been written, set state
                self.ready_for_flag = False

            if (self.ready_for_flag == False):
                self.timer = self.timer + 1

            if (self.timer >= self.report_period):
                self.timer =0
                self.ready_for_flag = True



        output_items[0][:] = input_items[0]
        return len(output_items[0])
