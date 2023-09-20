function Phi = PhiVanLeer(T)
format long;
Phi = (abs(T) + T) ./ (1 + abs(T));
end