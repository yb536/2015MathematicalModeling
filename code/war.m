%%

clear;
close all;
clc;

%Time Duration. to => Initial Time, tf => Final Time.
to = 0;%Always starts at 0.
tf =600;%Total number of days. 

%Initial Conditions. yo = [So Eo Io Ro].
yo = [100000 80000];


%rate.
options = odeset('InitialStep', .01,'AbsTol',1.0e-6);
[t y] = ode45('LCST',[to tf],yo,options);
%%

%Plots the Information.
figure(1);
grid on;
plot(t,y(:,1),'r','LineWidth',3);
hold on;
plot(t,y(:,2),'b','LineWidth',3);
grid on;
title('海湾战争验证模型');xlabel('时间');ylabel('兵力')
legend('伊方兵力', '美方兵力')
