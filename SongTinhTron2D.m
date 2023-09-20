function [p, u, v, r] = SongTinhTron2D(x, y)

for j = 1 : length(x)
    for k = 1 : length(y)
        p(j, k) = 10000;
        u(j, k) = 0;
        v(j, k) = 200;
        r(j, k) = exp(x(j) + y(k));
    end
end

end