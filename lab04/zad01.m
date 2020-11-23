ts = 10e-3;
signal = load('sawtooth.dat');
N = length(signal);
t = (0:N-1) * ts;
f0 = 2;

X = fft(signal);
fv = (0:N-1)/(N*ts);

subplot(2,1,1);
plot(fv, real(X))
xlabel('f [Hz]')
ylabel('Re\{X\}')

subplot(2,1,2);
plot(fv, imag(X))
xlabel('f [Hz]')
ylabel('Im\{X\}')

xr = ones(1, N) * mean(signal);

for ks=1:5
    f = ks*f0;
    k = f * N * ts;
    cks = X(k+1)/N;
    aks = real(2*cks);
    bks = -imag(2*cks);
    xr = xr + aks*cos(2*pi*f*t) + bks*sin(2*pi*f*t);
end

figure()
plot(t, xr)
hold on
plot(t, signal)
hold off
