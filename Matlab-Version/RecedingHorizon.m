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
[dc,cost,Z2]=MapH(MapSize,5,20,goalX,goalY,goalZ);
save('cost.mat','cost');


INFO = zeros(4,10);
%% for percent comparing
for per = 0.25:0.25:1
for x = 1:10
   %% Receding Horizon
    % 2 more steps
    load('cost.mat','cost');
    costmap= 10 *cost;
    update_costmap = costmap;
    Xpos=startX;
    Ypos=startY;
    path=zeros(MapSize,MapSize);
    pathcount = zeros(MapSize, MapSize);
    traj = zeros(MapSize,MapSize);
    budget = 100*x;
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
        RH_info_gain = RH_info_gain + scoremap(Xpos,Ypos);
        pathcount(Xpos,Ypos) = pathcount(Xpos,Ypos) + 1;
        [scoremap,update_costmap] = updatecost(Xpos,Ypos,update_costmap);
        consume = consume + 1;
        path(Xpos, Ypos) = 1;
        traj(Xpos,Ypos) = traj(pre_Xpos,pre_Ypos) + 1;
        X = [X; Xpos];
        Y = [Y; Ypos];
    end
     

        
    %%  figure part
    %% compare horizon with systematic
%     INFO(1,x) = RH_info_gain;
%     figure;
%     contour(costmap)
%     hold on
%     grid on
%     xlabel('X');
%     ylabel('Y','Rotation',0);
%     line(X,Y,'Color','b','LineWidth',1,'Marker','.');
%     save_file_string1 = strcat('RH',int2str(x),'.png');
%     print(gcf,'-dpng',['RH(',num2str(x),').png']);
%     
%     close all
    %% percent compare
    INFO(uint8(per/0.25),x) = RH_info_gain; 
    figure;
    contour(costmap)
    hold on
    grid on
    xlabel('X');
    ylabel('Y','Rotation',0);
    line(X,Y,'Color','b','LineWidth',1,'Marker','.');
    save_file_string1 = strcat('RH_per',num2str(per),int2str(x),'.png');
    print(gcf,'-dpng',['RH_per(',num2str(per),')','(',num2str(x),').png']);
    
    close all
    
    %% systematic
%     sys_startX = 1;
%     sys_startY = 1;
%     sys_path = zeros(50,50);
%     sys_pathcount = zeros(50,50);
%     sys_path(1,1) = 1;
%     sys_pathcount(1,1) = 1;
%     sys_consume = 0;
%     
%     Xpos = sys_startX;
%     Ypos = sys_startY;
%     sys_info_gain = costmap(1,1);
%     [scoremap,update_costmap] = updatecost(Xpos,Ypos,update_costmap);
%     
%     sys_X = 1;
%     sys_Y = 1;
%     
%     while (sys_consume <= budget)
%         if sys_pathcount(1,1) > sys_pathcount(MapSize, MapSize) % go from start point to goal point
%             
%             if Xpos == MapSize && Ypos == MapSize
%                 pre_Xpos = Xpos;
%                 pre_Ypos = Ypos;
%                 Xpos = Xpos;
%                 Ypos = Ypos;
%             elseif mod(Xpos,2) == 0
%                 if Ypos == 1
%                     if Xpos == pre_Xpos + 1
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos;
%                         Ypos = Ypos + 1;
%                     else
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos + 1;
%                         Ypos = Ypos;
%                     end
%                 elseif Ypos == MapSize
%                     if Xpos == pre_Xpos + 1
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos;
%                         Ypos = Ypos - 1;
%                     else
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos + 1;
%                         Ypos = Ypos;
%                     end
%                 elseif Ypos == pre_Ypos - 1
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos - 1;
%                 elseif Ypos == pre_Ypos + 1
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos + 1;
%                 end
%             else
%                 pre_Xpos = Xpos;
%                 pre_Ypos = Ypos;
%                 Xpos = Xpos + 1;
%                 Ypos = Ypos;
%             end
%             
%         else % go from goal point to start point
%             if Xpos == 1
%                 if Ypos == MapSize
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos - 1;
%                 elseif Ypos == 1
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos;
%                 else
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos - 1;
%                 end
%             elseif mod(Xpos,2) == 0
%                 if Ypos == MapSize
%                     if Xpos == MapSize
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos;
%                         Ypos = Ypos - 1;
%                         
%                     elseif Xpos == pre_Xpos - 1
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos;
%                         Ypos = Ypos - 1;
%                         
%                     else
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos - 1;
%                         Ypos = Ypos;
%                     end
%                 elseif Ypos == 1
%                     if Xpos == pre_Xpos - 1
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos;
%                         Ypos = Ypos + 1;
%                     else
%                         pre_Xpos = Xpos;
%                         pre_Ypos = Ypos;
%                         Xpos = Xpos - 1;
%                         Ypos = Ypos;
%                     end
%                 elseif Ypos == pre_Ypos - 1
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos - 1;
%                 elseif Ypos == pre_Ypos + 1
%                     pre_Xpos = Xpos;
%                     pre_Ypos = Ypos;
%                     Xpos = Xpos;
%                     Ypos = Ypos + 1;
%                 end
%             else
%                 pre_Xpos = Xpos;
%                 pre_Ypos = Ypos;
%                 Xpos = Xpos - 1;
%                 Ypos = Ypos;
%             end
%             
%         end
%         sys_info_gain = sys_info_gain + scoremap(Xpos,Ypos);
%         [scoremap,update_costmap] = updatecost(Xpos,Ypos,update_costmap);
%         sys_pathcount(Xpos,Ypos) = sys_pathcount(Xpos,Ypos) + 1;
%         sys_path(Xpos,Ypos) = 1;
%         sys_consume = sys_consume + 1;
%         sys_X = [sys_X; Xpos];
%         sys_Y = [sys_Y; Ypos];
%         
%     end
%     
%     figure;
%     contour(costmap)
%     hold on
%     grid on
%     xlabel('X');
%     ylabel('Y','Rotation',0);
%     line(sys_X,sys_Y,'Color','b','LineWidth',1,'Marker','.');
%     INFO(2,x) = sys_info_gain;
%     save_file_string2 = strcat('SYS',int2str(x),'.png');
%     print(gcf,'-dpng',['SYS(',num2str(x),').png']);
%     close all
end
end