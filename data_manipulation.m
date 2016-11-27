
people = {'001','002','003','004','005','006','007','008','009','010','011','012'};
beats = {'D2_T2','PD2_H32','D2_H32','PU3_H32','U3_H32','U2_T2','D3_T3','M3_T3','U3_T3'};
num_files_by_beat = [2,4,4,4,4,2,2,2,2];
non_zero_features = importdata('non_zero_feature_idx_all.mat');
for person=1:12
    for b_indx=1:9

        beat = beats(b_indx);
        filename = strcat('beta_musician',people(person),'_',beat,'_0');
        if b_indx ~= 1 && b_indx ~= 2
            filename = strcat('other_beats/',filename);
        end
        if num_files_by_beat(b_indx) == 2
            filenm = char(strcat(filename,'1','.mat'));
            data = importdata(filenm);
            data_matrix_1 = data.allpwr;
            data_matrix_1=data_matrix_1(:,non_zero_features,:);

            filenm = char(strcat(filename,'2','.mat'));
            data = importdata(filenm);
            data_matrix_2 = data.allpwr;
            data_matrix_2=data_matrix_2(:,non_zero_features,:);

            % %Combining all trials
            data_matrix_all = cat(1,data_matrix_1,data_matrix_2);
        end
        if num_files_by_beat(b_indx) == 4
            filenm = char(strcat(filename,'1','.mat'));
            data = importdata(filenm);
            data_matrix_1 = data.allpwr;
            data_matrix_1=data_matrix_1(:,non_zero_features,:);

            filenm = char(strcat(filename,'2','.mat'));
            data = importdata(filenm);
            data_matrix_2 = data.allpwr;
            data_matrix_2=data_matrix_2(:,non_zero_features,:);

            filenm = char(strcat(filename,'3','.mat'));
            data = importdata(filenm);
            data_matrix_3 = data.allpwr;
            data_matrix_3=data_matrix_3(:,non_zero_features,:);

            filenm = char(strcat(filename,'4','.mat'));
            data = importdata(filenm);
            data_matrix_4 = data.allpwr;
            data_matrix_4=data_matrix_4(:,non_zero_features,:);
            
            % %Combining all trials
            data_matrix_all = cat(1,data_matrix_1,data_matrix_2);
            data_matrix_all = cat(1,data_matrix_all,data_matrix_3);
            data_matrix_all = cat(1,data_matrix_all,data_matrix_4);
        end

        %Removing excess time data (8 on each end)
        data_matrix_all = data_matrix_all(:,:,9:end-8);

        %Convert from 3D to 2D matrix (goal: 189 x 950040)
        temp = num2cell(data_matrix_all,[1 2]);
        temp2 = horzcat(temp{:});
        data_matrix_all = temp2;

        X = data_matrix_all;
        %Export the final X and y
        export_filenm = strcat(char(beat),'_',char(people(person)));
        save(export_filenm, 'X');
    end
end
