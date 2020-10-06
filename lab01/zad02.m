A = 2.5;
ts = 0.005;
T = 4;
f = 2;

t = 0 : ts : T - ts;
y = sin(2 * pi * f * t) * A;
ys = randn(size(y)) * 0.1  + y;

plot(t,y)
hold on
plot(t, ys)
hold off