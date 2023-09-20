function [p, u, v, r] = LuocDoSplittingGodunovUpwind(pBD, uBD, vBD, rBD, pE, uE, vE, rE, x, y, tmax, CFL, TOL)  

dx = x(2) - x(1);

dy = y(2) - y(1);

t = 0;

p = pBD;
u = uBD;
v = vBD;
r = rBD;

while t < tmax
    umax = 0;
    for j = 1: length(x)
        for k = 1 : length(y)
            Ujk = [p(j,k); u(j,k); r(j,k)];
            Vjk = [p(j,k); v(j,k); r(j,k)];
            umax = max(umax, abs(lambda1(Ujk)));
            umax = max(umax, abs(lambda1(Vjk)));
            umax = max(umax, abs(lambda2(Ujk)));
            umax = max(umax, abs(lambda2(Vjk)));
            umax = max(umax, abs(lambda3(Ujk)));
            umax = max(umax, abs(lambda3(Vjk)));
        end    
    end
    
    dt = min((CFL/umax)*dx, (CFL/umax)*dy);
    
    tmoi = t + dt;
    
    tmoi = min(tmoi, tmax);
    
    dt = tmoi - t;
    
    RLX = dt/dx;
    
    RLY = dt/dy;
    
    t = tmoi;

    for k = 1 : length(y)
        
        U(1, :) = p(:, k);
        U(2, :) = u(:, k);
        U(3, :) = r(:, k);
        
        Usao = LuocDoGodunov1D(U, x, RLX, TOL);
        
        vsao = LuocDoThuanGio(v(:, k), u(:, k), x, RLX);
        
        p(:, k) = Usao(1, :);
        u(:, k) = Usao(2, :);
        r(:, k) = Usao(3, :);
        v(:, k) = vsao;
    end

    for j = 1 : length(x)
        
        Usao(1, :) = p(j, :);
        Usao(2, :) = v(j, :);
        Usao(3, :) = r(j, :);
        
        Umoi = LuocDoGodunov1D(Usao, y, RLY, TOL);
        
        umoi = LuocDoThuanGio(u(j, :), v(j, :), y, RLY);
        
        p(j, :) = Umoi(1, :);
        v(j, :) = Umoi(2, :);
        r(j, :) = Umoi(3, :);   
        u(j, :) = umoi;
    end
    
    
    
    subplot(4,2,1), mesh(x, y, pE'); grid on 
    xlabel('x'); ylabel('y'); zlabel('pE') 
    title(['N = ', num2str(length(x)-1), ', M = ', num2str(length(y)-1)])
    subplot(4,2,2),  mesh(x, y, p'); grid on 
    xlabel('x'); ylabel('y'); zlabel('p') 
    title(['Luoc do Splitting Godunov Upwind. Time = ', num2str(t)])
    subplot(4,2,3),  mesh(x, y, uE'); grid on 
    zlabel('uE') 
    subplot(4,2,4),  mesh(x, y, u'); grid on 
    zlabel('u') 
    subplot(4,2,5),  mesh(x, y, vE'); grid on 
    zlabel('vE') 
    subplot(4,2,6),  mesh(x, y, v'); grid on 
    zlabel('v') 
    subplot(4,2,7),  mesh(x, y, rE'); grid on 
    zlabel('\rhoE') 
    subplot(4,2,8),  mesh(x, y, r'); grid on 
    zlabel('\rho') 
    drawnow
end

end 












