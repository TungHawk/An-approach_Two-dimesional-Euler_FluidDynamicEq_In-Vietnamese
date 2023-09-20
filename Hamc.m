function y = Hamc(U)
format long;
global gam;
p = U(1);
r = U(3);
y = gam*p/r;
y = sqrt(y);
end