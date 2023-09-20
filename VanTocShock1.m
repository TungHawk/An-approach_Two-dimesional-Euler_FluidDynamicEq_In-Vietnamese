function y = VanTocShock1(UL, UR)
format long;
global gam;

pL = UL(1);
uL = UL(2);
rL = UL(3);

pR = UR(1);

y = uL - (1/rL/2*((gam + 1)*pR + (gam - 1)*pL))^(1/2);
end