n = 2e7;
u = -4.2;
sigma = 2.3;
r = u + sigma * randn(1,n);

u2 = mean(r);
sigma2 = sqrt(var(r));

bins_num = 40;
hist = histogram(r, bins_num, 'Normalization', 'pdf');

x = hist.BinEdges(1):0.1:hist.BinEdges(end);
pn = normpdf(x, u2, sigma2);

hold on
plot(x, pn)
hold off
