
# try to plot stock data in this program

import matplotlib.pyplot as plt
import csv

x = [ ]
y = [ ]
z = [ ]

# import data from file
with open('TSLA.csv','r') as file:
    data = csv.reader(file, delimiter = ',')
    i = 0
    for row in data:
        try:
            y.append(float(row[5]))
            z.append(float(row[4]))
            x.append(i)
            i = i + 1
        except:
            pass

plt.figure(1)
plt.plot(x, y, label = 'Closing Value')
#plt.plot(x, z, label = 'Volume Traded')
plt.title('Tesla Stock Peformance')
plt.xlabel('Day')
plt.ylabel('Value($)')
plt.legend()
plt.show()
