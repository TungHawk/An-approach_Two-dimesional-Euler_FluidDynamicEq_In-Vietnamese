function U = ChuyenVThanhU(V)
format long;
global gam;

[tam, n] = size(V);

for j = 1 : n
r = V(1, j);
u = V(2, j)/r;
e = V(3, j)/r;

ep = e - u^2/2;

p = (gam - 1)*r*ep;

U(:, j) = [p; u; r];
end
end