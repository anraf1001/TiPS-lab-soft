n = 20;
u = -4.2;
sigma = 2.3;
r = u + sigma * randn(1,n);

u2 = mean(r);
sigma2 = sqrt(var(r));

bins_num = 10;
hist = histogram(r, bins_num, 'Normalization', 'pdf');
p = zeros(1, bins_num);

for i=1:length(p)
    p(i) = hist.Values(i);
end

first_point = hist.BinEdges(1) + hist.BinWidth / 2;
last_point = first_point + hist.BinWidth * (bins_num - 1);
hold on
plot((first_point:hist.BinWidth:last_point),p)
hold off
