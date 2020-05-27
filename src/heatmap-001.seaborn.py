import os

import numpy as np
import seaborn as sn
import matplotlib.pyplot as plt
data_plot = np.random.rand(6,5)
map = sn.heatmap(data_plot)
plt.show()

plt.title("A heatmap")

name = os.path.basename(__file__)
plt.savefig(("/out/%s.svg" % name), format='svg', bbox_inches='tight')

