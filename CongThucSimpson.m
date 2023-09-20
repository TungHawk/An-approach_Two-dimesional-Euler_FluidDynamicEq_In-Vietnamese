function y = CongThucSimpson(D, x)
format long

h = x(2) - x(1);
y = 0;

for i = 1 : 2 : length(x)-2
    y = y + (h/3)*(D(i) + 4*D(i+1) + D(i+2));
end
end