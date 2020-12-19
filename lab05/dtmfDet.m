close all;

% wczytywanie danych
x = load('sygnalDtmf.dat');

% parametry sygnalu
fs = 4096;
ts = 1/fs;
% wektor czasu
t = (0 : length(x) - 1) * ts;
% wyswietlanie sygnalu
plot(t, x);

% ------------------------------------
% miejsce na dodatkowe zmienne
N = length(x);
X = fft(x);
fv = (0:N-1)/(N*ts);
mod = abs(X);
ang = angle(X);
ang(2*mod/N < 0.01) = 0; 
figure()
subplot(2, 1, 1)
plot(fv, mod)
ylabel('|X(j\omega)|')
subplot(2, 1, 2)
plot(fv, ang)
xlabel('f [Hz]')
ylabel('arg|X(j\omega)|')

% koniec
% ------------------------------------

% dlugosc okna - prosze dobrac optymalna wartosc
Nw = 2048;
% przesuwajace sie okno o dlugosci Nw
for i = 1 : length(x) - Nw + 1
    % aktualnie rozpatrywany wycinek sygnalu
    curx = x(i : i + Nw - 1);

    % ------------------------------------
    % tutaj powinien sie znalezc kod rozpoznajacy przycisk
    
    
    
    % koniec
    % ------------------------------------
end

