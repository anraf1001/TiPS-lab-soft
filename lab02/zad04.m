n = 2e7;
u = -4.2;
sigma = 2.3;
r = u + sigma * randn(1,n);

u2 = mean(r);
sigma2 = sqrt(var(r));

bins_num = 40;
hist = histogram(r, bins_num, 'Normalization', 'pdf');

first_point = hist.BinEdges(1) + hist.BinWidth / 2;
last_point = first_point + hist.BinWidth * (bins_num - 1);

midBins = (first_point:hist.BinWidth:last_point);
pn = normpdf(midBins, u2, sigma2);

hold on
plot(midBins, pn)
hold off
