import numpy as np
import matplotlib.pyplot as plt

v = 340
f = 1e6
ts = 1 / f

tx_long = np.loadtxt('rf_signals/tx_long.dat')
rx_long = np.loadtxt('rf_signals/rx_long.dat')

ltx = len(tx_long)
n = np.arange(-ltx+1, ltx)
r = np.correlate(rx_long, tx_long, 'full')

fig, ax = plt.subplots()
ax.plot(n, r)

l10 = int(ltx / 10)
j = -1
d = np.zeros(10)
for i in range(0, ltx - l10 + 1, l10):
    j += 1
    tx = tx_long[i:i + l10 - 1]
    rx = rx_long[i:i + l10 - 1]
    ni = np.arange(-l10 + 1, l10)
    ri = np.correlate(rx, tx, 'full')
    d[j] = (ni[np.argmax(ri)] * ts * v) / 2
    print(f"{j} d = {d[j]}")

plt.show()
