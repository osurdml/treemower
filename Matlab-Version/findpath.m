function s = findpath(X,Y,update_costmap,scoremap,per)
MapSize = size(update_costmap,1);
sub_direction=zeros(1,8);
% direction = zeros(1,8);
directions = zeros(64,1);
if (X - 1) <= 1 || (Y - 1) <= 1 || (X + 1) >= MapSize || (Y + 1) >= MapSize
    if X == 1 || Y == 1 || X == MapSize || Y == MapSize
        if X == 1 && Y == 1
            for i = 1:3
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                    sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                    sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                    sub_direction(7) = scoremap(x,y) + temp_scoremap(x, y+1);
                    sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                    %                     direction(1) = max(sub_direction);
                    directions(1:8) = sub_direction;
                end
                if i == 2
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                    sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                    sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                    sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                    sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                    %                     direction(7) = max(sub_direction);
                    directions(49:56) = sub_direction;
                end
                if i == 3
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                    sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                    sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                    sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                    sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                    sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                    sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                    sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                    %                     direction(8) = max(sub_direction);
                    directions(57:64) = sub_direction;
                end
            end
        end
        if X == 1 && Y ~= 1
            if X == 1 && Y == MapSize
                for i = 1:3
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        %                         direction(1) = max(sub_direction);
                        directions(1:8) = sub_direction;
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                        
                    end
                end
            elseif X == 1 && Y == 2
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        %                         direction(1) = max(sub_direction);
                        directions(1:8) = sub_direction;
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x, y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x, y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(57:64) = sub_direction;
                        %                         direction(8) = max(sub_direction);
                    end
                end
            elseif X == 1 && Y == MapSize - 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        directions(57:64) = sub_direction;
                        %                         direction(8) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1) ;
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(57:64) = sub_direction;
                        %                         direction(8) = max(sub_direction);
                    end
                end
            end
        end
        if X ~= 1 && Y == 1
            if X == MapSize && Y == 1
                for i = 1:3
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                end
            elseif X == 2 && Y == 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x, y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) = scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) = scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) = scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) = scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) = scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) = scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) = scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) = scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(57:64) = sub_direction;
                        %                         direction(8) = max(sub_direction);
                    end
                end
            elseif X == MapSize - 1 && Y == 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y);
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1);
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1);
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y);
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1);
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1);
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1);
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(57:64) = sub_direction;
                        %                         direction(8) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(57:64) = sub_direction;
                        %                         direction(8) = max(sub_direction);
                    end
                end
            end
        end
        if X ~= 1 && Y == MapSize
            if X == 2 && Y == MapSize
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 5
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                end
            elseif X == MapSize -1 && Y == MapSize
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 5
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                end
            elseif X == MapSize && Y == MapSize
                for i = 1:3
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X;
                        y = Y -1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(1:8) = sub_direction;
                        %                         direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(9:16) = sub_direction;
                        %                         direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1 ;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 5
                        x = X -1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                end
                
            end
        end
        if X == MapSize && Y ~= MapSize && Y ~= 1
            if Y == 2
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X ;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if  i == 5
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                end
            elseif Y == MapSize - 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X ;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if  i == 5
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X ;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(17:24) = sub_direction;
                        %                         direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(25:32) = sub_direction;
                        %                         direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(33:40) = sub_direction;
                        %                         direction(5) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                        sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                        directions(41:48) = sub_direction;
                        %                         direction(6) = max(sub_direction);
                    end
                    if  i == 5
                        x = X;
                        y = Y + 1;
                        [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                        sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                        sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                        sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                        sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                        sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                        directions(49:56) = sub_direction;
                        %                         direction(7) = max(sub_direction);
                    end
                end
            end
        end
    end
    if X == 2 && Y >= 2 && Y <= MapSize - 1
        if X == 2 && Y == 2
            for i = 1:8
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(1:8) = sub_direction;
                    %                 direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X + 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(9:16) = sub_direction;
                    %                 direction(2) = max(sub_direction);
                end
                if i == 3
                    x = X;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(17:24) = sub_direction;
                    %                 direction(3) = max(sub_direction);
                end
                if  i == 4
                    x = X - 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(25:32) = sub_direction;
                    %                 direction(4) = max(sub_direction);
                end
                if i == 5
                    x = X - 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(33:40) = sub_direction;
                    %                 direction(5) = max(sub_direction);
                end
                if i == 6
                    x = X -1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(41:48) = sub_direction;
                    %                 direction(6) = max(sub_direction);
                end
                if i == 7
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(49:56) = sub_direction;
                    %                 direction(7) = max(sub_direction);
                end
                if i == 8
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(57:64) = sub_direction;
                    %                 direction(8) = max(sub_direction);
                end
            end
            
        elseif X == 2 && Y == MapSize - 1
            for i = 1:8
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(1:8) = sub_direction;
                    %                 direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X + 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(9:16) = sub_direction;
                    %                 direction(2) = max(sub_direction);
                end
                if i == 3
                    x = X;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(17:24) = sub_direction;
                    %                 direction(3) = max(sub_direction);
                end
                if  i == 4
                    x = X - 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(25:32) = sub_direction;
                    %                 direction(4) = max(sub_direction);
                end
                if i == 5
                    x = X - 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(33:40) = sub_direction;
                    %                 direction(5) = max(sub_direction);
                end
                if i == 6
                    x = X -1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    directions(41:48) = sub_direction;
                    %                 direction(6) = max(sub_direction);
                end
                if i == 7
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    directions(49:56) = sub_direction;
                    %                 direction(7) = max(sub_direction);
                end
                if i == 8
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    directions(57:64) = sub_direction;
                    %                 direction(8) = max(sub_direction);
                end
            end
        else
            for i = 1:8
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(1:8) = sub_direction;
                    %                 direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X + 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(9:16) = sub_direction;
                    %                 direction(2) = max(sub_direction);
                end
                if i == 3
                    x = X;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(17:24) = sub_direction;
                    %                 direction(3) = max(sub_direction);
                end
                if  i == 4
                    x = X - 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(25:32) = sub_direction;
                    %                 direction(4) = max(sub_direction);
                end
                if i == 5
                    x = X - 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(33:40) = sub_direction;
                    %                 direction(5) = max(sub_direction);
                end
                if i == 6
                    x = X -1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(41:48) = sub_direction;
                    %                 direction(6) = max(sub_direction);
                end
                if i == 7
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(49:56) = sub_direction;
                    %                 direction(7) = max(sub_direction);
                end
                if i == 8
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) +   temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(57:64) = sub_direction;
                    %                 direction(8) = max(sub_direction);
                end
            end
        end
    end
    
    if X == MapSize - 1 && Y >= 2 && Y <= MapSize - 1
        if Y == 2
            for i = 1:8
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) +   temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(1:8) = sub_direction;
                    %                 direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X + 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) +   temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(9:16) = sub_direction;
                    %                 direction(2) = max(sub_direction);
                end
                if i == 3
                    x = X;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) +   temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(17:24) = sub_direction;
                    %                 direction(3) = max(sub_direction);
                end
                if  i == 4
                    x = X - 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) +   temp_scoremap(x+1,y+1)  ;
                    directions(25:32) = sub_direction;
                    %                 direction(4) = max(sub_direction);
                end
                if i == 5
                    x = X - 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(33:40) = sub_direction;
                    %                 direction(5) = max(sub_direction);
                end
                if i == 6
                    x = X -1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(41:48) = sub_direction;
                    %                 direction(6) = max(sub_direction);
                end
                if i == 7
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(49:56) = sub_direction;
                    %                 direction(7) = max(sub_direction);
                end
                if i == 8
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) +   temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(57:64) = sub_direction;
                    %                 direction(8) = max(sub_direction);
                end
            end
        elseif Y == MapSize - 1
            for i = 1:8
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) +   temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(1:8) = sub_direction;
                    %                 direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X + 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) +   temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(9:16) = sub_direction;
                    %                 direction(2) = max(sub_direction);
                end
                if i == 3
                    x = X;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) +   temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(17:24) = sub_direction;
                    %                 direction(3) = max(sub_direction);
                end
                if  i == 4
                    x = X - 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(25:32) = sub_direction;
                    %                 direction(4) = max(sub_direction);
                end
                if i == 5
                    x = X - 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(33:40) = sub_direction;
                    %                 direction(5) = max(sub_direction);
                end
                if i == 6
                    x = X -1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    directions(41:48) = sub_direction;
                    %                 direction(6) = max(sub_direction);
                end
                if i == 7
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    directions(49:56) = sub_direction;
                    %                 direction(7) = max(sub_direction);
                end
                if i == 8
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) +   temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    directions(57:64) = sub_direction;
                    %                 direction(8) = max(sub_direction);
                end
            end
        else
            for i = 1:8
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) +   temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(1:8) = sub_direction;
                    %                 direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X + 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) +   temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(9:16) = sub_direction;
                    %                 direction(2) = max(sub_direction);
                end
                if i == 3
                    x = X;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) +   temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(17:24) = sub_direction;
                    %                 direction(3) = max(sub_direction);
                end
                if  i == 4
                    x = X - 1;
                    y = Y - 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(25:32) = sub_direction;
                    %                 direction(4) = max(sub_direction);
                end
                if i == 5
                    x = X - 1;
                    y = Y;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(33:40) = sub_direction;
                    %                 direction(5) = max(sub_direction);
                end
                if i == 6
                    x = X -1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(41:48) = sub_direction;
                    %                 direction(6) = max(sub_direction);
                end
                if i == 7
                    x = X;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                    sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                    directions(49:56) = sub_direction;
                    %                 direction(7) = max(sub_direction);
                end
                if i == 8
                    x = X + 1;
                    y = Y + 1;
                    [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                    sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                    sub_direction(4) =   scoremap(x,y) +   temp_scoremap(x-1,y-1)  ;
                    sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                    sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                    sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                    directions(57:64) = sub_direction;
                    %                 direction(8) = max(sub_direction);
                end
            end
        end
    end
    if Y == 2 && X > 2 && X < MapSize - 1
        for i = 1:8
            sub_direction = zeros(1,8);
            if i == 1
                x = X + 1;
                y = Y;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(1:8) = sub_direction;
                %             direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) +   temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(9:16) = sub_direction;
                %             direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) +   temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(17:24) = sub_direction;
                %             direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) +   temp_scoremap(x+1,y+1)  ;
                directions(25:32) = sub_direction;
                %             direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(33:40) = sub_direction;
                %             direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(41:48) = sub_direction;
                %             direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(49:56) = sub_direction;
                %             direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) +   temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                directions(57:64) = sub_direction;
                %             direction(8) = max(sub_direction);
            end
        end
    end
    
    if Y == MapSize - 1 && X > 2 && X < MapSize - 1
        for i = 1:8
            sub_direction = zeros(1,8);
            if i == 1
                x = X + 1;
                y = Y;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) +   temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(1:8) = sub_direction;
                %             direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) +   temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(9:16) = sub_direction;
                %             direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) +   temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(17:24) = sub_direction;
                %             direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(25:32) = sub_direction;
                %             direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
                sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
                sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
                directions(33:40) = sub_direction;
                %             direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) +   temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y);
                directions(41:48) = sub_direction;
                %             direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                directions(49:56) = sub_direction;
                %             direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
                sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
                sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
                sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
                sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
                sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
                directions(57:64) = sub_direction;
                %             direction(8) = max(sub_direction);
            end
        end
    end
    
    
