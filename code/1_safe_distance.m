
clear all;
clc
close all;
%r=0:0.001:47.23;
%r=37;
%x=(r.^2*cos((5*pi)/36).^2 - r.^2 + 400).^(1/2) + r*cos((5*pi)/36)
%syms  m r
%solve('((r^2*cos((5*pi)/36)^2 - r^2 + 400)^(1/2) + r*cos((5*pi)/36)-m)/0.306=(sqrt(m^2+r^2-2*m*r*cos(175*pi/180))/0.816)+7',m)

r=0:0.001:47.23;
m=1.2176.*r - 1.8883608003760018251635639982902e-33.*(2.0318066610367759147524061891027e65.*r.*(400.0 - 0.1786.*r.^2).^(1/2) - 4.352129867940774009399654057058e65.*r + 1.8408717957786306742677495711593e65.*r.^2 - 2.2875816993464052287581699346405e65.*(400.0 - 0.1786.*r.^2).^(1/2) + 2.1604306249733008671878337391601e67).^(1/2) + 1.1636.*(400.0 - 0.1786.*r.^2).^(1/2) - 2.4925
plot(r,m,'b','LineWidth',3)
grid on;
title('ָ�ӽ���ȫ����s������������뾶r��ϵ����','fontsize',16);xlabel('����������뾶r','fontsize',16);ylabel('ָ�ӽ���ȫ����s','fontsize',16)

 
