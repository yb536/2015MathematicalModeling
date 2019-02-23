clear all;
clc;
close all;
x=0:0.01:30

y(1,1:0.01:3001)=0.8;
%plot(x,y,'r--','LineWidth',3)
figure(1)
plot(x,y,'r','LineWidth',3)
hold on;
x=10:0.01:20
y=-0.008*x.^2+0.16*x
plot(x,y,'b','LineWidth',3)
title('双方信息支援系数对比');xlabel('时间');ylabel('信息支援系数')
legend('红方信息支援系数', '蓝方信息支援系数')
grid on;
axis([0 30 0 1.2])

figure(2)
x=0:0.01:10
y(1,1:0.01:1001)=0.5;
plot(x,y,'b','LineWidth',3)
hold on;
x=10:0.01:50
y=0.0003125*x.^2-0.00625*x+0.53125
plot(x,y,'r','LineWidth',3);
hold on;
y=-0.0003125*x.^2+0.00625*x+0.46875;
plot(x,y,'b','LineWidth',3);
hold on;

title('双方信息支援系数对比');xlabel('时间');ylabel('信息支援系数')
legend('蓝方信息支援系数', '红方信息支援系数')
grid on;
axis([0 50 0 1])
figure(3)
x=0:0.01:50
y(1,1:0.01:5001)=0.7;
plot(x,y,'b','LineWidth',3)
hold on;
x=[];y=[];
x=0:0.01:10
y(1,1:0.01:1001)=0.9;
plot(x,y,'r','LineWidth',3)
hold on;
x=[];y=[];
x=10:0.01:15
y(1,1:0.01:501)=0.3;
plot(x,y,'r','LineWidth',3)
hold on;
x=[];y=[];
x=15:0.01:50
y(1,1:0.01:3501)=0.9;
plot(x,y,'r','LineWidth',3)
hold on;
plot([10,10],[0.3,0.9],'r--','LineWidth',1);
hold on;
plot([15,15],[0.3,0.9],'r--','LineWidth',1);
hold on;
grid on;
title('双方信息支援系数对比');xlabel('时间');ylabel('信息支援系数')
legend('蓝方信息支援系数', '红方信息支援系数')
figure(4)
x=0:0.01:80
y(1,1:0.01:8001)=0.7;
plot(x,y,'b','LineWidth',3)
hold on;
x=[];y=[];
x=0:0.01:10
y(1,1:0.01:1001)=0.9;
plot(x,y,'r','LineWidth',3)
hold on;
x=[];y=[];
x=10:0.01:40
y(1,1:0.01:3001)=0.3;
plot(x,y,'r','LineWidth',3)
hold on;
x=[];y=[];
x=40:0.01:80
y(1,1:0.01:4001)=0.9;
plot(x,y,'r','LineWidth',3)
hold on;
plot([10,10],[0.3,0.9],'r--','LineWidth',1);
hold on;
plot([40,40],[0.3,0.9],'r--','LineWidth',1);
hold on;
grid on;
title('双方信息支援系数对比');xlabel('时间');ylabel('信息支援系数')
legend('蓝方信息支援系数', '红方信息支援系数')