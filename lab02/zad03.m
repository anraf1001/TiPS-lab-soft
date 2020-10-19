R = 0.01;
u = load('u.dat');
P = mean(abs(u) .^ 2) / R;

Pc = zeros(1, 10);

for i=1:10
    Pc(i) = mean(abs(u((i - 1)*length(u)/10 + 1:i*length(u)/10)) .^ 2) / R;
end

% P = mean(Pc)
