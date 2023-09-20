function SaiSo = Error(UE, U, x)
format long

Hieu = abs(UE - U);

SaiSo = 0;

for i = 1 : 3
    SaiSo = SaiSo + CongThucSimpson(Hieu(i, :), x);
end

end