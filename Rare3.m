function U = Rare3(UL, UR, xi)
format long;
global gam;
if xi <= lambda3(UL)
    U = UL;
elseif xi >= lambda3(UR)
    U = UR;
else
    pL = UL(1);
    uL = UL(2);
    rL = UL(3);
    
    AL = pL/rL^gam;
    xiL = lambda3(UL);
    
    p = pL^((gam - 1)/2/gam) + (gam - 1)/sqrt(gam)/(gam + 1)*AL^(-1/2/gam)*(xi - xiL);
    p = p^(2*gam/(gam - 1));
    u = uL + 2/(gam + 1)*(xi - xiL);
    r = (p/AL)^(1/gam);
    
    U = [p; u; r];
end
end