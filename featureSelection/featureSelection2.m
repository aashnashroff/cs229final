% %  errors = abs(y_d_test - yfit);
% %  err = nnz(errors);
% 
% % used for mce later-- aggregate all train and test data
% X = cat(1, X_d, X_d_test);
% y = cat(1, y_d, y_d_test);
% perm = randperm(size(X,1));
% X = X(perm, :);
% y = y(perm, :);
% 
% % t-test on each feature and compare p-value (or the absolute values of t-statistics)
% % for each feature as a measure of how effective it is at separating groups.
% dataTrainG1 = X_d(grp2idx(y_d)==1,:);
% dataTrainG2 = X_d(grp2idx(y_d)==2,:);
% dataTrainG3 = X_d(grp2idx(y_d)==3,:);
% [h,p,ci,stat] = ttest2(dataTrainG1,dataTrainG2,'Vartype','unequal');
% ecdf(p);
% xlabel('P value');
% ylabel('CDF value')
% 
% [~,featureIdxSortbyP] = sort(p,2); % sort the features
% testMCE = zeros(1,40);
% resubMCE = zeros(1,40);
% nfs = 20:20:800;
% for i = 1:40
%    fs = featureIdxSortbyP(1:nfs(i));
%    testMCE(i) = classf(X_d(:, fs), y_d, X_d_test(:, fs), y_d_test)/(size(y_d_test,1));
%    resubMCE(i) = classf(X(:, fs), y, X(:, fs), y)/(size(y, 1));
% end
%  plot(nfs, testMCE,'o',nfs,resubMCE,'r^');
%  xlabel('Number of Features');
%  ylabel('MCE');
%  legend({'MCE on the test set' 'Resubstitution MCE'},'location','NW');
%  title('Simple Filter Feature Selection Method');
%  
  
 bestFeatures = featureIdxSortbyP(1:50);
 err = classf(X_d(:, bestFeatures), y_d, X_d_test(:, bestFeatures), y_d_test)
 percentage = 1 - (err / size(X_d_test, 1))
 err = classf(X_d, y_d, X_d_test, y_d_test)
 percentage = 1 - (err / size(X_d_test, 1))
 
 function err = classf(xtrain, ytrain, xtest,ytest)
    Mdl = fitcdiscr(xtrain, ytrain);
    yfit = predict(Mdl, xtest);
    errors = abs(ytest - yfit);
    err = nnz(errors);
 end
