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


% dlugosc okna
Nw = 2048;

% ------------------------------------
% miejsce na dodatkowe zmienne 

% tablica ze wszystkimi przyciskami
buttons = ['1', '2', '3', 'A';
            '4', '5', '6', 'B';
            '7', '8', '9', 'C';
            '*', '0', '#', 'D'];
% wektor z ni�szymi cz�stotliwo�ciami
fLow = [697, 770, 852, 941];
% wektor z wy�szymi cz�stotliwo�ciami
fHigh = [1209, 1336, 1477, 1633];

number = [];

% koniec
% ------------------------------------

% przesuwajace sie okno o dlugosci Nw
for i = 1 : length(x) - Nw + 1
    % aktualnie rozpatrywany wycinek sygnalu
    curx = x(i : i + Nw - 1);

    % ------------------------------------
    % tutaj powinien sie znalezc kod rozpoznajacy przycisk
    X = fft(curx);
    
    low = 0;
    for j= 1 : length(fLow)
        k = round(fLow(j) * Nw * ts);
        mod = 2 * abs(X(k+1))/Nw;
        if mod >= 0.4
            low = j;
            break
        end
    end
    
    high = 0;
    for j= 1 : length(fHigh)
        k = round(fHigh(j) * Nw * ts);
        mod = 2 * abs(X(k+1))/Nw;
        if mod >= 0.4
            high = j;
            break
        end
    end
    
    if low > 0 && high > 0
        if isempty(number) || number(end) ~= buttons(low, high)
            number = [number, buttons(low, high)];
        end
    end
    
    % koniec
    % ------------------------------------
end

number
