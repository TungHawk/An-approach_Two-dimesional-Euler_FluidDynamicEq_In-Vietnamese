function U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL)  

t = 0;

U = UBD;

V = ChuyenUThanhV(U);

N = length(x) - 1;

dx = x(2) - x(1);

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
    
    S = HamS(U, TOL);
    
    Utru = U + 0.5*S;
    Vtru = ChuyenUThanhV(Utru);
    Ftru = ChuyenUThanhF(Utru);

    Ucong = U - 0.5*S;
    Vcong = ChuyenUThanhV(Ucong);
    Fcong = ChuyenUThanhF(Ucong);
    
    V_ncong1phan2_jcong1phan2_tru = Vtru - (RLX/2)*(Ftru - Fcong);
    V_ncong1phan2_jcong1phan2_cong = Vcong - (RLX/2)*(Ftru - Fcong);
    
    U_ncong1phan2_jcong1phan2_tru = ChuyenVThanhU(V_ncong1phan2_jcong1phan2_tru);
    U_ncong1phan2_jcong1phan2_cong = ChuyenVThanhU(V_ncong1phan2_jcong1phan2_cong);

    for j = 1 : N
        
        [Ft, Fp] = XacDinhFtraiFphai(U_ncong1phan2_jcong1phan2_tru(:, j) , U_ncong1phan2_jcong1phan2_cong(:, j+1), TOL);
        Ftrai(:, j) = Ft;
        Fphai(:, j) = Fp;
        
    end
    
    for j = 2 : N
        V(:, j) = V(:, j) - RLX*(Ftrai(:, j) - Fphai(:, j-1));
    end
    
    U = ChuyenVThanhU(V);
    
    
    subplot(3,1,1), plot(x,UE(1, :), x, U(1, :),'--'); grid on 
    title(['Luoc do van Leer. N = ', num2str(N),   ' . Tai thoi gian t = ', num2str(t)])
    ylabel('p')
    subplot(3,1,2), plot(x,UE(2, :), x, U(2, :),'--'); grid on % Velocity
    ylabel('u');
    subplot(3,1,3), plot(x,UE(3, :), x, U(3, :),'--'); grid on % Velocity
    xlabel('x');
    ylabel('\rho')
drawnow
    
end

end 