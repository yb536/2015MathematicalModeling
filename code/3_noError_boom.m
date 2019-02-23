%syms s t
%solve('7+(sqrt((s-0.306*t)^2+37^2-2*37*(s-0.306*t)*cos(25*pi/180))/0.816)=t',t)
%[x,y]=solve('0.306*x+43.3027=y','(y-0.306*x)^2+37^2-2*(y-0.306*x)*37*cos(125*pi/180)=(0.816*(x-7))^2')
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

sD=16.0170:0.1:Dmax
tD=0.87378980112544126384956834783824.*(2.663424.*sD.^2 + 184.9332677842028846929406281787.*sD + 3233.9852523804593707004357643318).^(1/2) - 0.53475935828877005347593582887701.*sD - 11.565349641387478446478815450018


sB=16.0170:0.1:Bmax
tB= 0.87378980112544126384956834783824.*(2.663424.*sB.^2 - 62.4216277883520831614381617898.*sB + 3289.3114070165301113943290056018).^(1/2) - 0.53475935828877005347593582887701.*sB + 13.266473084916186206903345985075



sC=16.0170:0.1:Cmax
tC=0.87378980112544126384956834783824.*(2.663424.*sC.^2 + 101.63800781847679621355247041464.*sC + 3072.237709030755637230295809429).^(1/2) - 0.53475935828877005347593582887701.*sC - 3.203384034753318479142877419555






sO=13.75:0.1:Omax
tO=(sO+0.816*7)/(0.816+0.306);


sum=0;  
m=Amax;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(sA-m));
    m=m-[0.306*tA(1,b)];
    flag=flag+1;
    As(1,flag)=m;
    time=time+tA(1,b);
    At(1,flag)=time;
end
sum=sum+flag
m=49.1853;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(sB-m));
    m=m-[0.306*tB(1,b)];
    [a,b]=min(abs(sB-m));
    flag=flag+1;
    Bs(1,flag)=m;
    time=time+tB(1,b);
    Bt(1,flag)=time;
end
sum=sum+flag
m=72.178;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(sC-m));
    m=m-[0.306*tC(1,b)];
    [a,b]=min(abs(sC-m));
    flag=flag+1;
    Cs(1,flag)=m;
    time=time+tC(1,b);
    Ct(1,flag)=time;
end
sum=sum+flag
m=Dmax;
flag=0;
time=0
while 1
    if m<16.0170
       break; 
    end
    [a,b]=min(abs(sD-m));
    m=m-[0.306*tD(1,b)];
    flag=flag+1;
    Ds(1,flag)=m;
    time=time+tD(1,b);
    Dt(1,flag)=time;
end
sum=sum+flag
m=Omax;
flag=0;
time=0
while 1
    
    [a,b]=min(abs(sO-m));
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
[m,n]=size(As);
for i=1:n
   if As(i)<10
      As(i)=0;
      At(i)=0;
   end
end
[m,n]=size(Bs);
for i=1:n
   if Bs(i)<10||Bs(i)>31.3498
      Bs(i)=0;
      Bt(i)=0;
   end
end
[m,n]=size(Cs);
for i=1:n
   if Cs(i)<15.7818||Cs(i)>43.3027
      Cs(i)=0;
      Ct(i)=0;
   end
end
Ds=[];
Dt=[];
alltime=sort([At Bt Ct Ot]);
allposi=sort([As Bs Cs Os],'descend');
alltime = alltime(find(alltime ~= 0))
allposi = allposi(find(allposi ~= 0))
alltime=(allposi-111.9945)./(-0.306);

figure(2)
plot(alltime,allposi,'r.','markersize', 20);
title('µºµØ¿πΩÿ±¨∆∆µ„–≈œ¢','fontsize',16);xlabel('µºµØ¿πΩÿ ±º‰µ„','fontsize',16);ylabel('µºµØ¿πΩÿ±¨∆∆µ„”Î÷∏ª”Ω¢æ‡¿Î','fontsize',16)
    legend( '¿πΩÿ±¨∆∆µ„')
grid on;