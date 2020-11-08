n = 2e7;
u = -4.2;
sigma = 2.3;
r = u + sigma * randn(1,n);

u2 = mean(r);
sigma2 = sqrt(var(r));

bins_num = 40;
hist = histogram(r, bins_num, 'Normalization', 'pdf');

pn = normpdf(hist.BinEdges(), u2, sigma2);

hold on
plot(hist.BinEdges(), pn)
hold off
