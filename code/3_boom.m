% syms m t
%solve('(m-0.306*t)^2+37^2-2*(m-0.306*t)*37*cos(175*pi/180)=(0.816*(t-7))^2',t)
%[m,t]=solve('(m-0.306*t)^2+37^2-2*(m-0.306*t)*37*cos(75*pi/180)=(0.816*(t-7))^2','m=0.306*t')
 



%syms s t
%solve('7+(sqrt((s-0.306*t)^2+37^2-2*37*(s-0.306*t)*cos(25*pi/180))/0.816)=t',t)

clear all;
clc;
close all;
Amax=144.1324
Bmax=113.2911
Cmax=84.956
Dmax=75.2178
Omax=112.142



sA=16.0170:0.1:Amax
%s<16.0170

tA=0.87378980112544126384956834783824.*(2.663424.*sA.^2 - 190.03736985814237698575060997748.*sA + 3949.4868181018318559359175975195).^(1/2) - 0.53475935828877005347593582887701.*sA + 26.07774765794441103741949106947
plot(sA,tA,'b','LineWidth',3);
hold on;

sB=16.0170:0.1:Bmax
tB= 0.87378980112544126384956834783824.*(2.663424.*sB.^2 - 62.4216277883520831614381617898.*sB + 3289.3114070165301113943290056018).^(1/2) - 0.53475935828877005347593582887701.*sB + 13.266473084916186206903345985075
plot(sB,tB,'b','LineWidth',3);
hold on;

sC=16.0170:0.1:Cmax
tC=0.87378980112544126384956834783824.*(2.663424.*sC.^2 + 101.63800781847679621355247041464.*sC + 3072.237709030755637230295809429).^(1/2) - 0.53475935828877005347593582887701.*sC - 3.203384034753318479142877419555
plot(sC,tC,'b','LineWidth',3);
hold on;

sD=16.0170:0.1:Dmax
tD=0.87378980112544126384956834783824.*(2.663424.*sD.^2 + 184.9332677842028846929406281787.*sD + 3233.9852523804593707004357643318).^(1/2) - 0.53475935828877005347593582887701.*sD - 11.565349641387478446478815450018
plot(sD,tD,'b','LineWidth',3);
hold on;


sO=13.75:0.1:Omax
tO=(sO+0.816*7)/(0.816+0.306);
plot(sO,tO,'b','LineWidth',3);
grid on;
title('导弹探测点与指挥舰距离和各舰完成拦截该导弹任务时间关系图','fontsize',16);xlabel('导弹探测点与指挥舰距离','fontsize',16);ylabel('各舰完成拦截该导弹任务时间','fontsize',16)
  text(42,23,'A护卫舰','color','black','fontsize',16);
text(42,52,'B护卫舰','color','black','fontsize',16);
text(42,67,'C护卫舰','color','black','fontsize',16);
text(28,72,'D护卫舰','color','black','fontsize',16);
text(42,42,'指挥舰','color','black','fontsize',16);
sum=4;  
s=sA;
m=Amax;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(s-m));
    m=m-[0.306*tA(1,b)];
    flag=flag+1;
    As(1,flag)=m;
    time=time+tA(1,b);
    At(1,flag)=time;
end
sum=sum+flag
s=sB;
m=Bmax;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(s-m));
    m=m-[0.306*tB(1,b)];
    flag=flag+1;
    Bs(1,flag)=m;
    time=time+tB(1,b);
    Bt(1,flag)=time;
end
sum=sum+flag
s=sC;
m=Cmax;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(s-m));
    m=m-[0.306*tC(1,b)];
    flag=flag+1;
    Cs(1,flag)=m;
    time=time+tC(1,b);
    Ct(1,flag)=time;
end
sum=sum+flag
s=sD;
m=Dmax;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(s-m));
    m=m-[0.306*tD(1,b)];
    flag=flag+1;
    Ds(1,flag)=m;
    time=time+tD(1,b);
    Dt(1,flag)=time;
end
sum=sum+flag
s=sO;
m=Omax;
flag=0;
time=0;
while 1
    
    [a,b]=min(abs(s-m));
    m=m-[0.306*tO(1,b)];
    if m<10
       break; 
    end
    flag=flag+1;
    Os(1,flag)=m;
    time=time+tO(1,b);
    Ot(1,flag)=time;
end
sum=sum+flag
flag=1:sum;
Abao=111.9904
Bbao=81.1492
Cbao=52.814
Dbao=43.0758
Obao=80
Bt=Bt+(Abao-Bbao)/0.306;
Ct=Ct+(Abao-Cbao)/0.306;
Dt=Dt+(Abao-Dbao)/0.306;
Ot=Ot+(Abao-Obao)/0.306;

alltime=sort([ At Bt Ct Dt Ot]);
%alltime=[0 0 0 0 alltime];
allposi=sort([As Bs Cs Ds Os],'descend');
alltime=(allposi-111.9945)./(-0.306);
%allposi=[allposi]
figure(2)
plot(alltime,allposi,'r.','markersize', 20);

title('导弹拦截爆破点信息','fontsize',16);xlabel('导弹拦截时间点','fontsize',16);ylabel('导弹拦截爆破点与指挥舰距离','fontsize',16)
    legend( '拦截爆破点')
grid on;

