function U = Shock3(UL, UR, xi)
format long;

s = VanTocShock3(UL, UR);

if xi < s
    U = UL;
else
    U = UR;
end

end