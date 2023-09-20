function U = SongContactTron(x, t)

for j = 1 : length(x)
    p = 10000;
    u = 500;
    r = exp(x(j) - u*t);
    U(:, j) = [p; u; r];
end

end