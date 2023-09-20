function y = Error2D(pE, uE, vE, rE, p, u, v, r, x, y)
format long;

Hieu = abs(p - pE) + abs(u - uE) + ...
    abs(v - vE) + abs(r - rE);


y = CongThucSimpson2D(Hieu, x, y);

end