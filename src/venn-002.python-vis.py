import os
from matplotlib import pyplot as plt
import numpy as np
from matplotlib_venn import venn2, venn2_circles
from matplotlib_venn import venn3, venn3_circles

figure, axes = plt.subplots(2, 2)
venn2(subsets={'10': 1, '01': 1, '11': 1}, set_labels = ('A', 'B'), ax=axes[0][0])
venn2_circles((1, 2, 3), ax=axes[0][1])
venn3(subsets=(1, 1, 1, 1, 1, 1, 1), set_labels = ('A', 'B', 'C'), ax=axes[1][0])
venn3_circles({'001': 10, '100': 20, '010': 21, '110': 13, '011': 14}, ax=axes[1][1])

name = os.path.basename(__file__)
plt.savefig(("/out/%s.svg" % name), format='svg', bbox_inches='tight')
