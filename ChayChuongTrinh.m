clc
format long;
global gam  ;

gam = 1.4;

xL = -1;

xR = 1;

N = 640;

h = (xR - xL)/N;

x = xL : h : xR;

tmax = 0.05;

CFL = 0.5;

TOL = 1e-6;


% Test Song tinh tron
%
UBD = SongTinhTron(x);

UE = UBD;

U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTestSTT_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSGodTestSTT_640', Saiso);
%}

%{
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTestSTT_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSVLTestSTT_640', Saiso);
%}
%}


% Test Can Bang
%{
UL = [5; 0; 0.8]  %pa, m/s, kg/m3
UR = [5 ; 0; 0.25]

UBD = UBanDau(UL, UR, x);

UE = UBD;
U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTestCB_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSGodTestCB_640', Saiso);
%}

%{
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTestCB_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSVLTestCB_640', Saiso);
%}
%}

% Test Song tinh tron
%{
UBD = SongTinhTron(x);

UE = UBD;

%{
U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTestSTT_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSGodTestSTT_640', Saiso);
%}

%{
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTestSTT_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSVLTestSTT_640', Saiso);
%}
%}

% Test Contact tron
%{
UBD = SongContactTron(x, 0);

UE = SongContactTron(x, tmax);

%{
U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTestContactTron_640', U);
Saiso = Error(UE(:, N/2+1:end-2), U(:, N/2+1:end-2), x(N/2+1:end-2)) % tinh tu giua den cuoi
dlmwrite('SSGodTestContactTron_640', Saiso);
%}

%
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTestContactTron_640', U);
Saiso = Error(UE(:, N/2+1:end-2), U(:, N/2+1:end-2), x(N/2+1:end-2)) % tinh tu giua den cuoi
dlmwrite('SSVLTestContactTron_640', Saiso);
%}
%}


% Test 1
%{
UL = [100000; 0; 1]  %pa, m/s, kg/m3 
UR = [10000; 0; 0.125]

UBD = UBanDau(UL, UR, x);

UE = NghiemChinhXacRiemann(UL, UR, x, tmax, TOL);
%dlmwrite('Test1_10000', UE);
%
U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTest1_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSGodTest1_640', Saiso);
%}

%{
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTest1_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSVLTest1_640', Saiso);
%}
%}


% Test 2
%{
UL = [10; 200; 0.8]  %pa, m/s, kg/m3 
UR = [30; 150; 0.5]

UBD = UBanDau(UL, UR, x);

UE = NghiemChinhXacRiemann(UL, UR, x, tmax, TOL);
U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTest2_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSGodTest2_640', Saiso);
%}

%{
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTest2_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSVLTest2_640', Saiso);
%}
%}



% Test 3
%{
UL = [3; -300; 0.9]  %pa, m/s, kg/m3 
UR = [10; -400; 0.5]

UBD = UBanDau(UL, UR, x);

UE = NghiemChinhXacRiemann(UL, UR, x, tmax, TOL);

U = LuocDoGodunov(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('GodTest3_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSGodTest3_640', Saiso);
%}

%{
U = LuocDoVanLeer(UBD, UE, x, tmax, CFL, TOL);
dlmwrite('VLTest3_640', U);
Saiso = Error(UE, U, x)
dlmwrite('SSVLTest3_640', Saiso);
%}
%}


