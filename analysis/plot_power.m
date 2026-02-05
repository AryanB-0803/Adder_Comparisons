clc;
close all;
clear all;
bits = [4 8 16 32];
rca_power_W = [2.66e-05 5.75e-05 1.24e-04 2.50e-04];
cla_power_W = [2.66e-05 8.58e-05 2.52e-04 7.94e-04];

rca_power_uW = rca_power_W*1e6;
cla_power_uW = cla_power_W*1e6;

plot(bits,rca_power_uW,"cyan-*",bits,cla_power_uW,"y-hexagram");
axis([0 35 0 850]);
text(bits,rca_power_uW,string(rca_power_uW),'VerticalAlignment','top','HorizontalAlignment','center');
text(bits,cla_power_uW,string(cla_power_uW),'VerticalAlignment','baseline',HorizontalAlignment='right');
title("Power Consumption vs Bitwidth (gf180mcu SS corner)");
xlabel("Bitwidth");
ylabel("Power (in µW)");
legend("RCA","CLA","Location","northwest");
