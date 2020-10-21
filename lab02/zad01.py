import numpy as np
import matplotlib.pyplot as plt
from scipy import signal


def count_ff(signal):
    rms = np.sqrt(np.mean(np.abs(signal)**2))
    srb = np.mean(np.abs(signal))

    return rms / srb


dt = 1e-5
A = 5.12
f = 5
t = np.arange(0., 2., dt)
y = A * (signal.sawtooth(2 * np.pi * f * t) + 1) / 2

fig, ax = plt.subplots()
ax.plot(t, y)
ax.grid()

print(count_ff(y))

y_dat = np.loadtxt('form.dat')
print(count_ff(y_dat))
ax.plot(t, y_dat)

plt.show()
