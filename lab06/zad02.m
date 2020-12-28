N = 5;
a = rand(1, N);
b = rand(1, N);

x = conv(a, b);
xf = multiply(a, b);

diff = abs(x-xf);
