% Combining all trials
% D2_T2 = cat(1,allpwr,allpwr2);
% PD2_H32_01 = cat(1,Hallpwr,Hallpwr2);
% PD2_H32_01 = cat(1,PD2_H32_01,Hallpwr3);
% PD2_H32_01 = cat(1,PD2_H32_01,Hallpwr4);

% Removing excess time data (8 on each end)
% PD2_H32_01 = PD2_H32_01(:,:,9:end-8);
% D2_T2 = D2_T2(:,:,9:end-8);

% Convert from 3D to 2D matrix (goal: 189 x 950040)
temp = reshape(D2_T2, 189, 950040);

% Create y value matrix 


%