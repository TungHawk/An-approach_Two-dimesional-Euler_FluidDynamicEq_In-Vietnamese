function U = Contact(UL, UR, x, tmax)

s = UL(2);
for j = 1 : length(x)
    if x(j) <= s*tmax
        U(:, j) = UL;
    else
        U(:, j) = UR;
    end
end
end