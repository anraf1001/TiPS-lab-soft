import numpy as np
import matplotlib.pyplot as plt

ts = 10e-3
signal = np.loadtxt('sawtooth.dat')
N = len(signal)
t = np.arange(0, N*ts, ts)
f0 = 2

X = np.fft.fft(signal)
fv = np.arange(0, (N-1)/(N*ts), 1/(N*ts))

figFFT, axs = plt.subplots(2)
axs[0].plot(fv, np.real(X))
axs[0].set_xlabel('f [Hz]')
axs[0].set_ylabel('Re{X}')
axs[1].plot(fv, np.imag(X))
axs[1].set_xlabel('f [Hz]')
axs[1].set_ylabel('Im{X}')
figFFT.tight_layout()

xr = np.ones(N) * np.mean(signal)

for ks in range(1, 5 + 1):
    f = ks * f0
    k = int(f * N * ts)
    cks = X[k]/N
    aks = np.real(2*cks)
    bks = -np.imag(2*cks)
    xr = xr + aks*np.cos(2*np.pi*f*t) + bks*np.sin(2*np.pi*f*t)

figR, ax = plt.subplots()
ax.plot(t, xr, label='reconstructed signal')
ax.plot(t, signal, label='original signal')
ax.set_xlabel('t [s]')
ax.legend()
figR.tight_layout()

plt.show()
