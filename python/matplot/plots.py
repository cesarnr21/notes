# has most of the instructions for plotting

import matplotlib.pyplot as plt
import numpy as np
from math import pi

# simple graph
x = [1,2,3]
y = [2,4,1]
plt.figure(1)
plt.plot(x,y)
plt.title('simple graph of x vs y')
plt.xlabel('x-axis')
plt.ylabel('y-axis')

"""
plt.show()

>note: to plot multiples figures at the same time, 
       just use show() once. the terminal will open 
       figure every time show() is shown
"""

# two lines in the same graph
plt.figure(2)
x1 = [1,2,3] 
y1 = [2,4,1] 
plt.plot(x1,y1,label = "line 1") 
x2 = [1,2,3]
y2 = [4,1,3]
plt.plot(x2,y2,label = "line 2") 
plt.xlabel('x-axis') 
plt.ylabel('y-axis') 
plt.title('Two lines on same graph') 
plt.legend() #show a legend with the line labels

#subplots
"""
		subplot arguments: subplot(nrows, ncolumns, index)
		>note: each subplot needs their own labeling

a better way to make subplots?
[https://matplotlib.org/3.1.0/gallery/subplots_axes_and_figures/subplots_demo.html]
"""

t = np.arange(0,2,0.01)
s1 = np.sin(2*pi*t)
s2 = np.sin(4*pi*t)
plt.figure(3)
plt.subplot(212)
plt.plot(t,s1, 'tab:red')
plt.title('Sub Plot of Sine Wave 1')
plt.xlabel('time(sec)')
plt.ylabel('amplitude')
plt.subplot(221)
plt.plot(t,s2, 'tab:blue')
plt.title('Sub Plot of Sine Wave 2')
plt.xlabel('time(sec)')
plt.ylabel('amplitude')
plt.subplot(222)
plt.plot(t,2*s2, 'tab:purple')
plt.title('Plot of of Sine wave 2 times 2')
plt.xlabel('time(sec)')
plt.ylabel('amplitude')

plt.show() # this function will all the plots that haven't been showed yet

"""
Questions

* Check if the order of arguments matter. example: can 'label' and 'tab' be used in different orders 
or does one need to come before the other?

* How does the positionting of the subplots work?
"""
