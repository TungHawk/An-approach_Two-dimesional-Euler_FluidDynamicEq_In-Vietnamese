function O = Order(SaiSoTuyetDoi)
format long;

n = length(SaiSoTuyetDoi);

for i =1: n-1
    O(i) = log(SaiSoTuyetDoi(i) / SaiSoTuyetDoi(i+1)) / log(2);
end





end