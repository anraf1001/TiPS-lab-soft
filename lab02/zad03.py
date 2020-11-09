import numpy as np

R = 0.01
u = np.loadtxt('u.dat')
P = np.mean(np.abs(u)**2) / R
print(P)

l10 = int(len(u) / 10)
Pc = np.zeros(len(u) - l10 + 1)

for i in range(0, len(Pc)):
    Pc[i] = np.mean(np.abs(u[i:i+l10]**2)) / R

print(np.max(Pc))
