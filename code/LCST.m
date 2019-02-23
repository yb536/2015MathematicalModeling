function ypseirswt =LCST(t,y) 
%%
%几内亚无干扰模型
%%%%%%%%%%%%
%CONSTANTS:%
%%%%%%%%%%%%



Be=0;
Ae=0;
Bc=0.00001/74;
Ac=0.00001;

Ir=0.999
Ib=0.001

%{
Ib=0.7;

%信息系统稳定性
if t<10
    Ir=0.9;
elseif t>40
    Ir=0.9;
else
    Ir=0.3;
end
%}
%{
%信息优势
if t<10
    Ir=0.5;
elseif t>=20
     Ir=1; 
else
    Ir=0.0003125*t.^2-0.00625*t+0.53125
end
if t<10
    Ib=0.5;
elseif t>=20
     Ib=0; 
else
    Ib=-0.0003125*t.^2+0.00625*t+0.46875;
end
%}
%{
%指挥对抗
if t<10
    Ib=0.8;
elseif t>=20
     Ib=0; 
else
    Ib=-0.008*t.^2+0.16*t; 
end
%}
R=y(1);
B=y(2);

%beta=(-1/30)*t+1;
%%%%%%%%%%%%
%EQUATIONS:%
%%%%%%%%%%%%

%Susceptible S
dR = -Ib*Be*B-(1-Ib)*Bc*R*B
%Exposed E
dB = -Ir*Ae*R-(1-Ir)*Ac*R*B


ypseirswt = [dR;dB];
end

