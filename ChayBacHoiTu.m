clc
clear
format long;



SS(1) = dlmread('SSGodTestSTT_20');
SS(2) = dlmread('SSGodTestSTT_40');
SS(3) = dlmread('SSGodTestSTT_80');
SS(4) = dlmread('SSGodTestSTT_160');
SS(5) = dlmread('SSGodTestSTT_320');
SS(6) = dlmread('SSGodTestSTT_640');



SS = SS
BacHoiTu = Order(SS)

