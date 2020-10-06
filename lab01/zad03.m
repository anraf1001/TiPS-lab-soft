y = load('sygnal.dat');

y_norm = normalizuj(y);

hold on
plot(y)
plot(y_norm)
hold off

save('sygnal_norm.dat', 'y_norm', '-ascii')