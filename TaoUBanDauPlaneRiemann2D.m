function [p, u, v, r] = TaoUBanDauPlaneRiemann2D(UL, UR, n, x, y)


for j = 1 : length(x)
    for k = 1 : length(y)
        xi = n(1)*x(j) + n(2)*y(k);
        if xi < 0
            U = UL;
        else
            U = UR;
        end
        p(j, k) = U(1);
        u(j, k) = U(2);
        v(j, k) = U(3);
        r(j, k) = U(4);
    end
end

end