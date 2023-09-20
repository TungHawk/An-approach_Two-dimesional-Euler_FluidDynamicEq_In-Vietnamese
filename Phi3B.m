function y = Phi3B(UR, U, TOL)
format long;

p = U(1);
u = U(2);

Utam = DuongCongW3B(UR, p, TOL);

y = u - Utam(2);

end