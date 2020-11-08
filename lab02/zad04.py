import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt

n = 20000000
u = -4.2
sigma = 2.3
r = u + sigma * np.random.randn(n)

u2 = np.mean(r)
sigma2 = np.sqrt(np.var(r))
print(u2)
print(sigma2)

bins_num = 50
fig, ax = plt.subplots()
num, bins, patches = ax.hist(r, bins_num, density=True)

ax.plot(bins, stats.norm.pdf(bins, u2, sigma2))

plt.show()
