clc
clear
format long;



UE = dlmread('Test1_10000');
U320 = dlmread('GodTest1_320');
U640 = dlmread('GodTest1_640');


x10000 = -1 : (2/10000) : 1;

x640 = -1 : (2/640) : 1;

x320 = -1 : (2/320) : 1;

i = 1



plot(x10000, UE(i, :), 'k-',   x640, U640(i, :),'r--', x320, U320(i, :), 'b:', 'LineWidth', 1.5);


legend('Exact solution',   '640 mesh points', '320 mesh points');



xlabel('x', 'FontSize',14)


ylabel('p', 'FontSize',14)

%ylabel('u', 'FontSize',14)

%ylabel('\rho', 'FontSize',14)

axis([-0.5 0.5 0.5e04 11e04])

%}

