
clear all;
clc
close all;
t=linspace(0,2*pi,50);
R=31.86;
r=20;
%����4�һ������������ĵ������Ƿ�Χ

z=R*cos(45*pi/180)+r*cos(t)+i*(R*cos(45*pi/180)+r*sin(t));%����Ϊ1,3���뾶Ϊ2,4
G2=my_polar(angle(z),abs(z),'g');
set( G2, 'LineWidth', 3 );
hold on;
G6 =my_polar([0,20*pi/180],[0,60],'r-');%��ֱ��
set( G6, 'LineWidth', 3 );
hold on;

%���ƻ�����λ��
x= [45*pi/180 95*pi/180 145*pi/180 195*pi/180];
y=[R R R R];
G9=my_polar(x,y,'.b');
set( G9, 'markersize', 20 );
hold on;
%����ָ�ӽ�λ��
x= 0;
y=0;
G10=my_polar(x,y,'*b');
set( G10, 'markersize', 10 , 'LineWidth', 15);
hold on;


z=-R*sin(5*pi/180)+r*cos(t)+i*(R*cos(5*pi/180)+r*sin(t));%����Ϊ1,3���뾶Ϊ2,4
G3=my_polar(angle(z),abs(z),'g');
set( G3, 'LineWidth', 3 );
hold on;
z=-R*sin(55*pi/180)+r*cos(t)+i*(R*cos(55*pi/180)+r*sin(t));%����Ϊ1(��),3(��)���뾶Ϊ2,4
G4=my_polar(angle(z),abs(z),'g');
set( G4, 'LineWidth', 3 );
hold on;
z=-R*cos(15*pi/180)+r*cos(t)+i*(-R*sin(15*pi/180)+r*sin(t));%����Ϊ1,3���뾶Ϊ2,4
G5=my_polar(angle(z),abs(z),'g');
set( G5, 'LineWidth', 3 );
hold on;
z=r*cos(t)+i*(r*sin(t));%����Ϊ1,3���뾶Ϊ2,4
G1=my_polar(angle(z),abs(z),'g');
set( G1, 'LineWidth', 3 );
hold on;

%���Ƶ������ܹ�����Χ�߽�

G7 =my_polar([220*pi/180,220*pi/180],[2,60],'r-');%��ֱ��
set( G7, 'LineWidth', 3 );
hold on;


%���ƻ�����������
x= [45*pi/180 95*pi/180 145*pi/180 195*pi/180];
y=[R R R R];
G8=my_polar(x,y,'b');
set( G8, 'LineWidth', 2 );
hold on;

legend( '�����״�ɨ�跶Χ','����������Ϯ����','������λ��','ָ�ӽ�λ��');
b = findobj(gcf);
c = findall(b,'Type','text');
for phi = 0:30:330
    str = num2str(phi);
    str_new = [str '^\circ'];
    d = findobj(c,'String',str);
    set(d,'String',str_new,'FontSize',15);
end
%47.3240*cos(55*pi/180)



