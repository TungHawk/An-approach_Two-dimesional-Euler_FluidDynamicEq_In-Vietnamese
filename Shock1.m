function U = Shock1(UL, UR, xi)
format long;

s = VanTocShock1(UL, UR);

if xi < s
    U = UL;
else
    U = UR;
end

end