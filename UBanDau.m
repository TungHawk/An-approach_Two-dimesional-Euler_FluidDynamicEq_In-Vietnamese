function U = UBanDau(UL, UR, x)

format long;


for j = 1 : length(x)
    if x(j) <= 0
        U(:, j) = UL;
    else
        U(:, j) = UR;
    end
end

end