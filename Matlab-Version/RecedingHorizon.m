%%Receding Horizon Path Planning and Longmore? Path Planning
% Yawei Zhang
clear
clc
clf
close all
%%%% setup
startX = 1;
startY = 1;
MapSize = 50;

[scoremap,costmap] = score(MapSize);

INFO = zeros(3,10);
INFO(1,1:10) = 500:500:5000;
%%Receding Horizon
%%2 more steps
for x = 1:10
    close all
    Xpos=startX;
    Ypos=startY;
    path=zeros(MapSize,MapSize);
    pathcount = zeros(MapSize, MapSize);
    budget = 500 + 500*x;
    pathcount(Xpos,Ypos) = 1;
    path(Xpos, Ypos) = 1;
    consume = 0;

    RH_info_gain = scoremap(1,1);
    while(consume < budget);
        direction = findpath(Xpos,Ypos,scoremap,pathcount,MapSize);
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
        RH_info_gain = RH_info_gain + 0.5^pathcount(Xpos,Ypos)*scoremap(Xpos,Ypos);
        pathcount(Xpos,Ypos) = pathcount(Xpos,Ypos) + 1;
        consume = consume + 1;
        path(Xpos, Ypos) = 1;
    end
    INFO(2,x) = RH_info_gain;
    figure;
    contour(scoremap)
    hold on
    grid on
    xlabel('X');
    ylabel('Y');
    [s1,s2] = find(path==1);
    plot(s1,s2,'b.');
    save_file_string1 = strcat('RH',int2str(x),'.png');
    print(gcf,'-dpng',['RH(',num2str(x),').png']);
    close all
    
    
    %%systematic
    sys_startX = 1;
    sys_startY = 1;
    sys_path = zeros(50,50);
    sys_pathcount = zeros(50,50);
    sys_path(1,1) = 1;
    sys_pathcount(1,1) = 1;
    sys_consume = 0;
    sys_info_gain = scoremap(1,1);
    Xpos = sys_startX;
    Ypos = sys_startY;
    while (sys_consume <= budget)
        if sys_pathcount(1,1) > sys_pathcount(MapSize, MapSize) % go from start point to goal point
            
            if Xpos == MapSize && Ypos == MapSize
                pre_Xpos = Xpos;
                pre_Ypos = Ypos;
                Xpos = Xpos;
                Ypos = Ypos;
            elseif mod(Xpos,5) == 0
                if Ypos == 1
                    if Xpos == pre_Xpos + 1
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos;
                        Ypos = Ypos + 1;
                    else
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos + 1;
                        Ypos = Ypos;
                    end
                elseif Ypos == MapSize
                    if Xpos == pre_Xpos + 1
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos;
                        Ypos = Ypos - 1;
                    else
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos + 1;
                        Ypos = Ypos;
                    end
                elseif Ypos == pre_Ypos - 1
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos - 1;
                elseif Ypos == pre_Ypos + 1
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos + 1;
                end
            else
                pre_Xpos = Xpos;
                pre_Ypos = Ypos;
                Xpos = Xpos + 1;
                Ypos = Ypos;
            end
            sys_info_gain = sys_info_gain + (0.5^sys_pathcount(Xpos,Ypos))*scoremap(Xpos,Ypos);
            sys_pathcount(Xpos,Ypos) = sys_pathcount(Xpos,Ypos) + 1;
            sys_path(Xpos,Ypos) = 1;
            sys_consume = sys_consume + 1;

        else %go from goal point to start point
            if Xpos == 1
                if Ypos == MapSize
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos - 1;
                elseif Ypos == 1
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos;
                else
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos - 1;
                end
            elseif mod(Xpos,5) == 0
                if Ypos == MapSize
                    if Xpos == MapSize
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos;
                        Ypos = Ypos - 1;
                        
                    elseif Xpos == pre_Xpos - 1
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos;
                        Ypos = Ypos - 1;
                        
                    else
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos - 1;
                        Ypos = Ypos;
                    end
                elseif Ypos == 1
                    if Xpos == pre_Xpos - 1
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos;
                        Ypos = Ypos + 1;
                    else
                        pre_Xpos = Xpos;
                        pre_Ypos = Ypos;
                        Xpos = Xpos - 1;
                        Ypos = Ypos;
                    end
                elseif Ypos == pre_Ypos - 1
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos - 1;
                elseif Ypos == pre_Ypos + 1
                    pre_Xpos = Xpos;
                    pre_Ypos = Ypos;
                    Xpos = Xpos;
                    Ypos = Ypos + 1;
                end
            else
                pre_Xpos = Xpos;
                pre_Ypos = Ypos;
                Xpos = Xpos - 1;
                Ypos = Ypos;
            end
            sys_info_gain = sys_info_gain + (0.5^sys_pathcount(Xpos,Ypos))*scoremap(Xpos,Ypos);
            sys_pathcount(Xpos,Ypos) = sys_pathcount(Xpos,Ypos) + 1;
            sys_path(Xpos,Ypos) = 1;
            sys_consume = sys_consume + 1;

        end
        
    end
    
    figure;
    contour(costmap)
    hold on
    grid on
    xlabel('X');
    ylabel('Y');
    [s1,s2] = find(sys_path==1);
    plot(s1,s2,'b.');
    INFO(3,x) = sys_info_gain;
    save_file_string2 = strcat('SYS',int2str(x),'.png');
    print(gcf,'-dpng',['SYS(',num2str(x),').png']);
    close all
end
