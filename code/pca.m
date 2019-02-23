function  [eigenvalue,PCAeigenvector,newdata,le,leiji,t]=pca(x,getpercent)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%���룺
%          x : �������PCA��������ݾ���
%          getpercent : ���������ֵ���ۼƹ�����
%�����
%          eigenvalue : ��ȡ��������ֵ��ɵ�����
%          PCAeigenvector : ��ȡ��������ֵ���Ӧ����������
%          newdata : ���ɷֿռ��Ӧ�ĵ�ά����
%          le : ��������ֵ�Ĺ�����
%          leiji : ��������ֵ���ۼƹ����ʣ��Ӵ�С��
%          t : ���ɷֵ�ά�ռ��ά��
%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%pca �����ݽ����˱�׼������
psize=size(x);
m=psize(2);
n=psize(1);
%����������ֵ������mean�������
for i=1:m    
    y(i)=0;
    for j=1:n    
       y(i)=y(i)+x(j,i);
    end
   y(i)=y(i)/n; %������ֵ
end
%����������׼�����std�������
for i=1:m
    s(i)=0;
    for k=1:n
       s(i)=s(i)+(x(k,i)-y(i))*(x(k,i)-y(i));
    end
    s(i)=sqrt(s(i)/(n-1));  %������׼��
end
%norms=norm(s);
%��׼���������������ݾ�ֵΪ0����׼��Ϊ1������zscore�������
for i=1:m
    for j=1:n
        XX(j,i)=(x(j,i)-y(i))/s(i); %��׼������
    end
end
%%
%����Э�������R������R������ֵ����������
%pp=corrcoef(XX)
R=(XX'*XX)/(n-1); %����Э�������R
%R=cov(x);
%R=cov(XX);%�������ϵ������R
[v,e]=eig(R);
ee=diag(e);%����ֵ
v=v';
%%
%������������λ�������õ�B
B(1,:)=v(1,:);
%������
for i=2:m  
    for j=1:i-1
        B(i,:)=v(i,:)-(sum(v(i,:).*B(j,:))/sum(B(j,:).*B(j,:)))*B(j,:);
    end
end
%��λ��
for i=1:m
    s=0;
    for j=1:m
       s=s+B(i,j)*B(i,j);
    end
    B(i,:)=B(i,:)/sqrt(s);
end
%%
%�ϲ�����ֵ����������
sign=[ee B]; %������ֵ�����������ϲ���һ������ ����һ��Ϊ����ֵ������ÿһ��Ϊ��Ӧ����������
[signsort,ix]=sort(sign,1,'descend');
for i=1:m
    for j=2:m+1
        signsort(i,j)=sign(ix(i,1),j);  
    end
end
disp('   eigvalue   eigvectors')
disp(signsort ) %��������ֵ�ɴ�С���о���
pp=sum(signsort(:,1));
%%
%���㹱����
for i=1:m
    le(i)=signsort(i,1)/pp; %����ֵ�����ʴ�С
end
leiji(1)=le(1);
for i=2:m     %�����ۼƹ�����
    leiji(i)=leiji(i-1)+le(i);   
end
t=1;
for i=1:m
    if leiji(i)>=getpercent  %�ҵ��ۼƹ����ʴ��ڵ���getpercent������ֵ����
        t=i;
        break;
    end
end
%%
%��ά����ͶӰ
PCAeigenvector=signsort(1:t,2:m+1)';
if t==1
    newdata(1,:)=PCAeigenvector(1,:)*XX'; 
    newdata(2,:)=ones(1,psize(1))
else
    newdata=XX*PCAeigenvector; %�����ݽ���������ȡ
end
eigenvalue=signsort(:,1);
%end of the function



    
