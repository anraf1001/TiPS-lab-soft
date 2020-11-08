R = 0.01;
u = load('u.dat');
P = mean(u .^ 2) / R;

l10 = length(u) / 10;
Pc = zeros(1, length(u)-l10);

for i=1:length(Pc)
    Pc(i) = mean(u(i:i+l10-1) .^ 2) / R;
end