else
    for i = 1:8
        sub_direction = zeros(1,8);
        if i == 1
            x = X + 1;
            y = Y;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if i == 2
            x = X + 1;
            y = Y - 1;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if i == 3
            x = X;
            y = Y - 1;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if  i == 4
            x = X - 1;
            y = Y - 1;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if i == 5
            x = X - 1;
            y = Y;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if i == 6
            x = X - 1;
            y = Y + 1;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if i == 7
            x = X;
            y = Y + 1;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        if i == 8
            x = X + 1;
            y = Y + 1;
            [temp_scoremap,temp_costmap] = updatecost(x,y,update_costmap);
            sub_direction(1) =   scoremap(x,y) + temp_scoremap(x+1,y)  ;
            sub_direction(2) =   scoremap(x,y) + temp_scoremap(x+1,y-1)  ;
            sub_direction(3) =   scoremap(x,y) + temp_scoremap(x,y-1)  ;
            sub_direction(4) =   scoremap(x,y) + temp_scoremap(x-1,y-1)  ;
            sub_direction(5) =   scoremap(x,y) + temp_scoremap(x-1,y)  ;
            sub_direction(6) =   scoremap(x,y) + temp_scoremap(x-1,y+1)  ;
            sub_direction(7) =   scoremap(x,y) + temp_scoremap(x,y+1)  ;
            sub_direction(8) =   scoremap(x,y) + temp_scoremap(x+1,y+1)  ;
        end
        directions((i-1)*8+1:8*i) = sub_direction;
        %         direction(i) = max(sub_direction);
    end
