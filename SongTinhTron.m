function U = SongTinhTron(x)

for j = 1 : length(x)
    p = 1.5;
    u = 0;
    r = exp(x(j));
    U(:, j) = [p; u; r];
end

end