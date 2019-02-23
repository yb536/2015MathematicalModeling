function  [eigenvalue,PCAeigenvector,newdata,le,leiji,t]=pca(x,getpercent)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%输入：
%          x : 输入进行PCA处理的数据矩阵
%          getpercent : 提起的特征值的累计贡献率
%输出：
%          eigenvalue : 提取出的特征值组成的向量
%          PCAeigenvector : 提取出的特征值相对应的特征向量
%          newdata : 主成分空间对应的低维数据
%          le : 各个特征值的贡献率
%          leiji : 各个特征值的累计贡献率（从大到小）
%          t : 主成分低维空间的维数
%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%pca 对数据进行了标准化处理
psize=size(x);
m=psize(2);
n=psize(1);
%计算样本均值，可用mean函数替代
for i=1:m    
    y(i)=0;
    for j=1:n    
       y(i)=y(i)+x(j,i);
    end
   y(i)=y(i)/n; %样本均值
end
%计算样本标准差，可用std函数替代
for i=1:m
    s(i)=0;
    for k=1:n
       s(i)=s(i)+(x(k,i)-y(i))*(x(k,i)-y(i));
    end
    s(i)=sqrt(s(i)/(n-1));  %样本标准差
end
%norms=norm(s);
%标准化处理，处理后的数据均值为0，标准差为1，可用zscore函数替代
for i=1:m
    for j=1:n
        XX(j,i)=(x(j,i)-y(i))/s(i); %标准化处理
    end
end
%%
%构造协方差矩阵R，计算R的特征值及特征向量
%pp=corrcoef(XX)
R=(XX'*XX)/(n-1); %样本协方差矩阵R
%R=cov(x);
%R=cov(XX);%样本相关系数矩阵R
[v,e]=eig(R);
ee=diag(e);%特征值
v=v';
%%
%将特征向量单位正交化得到B
B(1,:)=v(1,:);
%正交化
for i=2:m  
    for j=1:i-1
        B(i,:)=v(i,:)-(sum(v(i,:).*B(j,:))/sum(B(j,:).*B(j,:)))*B(j,:);
    end
end
%单位化
for i=1:m
    s=0;
    for j=1:m
       s=s+B(i,j)*B(i,j);
    end
    B(i,:)=B(i,:)/sqrt(s);
end
%%
%合并特征值和特征向量
sign=[ee B]; %将特征值和特征向量合并成一个矩阵 ，第一列为特征值，后面每一行为对应的特征向量
[signsort,ix]=sort(sign,1,'descend');
for i=1:m
    for j=2:m+1
        signsort(i,j)=sign(ix(i,1),j);  
    end
end
disp('   eigvalue   eigvectors')
disp(signsort ) %按照特征值由大到小排列矩阵
pp=sum(signsort(:,1));
%%
%计算贡献率
for i=1:m
    le(i)=signsort(i,1)/pp; %特征值贡献率大小
end
leiji(1)=le(1);
for i=2:m     %计算累计贡献率
    leiji(i)=leiji(i-1)+le(i);   
end
t=1;
for i=1:m
    if leiji(i)>=getpercent  %找到累计贡献率大于等于getpercent的特征值个数
        t=i;
        break;
    end
end
%%
%低维数据投影
PCAeigenvector=signsort(1:t,2:m+1)';
if t==1
    newdata(1,:)=PCAeigenvector(1,:)*XX'; 
    newdata(2,:)=ones(1,psize(1))
else
    newdata=XX*PCAeigenvector; %对数据进行特征提取
end
eigenvalue=signsort(:,1);
%end of the function



    
