function [ outHist ] = genHist( image )
%GENHIST Generuje histogram dla podanego obrazu.
% Obraz jest macierza h x w x 3 o wartosciach w zakresie 0 - 255.
% Wynikowy histogram powinien byc wektorem wierszowym o sta�ej d�ugo�ci.

    % Zastap ponizszy kod tak, aby obliczal histogram dla obrazu RGB.
    % Prosz� dobra� odpowiedni� d�ugo�� wektora outHist.
    bins_num = 16;
    histR = histogram(image(:,:,1), bins_num).Values();
    histG = histogram(image(:,:,2), bins_num).Values();
    histB = histogram(image(:,:,3), bins_num).Values();
    outHist = [histR histG histB];
end

