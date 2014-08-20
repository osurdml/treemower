%% Receding Horizon Path Planning and Longmower Path Planning
% Yawei Zhang

%% Please read the comment on the top of each block
clear
clc
clf
close all

%% setup
startX = 1;
startY = 1;
MapSize = 50;
goalX = MapSize;
goalY = MapSize;
goalZ = 1;
INFO = zeros(2,10);
% for percent comparing
%% IF need another map, uncomment this block,every time this will give a new map. If only need ONE map, run this once and comment it.
% MapSize = 100;
% goalX = MapSize;
% goalY = MapSize;
% goalZ = 1;
% [dc,cost,Z2]=MapH(MapSize,5,20,goalX,goalY,goalZ);
% save('cost.csv','cost');

%%
INFO = zeros(4,10);

for x = 1:10
        budget = 100*x;
   %% Receding Horizon
    % 2 more steps
    per = 1;
    load('cost.mat','cost');
    costmap= 10 *cost;
    update_costmap = costmap;
    Xpos=startX;
    Ypos=startY;
    path=zeros(MapSize,MapSize);
    pathcount = zeros(MapSize, MapSize);
    traj = zeros(MapSize,MapSize);

    pathcount(Xpos,Ypos) = 1;
    path(Xpos, Ypos) = 1;
    traj(Xpos,Ypos) = 1;
    consume = 0;
    RH_info_gain = costmap(1,1);
    [scoremap,update_costmap] = updatecost(Xpos,Ypos,update_costmap);
    X = ones(1,1);
    Y = ones(1,1);
    while(consume < budget);
        direction = findpath(Xpos,Ypos,update_costmap,scoremap,per);
        pre_Xpos = Xpos;
        pre_Ypos = Ypos;
        if direction == 1
            Xpos = Xpos + 1;
            Ypos = Ypos;
        elseif direction == 2
            Xpos = Xpos + 1;
            Ypos = Ypos - 1;
        elseif direction == 3
            Xpos = Xpos;
            Ypos = Ypos - 1;
        elseif direction == 4
            Xpos = Xpos - 1;
            Ypos = Ypos - 1;
        elseif direction == 5
            Xpos = Xpos - 1;
            Ypos = Ypos;
        elseif direction == 6
            Xpos = Xpos - 1;
            Ypos = Ypos + 1;
        elseif direction == 7
            Xpos = Xpos;
            Ypos = Ypos + 1;
        elseif direction == 8
            Xpos = Xpos + 1;
            Ypos = Ypos + 1;
        end
        path(Xpos, Ypos) = 1;
        pathcount(Xpos,Ypos) = pathcount(Xpos,Ypos) + 1;
        RH_info_gain = RH_info_gain + scoremap(Xpos,Ypos);
        
        [scoremap,update_costmap] = updatecost(Xpos,Ypos,update_costmap);
        consume = consume + 1;
        
        traj(Xpos,Ypos) = traj(pre_Xpos,pre_Ypos) + 1;
        X = [X; Xpos];
        Y = [Y; Ypos];
    end
     

        
    %%  figure part
    %% compare horizon with systematic
    INFO(1,x) = RH_info_gain;
    figure;
    contour(costmap)
    hold on
    grid on
    xlabel('X');
    ylabel('Y','Rotation',0);
    line(X,Y,'Color','b','LineWidth',1,'Marker','.');
    save_file_string1 = strcat('RH',int2str(x),'.png');
    print(gcf,'-dpng',['RH(',num2str(x),').png']);
    
    close all
    
    %% systematic
    sys_startX = 1;
    sys_startY = 1;
    sys_path = zeros(50,50);
    sys_pathcount = zeros(50,50);
    sys_path(1,1) = 1;
    sys_pathcount(1,1) = 1;
    sys_consume = 0;
    load('cost.mat','cost');
    sys_costmap= 10 * cost;
    sys_update_costmap = sys_costmap;
    
    sys_Xpos = sys_startX;
    sys_Ypos = sys_startY;
    sys_info_gain = sys_costmap(1,1);
    [sys_scoremap,sys_update_costmap] = updatecost(sys_Xpos,sys_Ypos,sys_update_costmap);
    
    sys_X = 1;
    sys_Y = 1;
    
    while (sys_consume <= budget)
        if sys_pathcount(1,1) > sys_pathcount(MapSize, MapSize) % go from start point to goal point
            
            if sys_Xpos == MapSize && sys_Ypos == MapSize
                pre_Xpos = sys_Xpos;
                pre_Ypos = sys_Ypos;
                sys_Xpos = sys_Xpos;
                sys_Ypos = sys_Ypos;
            elseif sys_Xpos == MapSize
                pre_Xpos = sys_Xpos;
                pre_Ypos = sys_Ypos;
                sys_Xpos = sys_Xpos;
                sys_Ypos = sys_Ypos + 1;
            elseif (mod(sys_Xpos,3) - 1) == 0
                if sys_Ypos == 1
                    if  sys_Xpos == pre_Xpos + 1
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos;
                        sys_Ypos = sys_Ypos + 1;
                    else
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos + 1;
                        sys_Ypos = sys_Ypos;
                    end
                elseif sys_Ypos == MapSize
                    if sys_Xpos == pre_Xpos + 1
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos;
                        sys_Ypos = sys_Ypos - 1;
                    else
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos + 1;
                        sys_Ypos = sys_Ypos;
                    end
                elseif sys_Ypos == pre_Ypos - 1
                    pre_Xpos = sys_Xpos;
                    pre_Ypos = sys_Ypos;
                    sys_Xpos = sys_Xpos;
                    sys_Ypos = sys_Ypos - 1;
                elseif sys_Ypos == pre_Ypos + 1
                    pre_Xpos = sys_Xpos;
                    pre_Ypos = sys_Ypos;
                    sys_Xpos = sys_Xpos;
                    sys_Ypos = sys_Ypos + 1;
                end
            else
                pre_Xpos = sys_Xpos;
                pre_Ypos = sys_Ypos;
                sys_Xpos = sys_Xpos + 1;
                sys_Ypos = sys_Ypos;
            end
            
        else % go from goal point to start point
            if sys_Ypos == MapSize
                if sys_Xpos == 1
                     pre_Xpos = sys_Xpos;
                    pre_Ypos = sys_Ypos;
                    sys_Xpos = sys_Xpos;
                    sys_Ypos = sys_Ypos - 1;      
                else
                    pre_Xpos = sys_Xpos;
                    pre_Ypos = sys_Ypos;
                    sys_Xpos = sys_Xpos - 1;
                    sys_Ypos = sys_Ypos;
                end
            elseif (mod(sys_Ypos,3) - 1) == 0
                if sys_Xpos == 1
                    if  sys_Ypos == pre_Ypos - 1
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos + 1;
                        sys_Ypos = sys_Ypos;
                    else
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos;
                        sys_Ypos = sys_Ypos - 1;
                    end
                elseif sys_Xpos == MapSize
                    if sys_Ypos == pre_Ypos - 1
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos - 1;
                        sys_Ypos = sys_Ypos;
                    else
                        pre_Xpos = sys_Xpos;
                        pre_Ypos = sys_Ypos;
                        sys_Xpos = sys_Xpos;
                        sys_Ypos = sys_Ypos - 1;
                    end
                elseif sys_Xpos == pre_Xpos - 1
                    pre_Xpos = sys_Xpos;
                    pre_Ypos = sys_Ypos;
                    sys_Xpos = sys_Xpos - 1;
                    sys_Ypos = sys_Ypos;
                elseif sys_Xpos == pre_Xpos + 1
                    pre_Xpos = sys_Xpos;
                    pre_Ypos = sys_Ypos;
                    sys_Xpos = sys_Xpos + 1;
                    sys_Ypos = sys_Ypos;
                end
            else
                pre_Xpos = sys_Xpos;
                pre_Ypos = sys_Ypos;
                sys_Xpos = sys_Xpos;
                sys_Ypos = sys_Ypos - 1;
            end
            
        end
        sys_info_gain = sys_info_gain + sys_scoremap(sys_Xpos,sys_Ypos);
        [sys_scoremap,sys_update_costmap] = updatecost(sys_Xpos,sys_Ypos,sys_update_costmap);
        sys_pathcount(sys_Xpos,sys_Ypos) = sys_pathcount(sys_Xpos,sys_Ypos) + 1;
        sys_path(sys_Xpos,sys_Ypos) = 1;
        sys_consume = sys_consume + 1;
        sys_X = [sys_X; sys_Xpos];
        sys_Y = [sys_Y; sys_Ypos];
        
    end
    
    figure;
    contour(sys_costmap)
    hold on
    grid on
    xlabel('X');
    ylabel('Y','Rotation',0);
    line(sys_X,sys_Y,'Color','b','LineWidth',1,'Marker','.');
    INFO(2,x) = sys_info_gain;
    save_file_string2 = strcat('SYS',int2str(x),'.png');
    print(gcf,'-dpng',['SYS(',num2str(x),').png']);
    close all
end
%% compare receding horizon and systematic
x = 100:100:1000;
y1 = INFO(1,:);
y2 = INFO(2,:);
figure
hold on
plot(x,y1,'-.or','MarkerFaceColor','g');
plot(x,y2,'-.ob','MarkerFaceColor','g');
legend('Receding Horizon','Systematic');
title('Infomation Gathering');
xlabel('Budget');
ylabel('Information');