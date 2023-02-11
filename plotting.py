import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0,100,0.1)

y = x*x*x

z = x*x

plt.plot(x,z, label = "quadratica")
plt.plot(x,y, label = "cubica")
plt.legend()
plt.show()
plt.savefig("plot_try")