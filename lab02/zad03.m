R = 0.01;
u = load('u.dat');
P = mean(abs(u) .^ 2) / R;

Prc = zeros(1, 10);
Prc(1) = mean(abs(u(1:length(u)/10)) .^ 2) / R;

for i=2:10
    Prc(i) = mean(abs(u((i - 1)*length(u)/10:i*length(u)/10)) .^ 2) / R;
end
