import os
from matplotlib import pyplot as plt
import numpy as np
from matplotlib_venn import venn3, venn3_circles

plt.figure(figsize=(4,4))

v = venn3(subsets=(1, 1, 1, 1, 1, 1, 1), set_labels = ('A', 'B', 'C'))
v.get_patch_by_id('100').set_alpha(1.0)
v.get_patch_by_id('100').set_color('white')
v.get_label_by_id('100').set_text('Unknown')
v.get_label_by_id('A').set_text('Set "A"')
c = venn3_circles(subsets=(1, 1, 1, 1, 1, 1, 1), linestyle='dashed')
c[0].set_lw(1.0)
c[0].set_ls('dotted')
plt.title("Sample Venn diagram")
plt.annotate(
        'Unknown set',
        xy=v.get_label_by_id('100').get_position() - np.array([0, 0.05]),
        xytext=(-70,-70),
        ha='center',
        textcoords='offset points',
        bbox=dict(
            boxstyle='round,pad=0.5',
            fc='gray',
            alpha=0.1
            ),
        arrowprops=dict(
            arrowstyle='->',
            connectionstyle='arc3,rad=0.5',
            color='gray'
            )
        )

name = os.path.basename(__file__)
plt.savefig(("/out/%s.svg" % name), format='svg', bbox_inches='tight')
