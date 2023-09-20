clc
format long;
global gam  ;

gam = 1.4;

xL = -1;

xR = 1;

N = 20;
M = 20;

h = (xR - xL)/N;

x = xL : h : xR;

yL = -1;

yR = 1;

k = (yR - yL)/M;

y = yL : k : yR;

tmax = 0.0005;

CFL = 0.5;

TOL = 1e-6;

% Test song tinh tron 2D
%

[pBD, uBD, vBD, rBD] = SongTinhTron2D(x, y);

[pE, uE, vE, rE] = SongTinhTron2D(x, y);

[p, u, v, r] = LuocDoSplittingGodunovUpwind(pBD, uBD, vBD, rBD, pE, uE, vE, rE, x, y, tmax, CFL, TOL);
dlmwrite('SplitTest1_20', [p, u, v, r]);

Saiso2D = Error2D(pE, uE, vE, rE, p, u, v, r, x, y);
dlmwrite('SplitTest1_20', Saiso2D);

%}


% Test 1
%{
UL = [100000; 0; 100; 1]  %pa, m/s, kg/m3 
UR = [10000; 0; 200; 0.125]

n = [1, 0]

[pBD, uBD, vBD, rBD] = TaoUBanDauPlaneRiemann2D(UL, UR, n, x, y);

[pE, uE, vE, rE] = NghiemPlaneRiemann2D(UL, UR, n, x, y, tmax, TOL);

[p, u, v, r] = LuocDoSplittingGodunovUpwind(pBD, uBD, vBD, rBD, pE, uE, vE, rE, x, y, tmax, CFL, TOL);

Error2D(pE, uE, vE, rE, p, u, v, r, x, y)
%}

