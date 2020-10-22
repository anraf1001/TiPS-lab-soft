import numpy as np

R = 0.01
u = np.loadtxt('u.dat')
P = np.mean(np.abs(u)**2) / R
print(P)

step = 10
stepU = int(len(u) / 10)
Pc = np.zeros(step)

for i in range(0, step):
    Pc[i] = np.mean(np.abs(u[(i * stepU):((i + 1) * stepU)])**2) / R

print(Pc)
print(np.mean(Pc))
