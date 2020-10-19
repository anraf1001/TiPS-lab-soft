n = 20;
u = -4.2;
sigma = 2.3;
r = u + sigma * randn(1,n);

u2 = mean(r);
sigma2 = sqrt(var(r));

histogram(r,10)
