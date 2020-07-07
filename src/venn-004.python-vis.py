import os
from matplotlib import pyplot as plt
from matplotlib_venn import venn3, venn3_circles

set1 = set(['Observability', 'Security', 'Scalability', 'Elasticity'])
set2 = set(['Security', 'Scalability', 'Elasticity', 'Metering'])
set3 = set(['Scalability', 'Elasticity','Availability', 'Integrity', 'Governance'])

venn3([set1, set2, set3], ('Set 1', 'Set 2', 'Set 3'))
name = os.path.basename(__file__)
plt.savefig(("/out/%s.svg" % name), format='svg', bbox_inches='tight')

