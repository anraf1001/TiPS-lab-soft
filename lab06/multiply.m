function x = multiply(a, b)
N = length(a);
a = [a zeros(1, N-1)];
b = [b zeros(1, N-1)];
x = ifft(fft(a) .* fft(b));
end
