opts = detectImportOptions('lotto.csv');
opts.SelectedVariableNames = (5:10);
lotto = readmatrix('lotto.csv', opts);

histogram(lotto)