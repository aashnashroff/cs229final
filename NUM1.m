%This file imports the cortex - averaged data and builds a matrix for the
%classifier App

X_D2_T2_test = importdata('D2_T2_cortex_2.mat');
X_D2_T2_train = importdata('D2_T2_cortex_10.mat');
X_D3_T3_test = importdata('D3_T3_cortex_2.mat');
X_D3_T3_train = importdata('D3_T3_cortex_10.mat');
X_PD2_H32_test = importdata('PD2_H32_cortex_2.mat');
X_PD2_H32_train = importdata('PD2_H32_cortex_10.mat');

X_U2_T2_test = importdata('U2_T2_cortex_2.mat');
X_U2_T2_train = importdata('U2_T2_cortex_10.mat');
X_U3_T3_test = importdata('U3_T3_cortex_2.mat');
X_U3_T3_train = importdata('U3_T3_cortex_10.mat');
X_PU3_H32_test = importdata('PU3_H32_cortex_2.mat');
X_PU3_H32_train = importdata('PU3_H32_cortex_10.mat');

%U
X_u = cat(1,X_U2_T2_train,X_U3_T3_train);%,X_PU3_H32_train);
y_0 = zeros(1,1915);
y_1 = ones(1,1940);
%y_2 = [];
%y_2(1, 1:1790) = 2;
y_u = cat(2,y_0,y_1);%,y_2);

X_u_test = cat(1,X_U2_T2_test,X_U3_T3_test);%,X_PU3_H32_test);
y_0 = zeros(1,372);
y_1 = ones(1,384);
%y_2 = [];
%y_2(1, 1:380) = 2;
y_u_test = cat(2,y_0,y_1);%,y_2);

%D
X_d = cat(1,X_D2_T2_train,X_D3_T3_train);%,X_PD2_H32_train);
y_0 = zeros(1,1873);
y_1 = ones(1,1822);
%y_2 = [];
%y_2(1, 1:1808) = 2;
y_d = cat(2,y_0,y_1);%,y_2);

X_d_test = cat(1,X_D2_T2_test,X_D3_T3_test);%,X_PD2_H32_test);
y_0 = zeros(1,365);
y_1 = ones(1,377);
%y_2 = [];
%y_2(1, 1:374) = 2;
y_d_test = cat(2,y_0,y_1);%,y_2);
% 
% % IF I WANT TO TEST ON TRAIN
% X_d = cat(1,X_d_test,X_d);
% y_d = cat(2,y_d_test,y_d);
% 
% X_u = cat(1,X_d_test,X_u);
% y_u = cat(2,y_d_test,y_u);


% 
% X_d = X_d_temp;
%shuffle train
perm = randperm(size(X_d,1));
X_d = X_d(perm, :);
y_d = y_d';
y_d = y_d(perm, :);

%shuffle train
perm = randperm(size(X_u,1));
X_u = X_u(perm, :);
y_u = y_u';
y_u = y_u(perm, :);

%make structload ionosphere
data_d = array2table(X_d);
data_d.Group = y_d;

%make structload ionosphere
data_u = array2table(X_u);
data_u.Group = y_u;

%so far I have build 4 SVM classifiers for down beats 
%now to test them on unseen data use untitles3.m

 