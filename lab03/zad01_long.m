v = 340;
ts = 1/1e6;

rx_long = load('rf_signals/rx_long.dat');
tx_long = load('rf_signals/tx_long.dat');

ltx = length(tx_long);
n = -ltx+1:ltx-1;
r = xcorr(rx_long, tx_long);

plot(n,r)

l10 = ltx/10;
j = 0;
d = zeros(1, 10);
for i=1:l10:ltx-l10+1
    j = j + 1;
    tx = tx_long(i:i+l10-1);
    rx = rx_long(i:i+l10-1);
    np = -l10+1:l10-1;
    rp = xcorr(rx, tx);
    [argvalue, argmax] = max(rp);
    d(j) = (abs(np(argmax))*ts*v)/2;
end
