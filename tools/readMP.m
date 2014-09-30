addpath('C:\Users\Erwin\Desktop\githubcode\maps');
addpath('C:\Users\Erwin\Desktop\githubcode\treemower\Matlab-Version\output');
for i = 5:5:30
    for j = 5:5:50
        map_filename = strcat('500x500_',int2str(i),'_',int2str(j),'.map');
        for rf = 0.2:0.2:1.0
            for th = 0.0:0.05:0.25
                polt_filename = strcat('500x500_',int2str(i),'_',int2str(j),'_rh_b25000_la2_rf',num2str(rf),'_th',num2str(th),'.path');
                plotpath(map_filename,path_filename);
            end
        end
    end
end