end
temp_costmap = temp_costmap;
if per == 1
    index = find(directions==max(directions));
elseif per == 0.25
    choice = find(directions ~= 0);
    num = round(0.25 * size(choice,1));
    a = randperm(length(choice));
    f = a(1:num);
    m = zeros(length(f),2);
    m(:,1) = choice(f);
    m(:,2) = directions(choice(f));
    b = find(m(:,2) == max(m(:,2)));
    index = m(b(1),1);
elseif per == 0.5
    choice = find(directions ~= 0);
    num = round(0.5 * size(choice,1));
    a = randperm(length(choice));
    f = a(1:num);
    m = zeros(length(f),2);
    m(:,1) = choice(f);
    m(:,2) = directions(choice(f));
    b = find(m(:,2) == max(m(:,2)));
    index = m(b(1),1);
elseif per == 0.75
    choice = find(directions ~= 0);
    num = round(0.75 * size(choice,1));
    a = randperm(length(choice));
    f = a(1:num);
    m = zeros(length(f),2);
    m(:,1) = choice(f);
    m(:,2) = directions(choice(f));
    b = find(m(:,2) == max(m(:,2)));
    index = m(b(1),1);
end


if index(1) >= 1 && index(1) <= 8
    s = 1;
elseif index(1) >= 9 && index(1) <= 16
    s = 2;
elseif index(1) >= 17 && index(1) <= 24
    s = 3;
elseif index(1) >= 25 && index(1) <= 32
    s = 4;
elseif index(1) >= 33 && index(1) <= 40
    s = 5;
elseif index(1) >= 41 && index(1) <= 48
    s = 6;
elseif index(1) >= 49 && index(1) <= 56
    s = 7;
elseif index(1) >= 57 && index(1) <= 64
    s = 8;
end



