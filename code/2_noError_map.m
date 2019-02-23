clear all;
clc
close all;

t=0:pi/100:2*pi;
x=-80:0.1:80;


%y=x;
%plot(x,y)
plot(x,0);
hold on;
plot(0,x)
hold on;
x1=0:0.1:80;
plot(x1,2.7475*x1,'r','LineWidth',3);
hold on;
x2=-80:0.1:0;
plot(x2,1.1918*x2,'r','LineWidth',3);
hold on;
x=[0,3.4202,-9.5763,21.2223,36.8592,26.163,14.8103,10.72,5.3977,16.2035,18.353,9.4369]
y=[0,9.3969,-35.7393,-30.3086,-3.2248,26.163,40.6913,29.46,14.83,25.2635,19.9176,3.3084]
plot(x,y,'.','markersize', 20)
hold on;
x=[15.7339]
y=[43.2284]
plot(x,y,'*g','markersize', 10, 'LineWidth', 5)
hold on;
plot([21.2223,14.8103],[-30.3086,40.6913],'b--','LineWidth',3);
hold on;
plot([3.4202,36.8592],[9.3969,-3.2248],'b--','LineWidth',3);
hold on;
plot([36.8592,10.72],[-3.2248,29.46],'b--','LineWidth',3);
hold on;
plot([21.2223,5.3977],[-30.3086,14.83],'b--','LineWidth',3);
hold on;
plot([36.8592,26.163],[-3.2248,26.163],'b-','LineWidth',3);
hold on;
plot([26.163,18.353],[26.163,19.9176],'b-','LineWidth',3);
hold on;
plot([21.2223,0],[-30.3086,0],'b-','LineWidth',3);
hold on;
plot([9.4369,0],[3.3084,0],'b-','LineWidth',3);
hold on;
plot([26.163,16.2035],[26.163,25.2635],'b-','LineWidth',3);
hold on;


%[x,y]=meshgrid(t);
plot(10*sin(t),10*cos(t),'k--','LineWidth',3);
hold on;
plot(26.163+10*sin(t),26.163+10*cos(t),'k--','LineWidth',3);
hold on;
plot(36.8592+10*sin(t),-3.2248+10*cos(t),'k--','LineWidth',3);
hold on;
plot(21.2223+10*sin(t),-30.3086+10*cos(t),'k--','LineWidth',3);
hold on;
plot(-9.5763+10*sin(t),-35.7393+10*cos(t),'k--','LineWidth',3);
text(29,25,'A','color','blue','fontsize',16);
text(38.5,-5,'B','color','blue','fontsize',16);
text(24,-30,'C','color','blue','fontsize',16);
text(-7,-35,'D','color','blue','fontsize',16);
text(-3,3,'O','color','blue','fontsize',16);
text(11,40,'E','color','blue','fontsize',16);
text(7,30,'F','color','blue','fontsize',16);
text(1.5,18,'G','color','blue','fontsize',16);
text(0,12,'H','color','blue','fontsize',16);
text(14,46,'I','color','green','fontsize',16);
axis([-30 50 -50 50])
axis equal
grid on;