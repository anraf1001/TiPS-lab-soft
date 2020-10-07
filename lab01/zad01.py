import numpy as np
import matplotlib.pyplot as plt

A = 2.5
ts = 0.005
T = 4
f = 2

t = np.arange(0., T, ts)
y = np.sin(2 * np.pi * f * t) * A

fig, ax = plt.subplots()
ax.plot(t, y)
ax.set(xlabel='t [s]', ylabel='sin',
       title='Wykres funkcji sinus')
ax.grid()
plt.show()
