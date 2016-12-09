
% This file is used to average the data around the 72 cortexes 



load('area_coordinates.mat')

% mroi : headbased coordinate
% tlroi : talairach coordinate

% the names of tlroi locations: 'area_coords_talairach.txt (ignore the second
% collumn that's y-direction flipped

coordfile='fullhead_8mm_nohead';
[h,d]=hdrload(coordfile);

% now 'd' is the all the location with x, y, z value you see in
% fullhead_8mm_nohead

ngrid=size(d,1);
dx = norm(d(1,:)-d(2,:));
nx=max(size(unique(d(:,1))));
xx=unique(d(:,1));
xmin=min(xx);
xmax=max(xx);
ny=max(size(unique(d(:,2))));
yy=unique(d(:,2));
ymin=min(yy);
ymax=max(yy);
nz=max(size(unique(d(:,3))));
zz=unique(d(:,3));
zmin=min(zz);
zmax=max(zz);


%% example
% how to find the index of the cubes in the whole grid 
% for the left auditory cortex which is #5 location in
% the area_coords_talairach.txt

% because it's headbased coordinate we want, we use 'mroi' variable

%BEGIN ZOE CODE

%files
people = {'001','002','003','004','005','006','007','008','009','010','011','012'};

%initialize matrix that we will add to horizontally 
%(concat 78 time interval cortex features) 

X_total = zeros(1,5616);

%loop over all people
file = 'D2_T2_';
file
for p=1:10
    p
    file_ = char(strcat(file,people(p),'.mat'));
    X = importdata(file_);
    %X = data.allpwr;
    
    %loop over all cortexes 
    num_trials = size(X,1);
    new_X = zeros(num_trials,1);
    for i=1:72
        %get the indx within the 12,800 cubes that represent that cortex
        x=mroi(i,1);
        y=mroi(i,2);
        z=mroi(i,3);

        ddx=1.5; % distance within then include the cubes
        indx=find(abs(d(:,1)-x)<=ddx & abs(d(:,2)-y)<=ddx & ...
                 abs(d(:,3)-z)<=ddx);
        elem_count = 0;
        elem_sums = zeros(num_trials,78);

        % loop over all indices (indices in the 12k vector) 
        for elem_indx=1:length(indx)
            % compare to the indx non_zero_features that is 5k in size
            if ismember(indx(elem_indx,1), non_zero_features)
                
                %TODO get the mapped index (indx in 12k to indx in 5k)
                mapped_indx = find(ismember(non_zero_features, indx(elem_indx,1)));
                % if this is a nonzero index then add all of its time intervals
                % and all of its trials to the average 
                for j=0:77
                    elem_sums(:,j+1) = elem_sums(:,j+1) + X(:,mapped_indx+j*4929);
                end
                elem_count = elem_count + 1;
            end
        end
        elem_sums = elem_sums/elem_count;
        new_X = cat(2,new_X,elem_sums);
    end
    new_X = new_X(:,2:end);
    X_total = cat(1,X_total,new_X);
end

X_total = X_total(2:end,:);
save('D2_T2_cortex_10','X_total');