function U = LuocDoGodunov1D(UBD, x, RLX, TOL)  
format long;

U = UBD;

V = ChuyenUThanhV(U);

for j = 1: length(x)-1

    [Ft, Fp] = XacDinhFtraiFphai(U(:, j), U(:, j+1), TOL);
    Fjcong05tru(:, j) = Ft;
    Fjcong05cong(:, j) = Fp;

end

for j = 2 : length(x)-1
    V(:, j) = V(:, j) - RLX*(Fjcong05tru(:, j) - Fjcong05cong(:, j-1));
end

U = ChuyenVThanhU(V);

end 












