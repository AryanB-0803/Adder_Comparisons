clc;
clear all;
close all;
bits = [4,8,16,32];
rca = [16.35 27.99 51.26 97.82]; 
cla = [16.35 25.43 33.79 47.96];
plot(bits,rca,'cyan-*',bits,cla,'y-pentagram');

text(bits, rca, string(rca), ...
    'VerticalAlignment','bottom', ...
    'HorizontalAlignment','center');

text(bits, cla, string(cla), ...
    'VerticalAlignment','top', ...
    'HorizontalAlignment','center');

xlabel('Bit-width(n)');
ylabel('Delay (time units as per GF180 liberty)');
title('STA delay v/s Bit-width (gf180mcu ss corner used)');
legend('RCA','CLA','Location','northwest');
grid on;
datacursormode on;
