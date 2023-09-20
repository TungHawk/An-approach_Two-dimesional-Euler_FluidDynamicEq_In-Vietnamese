function U = Wave1(UL, UR, xi)
format long;

if lambda1(UL) <= lambda1(UR)
    U = Rare1(UL, UR, xi);
else
    U = Shock1(UL, UR, xi);
end

end