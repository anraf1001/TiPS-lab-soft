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

binWidth = bins[1] - bins[0]
firstPoint = bins[0] + binWidth / 2
lastPoint = firstPoint + binWidth * (bins_num - 1)

midBinsPoints = np.arange(firstPoint, lastPoint + binWidth, binWidth)
ax.plot(midBinsPoints, stats.norm.pdf(midBinsPoints, u2, sigma2))

plt.show()
