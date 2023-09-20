function [p, u, v, r] = NghiemPlaneRiemann2DTheoPhuongOx(UL, UR, Xi, TOL)


[U1, U2] = GiaoDiemW1VaW3B(UL([1,2,4]), UR([1,2,4]), TOL);


[m, n] = size(Xi);

for j = 1 : m
    for k = 1 : n
        if Xi(j, k) < lambda2(U1)
            U = Wave1(UL([1,2,4]), U1, Xi(j, k));
            v(j, k) = UL(3);
        else
            U = Wave3(U2, UR([1,2,4]), Xi(j, k));
            v(j, k) = UR(3);
        end
        p(j, k) = U(1);
        u(j, k) = U(2);
        r(j, k) = U(3);
    end
end


end