function F = ChuyenUThanhF(U)
format long;
global gam;

[tam, n] = size(U);

for j = 1 : n
p = U(1, j);
u = U(2, j);
r = U(3, j);

ep = p/(gam - 1)/r;
e = ep + u^2/2;

F(:, j) = [r*u; r*u^2 + p; r*u*e + p*u];
end

end