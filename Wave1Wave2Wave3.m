function U = Wave1Wave2Wave3(UL, U1, U2, UR, Xi)
format long;

n = length(Xi);

for j = 1 : n
    if Xi(j) < lambda2(U1)
        U(:, j) = Wave1(UL, U1, Xi(j));
    else
        U(:, j) = Wave3(U2, UR, Xi(j));
    
    end
end



end