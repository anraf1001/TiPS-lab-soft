A = 2.5;
ts = 0.005;
T = 4;
f = 2;

t = 0 : ts : T - ts;
y = sin(2 * pi * f * t) * A;

plot(t,y)
xlabel('t [s]')
ylabel('sin')
title('Wykres funkcji sinus')
