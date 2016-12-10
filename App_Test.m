% This file should be run after App_prep.m
% It tests on the 2 unseen people and reports an accuracy 


 X_d = X_d_test;
 
 %TODO Change the name to whatever you saved the classifier as 
 yfit = trainedClassifierQD.predictFcn(array2table(X_d)) ;
 
 errors = abs(y_d_test' - yfit);
 err = nnz(errors);
 percentage = 1 - (err / size(X_d, 1))
 
 