%syms s t
%solve('7+(sqrt((s-0.306*t)^2+37^2-2*37*(s-0.306*t)*cos(25*pi/180))/0.816)=t',t)

clear all;
clc;
close all;

s=16.0170:0.1:46.0027
%s<16.0170

 tA=2.3272727272727272727272727272727e-64.*(3.7545655517108804306036139946175e127.*s.^2 - 2.6789116656120879469415645650043e129.*s + 5.5674977600942823922165297766035e130).^(1/2) - 0.53475935828877005347593582887701.*s + 26.077747657944411037419491069471
plot(s,tA,'b','LineWidth',3);
hold on;

tB=2.3272727272727272727272727272727e-64.*(3.7545655517108804306036139946175e127.*s.^2 - 8.7994286067807966038522270521628e128.*s + 4.6368641634354540445699335148361e130).^(1/2) - 0.53475935828877005347593582887701.*s + 13.266473084916186206903345985075;
plot(s,tB,'b','LineWidth',3);
hold on;

tC=  2.3272727272727272727272727272727e-64.*(3.7545655517108804306036139946175e127.*s.^2 + 1.4327668553702831810479428566062e129.*s + 4.3308605272739264873172149181668e130).^(1/2) - 0.53475935828877005347593582887701.*s - 3.203384034753318479142877419555
plot(s,tC,'b','LineWidth',3);
hold on;

tD=2.3272727272727272727272727272727e-64.*(3.7545655517108804306036139946175e127*s.^2 + 2.6069603509913993937814921613332e129.*s + 4.5588721973402245859333523686852e130).^(1/2) - 0.53475935828877005347593582887701.*s - 11.565349641387478446478815450018
plot(s,tD,'b','LineWidth',3);
hold on;


s1=13.75:0.1:46.0027
tO=(s1+0.816*7)/(0.816+0.306);

plot(s1,tO,'b','LineWidth',3);
grid on;
title('导弹探测点与指挥舰距离和各舰完成拦截该导弹任务时间关系图','fontsize',16);xlabel('导弹探测点与指挥舰距离','fontsize',16);ylabel('各舰完成拦截该导弹任务时间','fontsize',16)
  text(42,23,'A护卫舰','color','black','fontsize',16);
text(42,52,'B护卫舰','color','black','fontsize',16);
text(42,67,'C护卫舰','color','black','fontsize',16);
text(33,72,'D护卫舰','color','black','fontsize',16);
text(42,42,'指挥舰','color','black','fontsize',16);
sum=0;  
m=46.0027;
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
m=46.0027;
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
m=46.0027;
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
m=46.0027;
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
m=46.0027;
flag=0;
time=0
while 1
    
    [a,b]=min(abs(s1-m));
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
alltime=sort([At Bt Ct Dt Ot]);
allposi=sort([As Bs Cs Ds Os],'descend');
figure(2)
plot(alltime,allposi,'r.','markersize', 20);
text(25,36,'#A','color','blue','fontsize',16);
text(49.5,29,'#A','color','blue','fontsize',16);
text(82,19,'#A','color','blue','fontsize',16);
text(130,4.7,'#A','color','blue','fontsize',16);
text(55,27,'#B','color','green','fontsize',16);
text(104,13,'#B','color','green','fontsize',16);
text(72,22,'#C','color','black','fontsize',16);
text(129,7.5,'#C','color','black','fontsize',16);
text(78,20.5,'#D','color','red','fontsize',16);
text(134,3,'#D','color','red','fontsize',16);
text(41,32.5,'#O','color','yellow','fontsize',16);
text(78,23.5,'#O','color','yellow','fontsize',16);
text(108,12,'#O','color','yellow','fontsize',16);


title('导弹拦截爆破点信息','fontsize',16);xlabel('导弹拦截时间点','fontsize',16);ylabel('导弹拦截爆破点与指挥舰距离','fontsize',16)
    legend( '拦截爆破点')
grid on;
