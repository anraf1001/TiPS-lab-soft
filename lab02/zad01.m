dt = 1e-5;
A = 5.12;
f = 5;
t = 0:dt:2-dt;
y = A*(sawtooth(2*pi*f*t)+1)/2;
plot(t,y)
count_ff(y)

y_dat = load('form.dat');
count_ff(y_dat)
hold on
plot(t,y_dat)
hold off