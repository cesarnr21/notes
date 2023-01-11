
#this program graphs a sin wave

import matplotlib.pyplot as plt
import numpy as np

time = np.arange(1,10,0.1)
position =  np.sin(time)
plt.plot(time, position)
plt.xlabel('Time')
plt.ylabel('position')
plt.show() #it looks like this is needed to show a plot
