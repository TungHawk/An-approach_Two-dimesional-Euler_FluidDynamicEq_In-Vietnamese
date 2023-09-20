function [p, u, v, r] = NghiemPlaneRiemann2D(UL, UR, n, x, y, tmax, TOL)

for j = 1 : length(x)
    for k = 1 : length(y)
        Xi(j, k) = (n(1)*x(j) + n(2)*y(k))/tmax;
    end
end

ULnga = ChuyenUThanhUnga(UL, n);
URnga = ChuyenUThanhUnga(UR, n);

[p, unga, vnga, r] = NghiemPlaneRiemann2DTheoPhuongOx(ULnga, URnga, Xi, TOL);

u = n(1)*unga - n(2)*vnga;
v = n(2)*unga + n(1)*vnga;


subplot(2,2,1), mesh(x, y, p'); grid on 
title(['N = ', num2str(length(x)-1), ', M = ', num2str(length(y)-1),', Nghiem Plane Riemann 2D, Time = ', num2str(tmax)])
xlabel('x')
ylabel('y')
zlabel('p')
subplot(2,2,2), mesh(x, y, u'); grid on 
xlabel('x')
ylabel('y')
zlabel('u')
subplot(2,2,3), mesh(x, y, v'); grid on 
xlabel('x')
ylabel('y')
zlabel('v')
subplot(2,2,4), mesh(x, y, r'); grid on 
xlabel('x')
ylabel('y')
zlabel('\rho')
drawnow


end