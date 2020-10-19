function ff = count_ff(signal)
%COUNT_FF Counts FF of a given signal
rms = sqrt(mean(abs(signal) .^ 2));
srb = mean(abs(signal));

ff = rms / srb;
end
