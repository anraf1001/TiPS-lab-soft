N = 9;
sigma = 1.33;
ts = 1e-3;
alpha = (N-1)/(2*sigma);

w = gausswin(N, alpha);
w = w./sum(w);
noiseSig = load('noiseSig.dat');

convolution = conv(w, noiseSig);
figure()
subplot(2,1,1)
plot(convolution)
subplot(2,1,2) 
plot(noiseSig)

figure()
subplot(3,1,1)
fv = (0:length(noiseSig)-1)/(length(noiseSig)*ts);
plot(fv, abs(fft(noiseSig)))
title('|X|')

subplot(3,1,2)
fw = (0:N-1)/(N*ts);
plot(fw, abs(fft(w)))

subplot(3,1,3)
fc = (0:length(convolution)-1)/(length(convolution)*ts);
plot(fc, abs(fft(convolution)))
xlabel('f [Hz]')
