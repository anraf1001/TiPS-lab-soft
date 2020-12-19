import numpy as np
import matplotlib.pyplot as plt

# wczytywanie danych
x = np.loadtxt('sygnalDtmf.dat')

# parametry sygnału
fs = 4096
ts = 1/fs
# wektor czasu
t = np.arange(0, len(x)) * ts
# wyświetlenie sygnału
plt.plot(t, x)

# długość okna
Nw = 2048

# ------------------------------------
# miejsce na dodatkowe zmienne

# tablica ze wszystkimi przyciskami
buttons = np.array([['1', '2', '3', 'A'],
                    ['4', '5', '6', 'B'],
                    ['7', '8', '9', 'C'],
                    ['*', '0', '#', 'D']])
# wektor z niższymi częstotliwościami
fLow = np.array([697, 770, 852, 941])
# wektor z wyższymi częstotliwościami
fHigh = np.array([1209, 1336, 1477, 1633])

number = []

# koniec
# ------------------------------------

# przesuwające się okno o długości Nw
for i in range(len(x) - Nw + 1):
    # aktualnie rozpatrywany wycinek sygnału
    curx = x[i: i + Nw - 1]

    # ------------------------------------
    # tutaj powinien sie znalezc kod rozpoznajacy przycisk
    X = np.fft.fft(curx)

    low = -1
    for j in range(len(fLow)):
        k = round(fLow[j] * Nw * ts)
        mod = 2 * np.abs(X[k])/Nw
        if mod >= 0.4:
            low = j
            break

    high = -1
    for j in range(len(fHigh)):
        k = round(fHigh[j] * Nw * ts)
        mod = 2 * np.abs(X[k])/Nw
        if mod >= 0.4:
            high = j
            break

    if (low > -1 and high > -1) and (len(number) == 0 or number[-1] != buttons[low, high]):
        number.append(buttons[low, high])

    # koniec
    # ------------------------------------

print(number)

plt.show()
