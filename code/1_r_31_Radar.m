
clear all;
clc
close all;
t=linspace(0,2*pi,50);
R=31.86;
r=20;
%绘制4艘护卫舰与主舰的导弹覆盖范围

z=R*cos(45*pi/180)+r*cos(t)+i*(R*cos(45*pi/180)+r*sin(t));%坐标为1,3，半径为2,4
G2=my_polar(angle(z),abs(z),'g');
set( G2, 'LineWidth', 3 );
hold on;
G6 =my_polar([0,20*pi/180],[0,60],'r-');%画直线
set( G6, 'LineWidth', 3 );
hold on;

%绘制护卫舰位置
x= [45*pi/180 95*pi/180 145*pi/180 195*pi/180];
y=[R R R R];
G9=my_polar(x,y,'.b');
set( G9, 'markersize', 20 );
hold on;
%绘制指挥舰位置
x= 0;
y=0;
G10=my_polar(x,y,'*b');
set( G10, 'markersize', 10 , 'LineWidth', 15);
hold on;


z=-R*sin(5*pi/180)+r*cos(t)+i*(R*cos(5*pi/180)+r*sin(t));%坐标为1,3，半径为2,4
G3=my_polar(angle(z),abs(z),'g');
set( G3, 'LineWidth', 3 );
hold on;
z=-R*sin(55*pi/180)+r*cos(t)+i*(R*cos(55*pi/180)+r*sin(t));%坐标为1(纵),3(横)，半径为2,4
G4=my_polar(angle(z),abs(z),'g');
set( G4, 'LineWidth', 3 );
hold on;
z=-R*cos(15*pi/180)+r*cos(t)+i*(-R*sin(15*pi/180)+r*sin(t));%坐标为1,3，半径为2,4
G5=my_polar(angle(z),abs(z),'g');
set( G5, 'LineWidth', 3 );
hold on;
z=r*cos(t)+i*(r*sin(t));%坐标为1,3，半径为2,4
G1=my_polar(angle(z),abs(z),'g');
set( G1, 'LineWidth', 3 );
hold on;

%绘制导弹可能攻击范围边界

G7 =my_polar([220*pi/180,220*pi/180],[2,60],'r-');%画直线
set( G7, 'LineWidth', 3 );
hold on;


%绘制护卫舰点连线
x= [45*pi/180 95*pi/180 145*pi/180 195*pi/180];
y=[R R R R];
G8=my_polar(x,y,'b');
set( G8, 'LineWidth', 2 );
hold on;

legend( '舰队雷达扫描范围','导弹可能来袭扇面','护卫舰位置','指挥舰位置');
b = findobj(gcf);
c = findall(b,'Type','text');
for phi = 0:30:330
    str = num2str(phi);
    str_new = [str '^\circ'];
    d = findobj(c,'String',str);
    set(d,'String',str_new,'FontSize',15);
end
%47.3240*cos(55*pi/180)



