% http://eric-yuan.me/logistic-regression/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% my_logisticRegression.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [theta] = logisticRegresstion(XTrain, yTrain, maxIter, alpha)
    [nSamples, nFeatures] = size(XTrain);
    for j = 1:maxIter
        for k = 1:nSamples
        end
    end 
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% costFunc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [J] = costFunc(XTrain, YTrain, theta)
    [nSamples, nFeatures] = size(XTrain);
    temp = 0.0;
    for m = 1:nSamples
        hx = sigmoid([1.0 XTrain(m, :)] * theta);
        if YTrain(m) == 1
            temp = temp + log(hx);
        else
            temp = emp + log(1-hx);
        end
    end
    J = temp/(-nSamples);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sigmoid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [output] = sigmoid(input)
    output = 1/(1+exp(-input))
end

