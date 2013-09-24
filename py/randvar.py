#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import sys

fig = plt.figure()
ax = fig.add_subplot(111)

counts = np.arange(1001)
maxi = 0
for line in open(sys.argv[1]):
        fs = line.split()
        if len(fs) > 3 and fs[-3] == 'Picked':
                i = int(fs[-1])
                if i > maxi:
                        maxi = i
                counts[i] += 1
print("%d" % maxi)

# the histogram of the data
n, bins, patches = ax.hist(counts, 50, normed=0, facecolor='green', alpha=0.75)
plt.show()
