import os
from matplotlib import pyplot as plt
from matplotlib_venn import venn3, venn3_circles

set1 = set(['A', 'B', 'C', 'D'])
set2 = set(['B', 'C', 'D', 'E'])
set3 = set(['C', 'D',' E', 'F', 'G'])

venn3([set1, set2, set3], ('Set1', 'Set2', 'Set3'))
name = os.path.basename(__file__)
plt.savefig(("/out/%s.svg" % name), format='svg', bbox_inches='tight')

