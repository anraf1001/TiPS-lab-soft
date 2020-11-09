import numpy as np
import matplotlib.pyplot as plt

v = 340
f = 1e6
ts = 1 / f

tx_short = np.loadtxt('rf_signals/tx_short.dat')
rx_short = np.loadtxt('rf_signals/rx_short.dat')

n = np.arange(-len(tx_short) + 1, len(tx_short))
r = np.correlate(rx_short, tx_short, 'full')

fig, ax = plt.subplots()
ax.plot(n, r)

d = (n[np.argmax(r)] * ts * v) / 2
print(d)

plt.show()
