
% X = X_small(:, :);
% y= y_small(:, :);
perm = randperm(size(X,1));
X = X(perm, :);
y = y';
y = y(perm, :);
% y = y + 1;
% B = mnrfit(X,y)
% 

holdoutCVP = cvpartition(y,'holdout', 126);
dataTrain = X(holdoutCVP.training,:);
grpTrain = y(holdoutCVP.training);
dataTrainG1 = dataTrain(grp2idx(grpTrain)==1,:);
dataTrainG2 = dataTrain(grp2idx(grpTrain)==2,:);
[h,p,ci,stat] = ttest2(dataTrainG1,dataTrainG2,'Vartype','unequal');
ecdf(p);
xlabel('P value');
ylabel('CDF value')
 
X2 = array2table(X);
X2.Group = y;
