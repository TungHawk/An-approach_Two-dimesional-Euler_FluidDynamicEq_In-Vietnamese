function y = CongThucSimpson2D(f, x, y)
format long

dy = y(2) - y(1);

M = length(y) - 1;

A = CongThucSimpson(f(:, 1), x) + CongThucSimpson(f(:, M+1), x);

B = 0;
for j = 1 : M/2
    B = B + 4*CongThucSimpson(f(:, 2*j), x);
end
C = 0;
for j = 1 : M/2 - 1
    C = C + 2*CongThucSimpson(f(:, 2*j+1), x);
end

y = (dy/3)*(A + B + C);
end