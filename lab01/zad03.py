import numpy as np
import matplotlib.pyplot as plt


def normalizuj(y):
    new_min = -1
    new_max = 1
    y_norm = ((y - np.min(y)) / (np.max(y) - np.min(y))) * \
        (new_max - new_min) + new_min
    return y_norm


y = np.loadtxt('sygnal.dat')

y_norm = normalizuj(y)

fig, ax = plt.subplots()
ax.plot(y)
ax.plot(y_norm)

np.savetxt('sygnal_norm_py.dat', y_norm)

plt.show()
