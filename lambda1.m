function y = lambda1(U)
format long;
u = U(2);
c = Hamc(U);
y = u - c;
end