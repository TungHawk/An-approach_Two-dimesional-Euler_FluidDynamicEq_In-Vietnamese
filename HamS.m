function S = HamS(U, TOL)
format long;
[sohang, socot] = size(U);
for j = 2 : socot -1
    for i = 1 : sohang
        if abs(U(i, j+1) - U(i, j)) <= TOL
            T(i, j) = 1;
        else
            T(i, j) = (U(i, j) - U(i, j-1)) ./ (U(i, j+1) - U(i, j));
        end
    end
    
    S(:, j) = (U(:, j+1) - U(:, j)) .* PhiVanLeer(T(:, j));
    
end
S(:, 1) = S(:, 2);
S(:, socot) = S(:, socot-1);

end