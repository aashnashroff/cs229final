
people = {'001','002','003','004','005','006','007','008','009','010','011','012'};
beats = {'D2_T2','PD2_H32','D2_H32','PU3_H32','U3_H32','U2_T2','D3_T3','M3_T3','U3_T3'};
num_files_by_beat = [2,4,4,4,4,2,2,2,2];
non_zero_features = [];
for person=1:12
    for b_indx=1:9
        beat = beats(b_indx);
        filename = strcat('beta_musician',people(person),'_',beat,'_0');
        if b_indx ~= 1 && b_indx ~= 2
            filename = strcat('other_beats/',filename);
        end
        for i=1:num_files_by_beat(b_indx)
            filenm = strcat(filename,num2str(i),'.mat');
            t = char(filenm)
            data = importdata(t);
            data_par = data.par.wts_indx;
            non_zero_features = union(non_zero_features, data_par);
        end
    end
end
        