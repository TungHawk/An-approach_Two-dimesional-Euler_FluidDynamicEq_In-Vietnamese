function U = DuongCongW1(U0, p, TOL)
format long;
global gam;

p0 = U0(1);

if abs(p - p0) <= TOL
    U = U0;
else
    u0 = U0(2);
    r0 = U0(3);
    A0 = p0/r0^gam;
    
    
    if p < p0
        u = u0 - 2*sqrt(gam)/(gam - 1)*A0^(1/2/gam)*(p^((gam - 1)/2/gam) - p0^((gam - 1)/2/gam));
        r = (p/p0)^(1/gam)*r0;
    else
        r = r0*((gam + 1)*p + (gam - 1)*p0)/((gam + 1)*p0 + (gam - 1)*p);
        u = u0 - (-(p - p0)*(1/r - 1/r0))^(1/2);
    end
    
    U = [p; u; r];
end



end