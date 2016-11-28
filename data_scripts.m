%=======Helpful data scripts========%

%How to import data
data = importdata('PD2_H32_004.mat');
X = data.X;

%How to use only K random features
K = 100;
num_features = length(X)/78;
random_K_idx = randsample(1:num_features,K);
random_K_idx_mapped = [];
for i=0:77
    random_k_add = random_K_idx+i*4929;
    random_K_idx_mapped = cat(2,random_K_idx_mapped,random_k_add); 
end
X_new = X(:,random_K_idx_mapped,:);


%Concat class types
X = cat(1,X1,X2);

%Concat people
X = cat(1,X1,X2);

%Remove num trials 
n = 0;
X = X(1:end-n,:);

%Creating y vector [11111000000]
% 1 is class1 (X1)
% 0 is class2 (X2)
y_ones = ones(1,size(X1,1));
y_zeros = zeros(1,size(X2,1));
y = cat(2,y_ones,y_zeros);

%Shuffling X and y
perm = randperm(size(X,1));
X = X(perm, :);
y = y';
y = y(perm, :);

