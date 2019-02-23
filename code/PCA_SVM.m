%{

train_data=[810,281,250,202,6,3,2;2300,210,300,310,4,1.2,1;820,280,245,201,6.5,5.4,3;2325,215,320,324,4.2,2.8,2;830,282,255,200,4.2,4.7,3;825,284,250,204,5,2.6,2;2250,150,300,155,5,3.3,2;4000,110,300,50,3.4,2.1,2;2800,260,215,260,7.7,6.8,3;5120,110,210,52,3.6,3.7,2;4020,120,280,52,3.6,1.7,1;4800,140,220,18,9.6,5.7,3;480,295,292,245,9.9,6.9,3;2450,210,230,210,5,1.2,1;2900,290,272,350,5.6,5.2,3]
train_label=[2;1;2;1;2;2;1;3;4;5;3;5;5;5;1]
save train_data.mat train_data train_label predict_data

predict_data=[3982.2     213.24      142         28.9   7000   3.1    ;
              5186.2     206.51      268.72      76.9   9200   5.7    ;
              4382.2     221.03      229.86      79.9   4600   1.9    ;
              5973.33    220.879     195.36      143.7	5200   4.3    ;
              1244.33	 231.625	 195.77      190	5200   5.5	  ;
              435.56	 161.49      266.31      219.8	3400   2.6	  ;
              435.56	 161.49	     266.31      219.8	1000   2.6	  ;
              1608.89	 166.05      301         307.2	2600   5.5	  ;
              1608.89	 166.05      301         307.2  2600   5.5	  ;
              1608.89	 166.05      301	     305.975 2600  5.5	  ;
              1608.89	 166.05      301         304.75  2600  5.5	  ;
              1608.89	 166.05      301         303.525 2600  5.5	  ;
              1608.89	 166.05      301         302.3   2600  5.5	  ;
              1608.89	 166.05	     301         302.3   1200  5.5	  ;
              1608.89	 166.05	     301         300.7   1200  5.5	  ;
              1608.89	 166.05	     301         299.1   1200  5.5	  ;
              1608.89	 166.05	     301         297.5    1200 5.5	  ;
              1608.89	 166.05	     301         295.9   1200 5.5	  ;
              6135.56	 208.37	     283.06	     280.1	  9400 6.2	  ;
              3262.22	 236.737	 177.17	     351.3	  6000 1.7	  ;
              3262.22	 236.737	 177.17      351.3   6000 1.7	  ;
              3262.22	 236.737	 177.17      276.65  6000 1.7	  ;
              3262.22	 236.737	 177.17      202     6000 1.7	  ;
              3262.22	 236.737	 177.17      127.35  6000 1.7	  ;
              3262.22	 236.737	 177.17       52.7   6000 1.7	  ;
              3262.22	 236.737	 177.17	      52.7	  6000 1.7	  ;
              3262.22	 236.737	 177.17       52.7  6000  1.7	  ;
              3262.22	 236.737	 177.17       57.15  6000 1.7	  ;
              3262.22	 236.737	 177.17       61.6  6000 1.7	  ;
              3262.22	 236.737	 177.17       66.05  6000 1.7	  ;
              3262.22	 236.737	 177.17       70.5  6000 1.7	  ;
              3056	     206.654	  302	    350.3	  1400 1.1	  ;
              728.89	 227.745	 195.54	     219	  4800 3.6	  ;
              728.89	 227.745	 195.54      219    4800     3.6	  ;
              728.89	 227.745	 195.54      210.95  4800 3.6	  ;
              728.89	 227.745	 195.54      202.9  4800 3.6	  ;
              728.89	 227.745	 195.54      194.85  4800 3.6	  ;
              728.89	 227.745	 195.54     186.8   4800 3.6	  ;
              728.89	 227.745	 195.54	   186.8      4800 3.6	  ;
              728.89	 227.745	 195.54     183.25      4800 3.6    ;
              728.89	 227.745	 195.54	  179.7      4800 3.6	  ;
              728.89	 227.745	 195.54	 176.15      4800 3.6	  ;
              728.89	 227.745	 195.54	 172.6       4800 3.6	  ;
              1511.11	 241.62	     213.121	296.1	  8600 3.1	  ;
              1511.11	 241.62	     213.121    296.1     8600 3.1	  ;
              1511.11	 241.62	     213.121   277.075     8600 3.1	  ;
              1511.11	 241.62	     213.121   258.05      8600 3.1	  ;
              1511.11	 241.62	     213.121   239.025     8600 3.1	  ;
              1511.11	 241.62	     213.121  220          8600 3.1	  
            ]
     %}
clc;
clear all;
close all;
predict_label=zeros(49,1);
load train_data.mat
[eigenvalue,PCAeigenvector,pca_train_mydata,le,leiji,t]=pca(train_data,0.95);
[eigenvalue,PCAeigenvector,pca_predict_mydata,le,leiji,t]=pca(predict_data,0.95);
model = svmtrain(train_label,pca_train_mydata,'-t 0');  
        [predict_label,accuracy,decision_values]=svmpredict(predict_label,pca_predict_mydata,model);
     