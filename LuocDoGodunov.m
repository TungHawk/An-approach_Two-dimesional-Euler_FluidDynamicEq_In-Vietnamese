function U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL)  

N = length(x) - 1;

dx = x(2) - x(1);

t = 0;

U = UBD;

V = ChuyenUThanhV(U);


while t < tmax
    umax = 0;
    for j = 1 : N+1
        umax = max(umax, abs(lambda1(U(:, j))));
        umax = max(umax, abs(lambda2(U(:, j))));
        umax = max(umax, abs(lambda3(U(:, j))));
    end
    dt = (CFL/umax)*dx;
    
    tmoi = t + dt;
    
    tmoi = min(tmoi, tmax);
    
    dt = tmoi - t;
    
    RLX = dt/dx;
    
    t = tmoi;
    
     for j = 1: N
              
        [Ft, Fp] = XacDinhFtraiFphai(U(:, j), U(:, j+1), TOL);
        Ftrai(:, j) = Ft;
        Fphai(:, j) = Fp;
        
    end
    
    for j = 2 : N
        V(:, j) = V(:, j) - RLX*(Ftrai(:, j) - Fphai(:, j-1));
    end
    
    U = ChuyenVThanhU(V);
    
    
    
    
    subplot(3,1,1), plot(x,UE(1, :), x, U(1, :),'r-.'); grid on 
    title(['Luoc do Godunov. N = ', num2str(N), '. Tai thoi gian t = ', num2str(t)])
    ylabel('p')
    subplot(3,1,2), plot(x,UE(2, :), x, U(2, :),'r-.'); grid on % Velocity
    ylabel('u');
    subplot(3,1,3), plot(x,UE(3, :), x, U(3, :),'r-.'); grid on % Velocity
    xlabel('x');
    ylabel('\rho')
    drawnow
    
end

end 