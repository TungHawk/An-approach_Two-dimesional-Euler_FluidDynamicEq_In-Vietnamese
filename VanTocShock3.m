function y = VanTocShock3(UL, UR)
format long;
global gam;

pR = UR(1);
uR = UR(2);
rR = UR(3);

pL = UL(1);

y = uR + (1/rR/2*((gam + 1)*pL + (gam - 1)*pR))^(1/2);
end