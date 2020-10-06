function [y_norm] = normalizuj(y)
    new_min = -1;
    new_max = 1;
    y_norm = ((y - min(y))/(max(y) - min(y))) * (new_max - new_min) + new_min;
end

