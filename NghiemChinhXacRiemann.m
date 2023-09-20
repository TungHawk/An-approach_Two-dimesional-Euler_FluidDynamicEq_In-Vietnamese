function U = NghiemChinhXacRiemann(UL, UR, x, tmax, TOL)


Xi = x/tmax;


[U1, U2] = GiaoDiemW1VaW3B(UL, UR, TOL)

U = Wave1Wave2Wave3(UL, U1, U2, UR, Xi);


ld1UL = lambda1(UL)
ld1U1 = lambda1(U1)

if ld1UL > ld1U1
    vantocshock1 = VanTocShock1(UL, U1)
end


ld3U2 = lambda3(U2)
ld3UR = lambda3(UR)

if ld3U2 > ld3UR
    vantocshock3 = VanTocShock3(U2, UR)
end


subplot(3,1,1), plot(x,U(1, :)); grid on 
title(['Nghiem chinh xac Riemann. N = ', num2str(length(x) - 1), '. t = ', num2str(tmax)])
ylabel('p')
subplot(3,1,2), plot(x,U(2, :)); grid on % Velocity
%title('Velocity');
ylabel('u')
subplot(3,1,3), plot(x,U(3, :)); grid on 
%title('Density');
ylabel('\rho')
xlabel('x')
drawnow

end