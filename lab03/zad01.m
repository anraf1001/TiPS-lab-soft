v = 340;
ts = 1/1e6;

rx_short = load('rf_signals/rx_short.dat');
tx_short = load('rf_signals/tx_short.dat');

n = -length(tx_short)+1:length(tx_short)-1;
r = xcorr(rx_short, tx_short);

plot(n,r)

[argvalue, argmax] = max(r);
d = (n(argmax)*ts*v)/2
