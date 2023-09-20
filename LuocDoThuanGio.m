function vmoi = LuocDoThuanGio(v, u, x, RLX)  
format long;

vmoi = v;

for j = 2: length(x)-1
    ujcong = max(u(j), 0);
    ujtru = min(u(j), 0);
    vmoi(j) = v(j) - RLX*(ujcong*(v(j) - v(j-1)) + ujtru*(v(j+1) - v(j)));
end

end 












