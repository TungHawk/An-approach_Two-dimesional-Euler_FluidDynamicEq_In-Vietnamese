function [U1, U2] = GiaoDiemW1VaW3B(UL, UR, TOL)
format long;

pL = UL(1);
p = 0 + 0.1*pL;
U = DuongCongW1(UL, p, TOL);
while Phi3B(UR, U, TOL) > TOL
    p = p + 0.1*pL;
    U = DuongCongW1(UL, p, TOL);
end

p1 = p - 0.1*pL;
p2 = p;


p = (p1 + p2)/2;

U = DuongCongW1(UL, p, TOL);


while abs(Phi3B(UR, U, TOL)) > TOL
    if Phi3B(UR, U, TOL) > 0
        p1 = p;
    else
        p2 = p;
    end
    p = (p1 + p2)/2;
    U = DuongCongW1(UL, p, TOL);
end

U1 = U;
U2 = DuongCongW3B(UR, p, TOL);
s = (U2(2) + U1(2))/2;

U1(2) = s;
U2(2) = s;

end