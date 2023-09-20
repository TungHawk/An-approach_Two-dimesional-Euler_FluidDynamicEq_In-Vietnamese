function U = Wave3(UL, UR, xi)
format long;

if lambda3(UL) <= lambda3(UR)
    U = Rare3(UL, UR, xi);
else
    U = Shock3(UL, UR, xi);
end

end