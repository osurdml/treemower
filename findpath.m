function s = findpath(X,Y,scoremap, path, MapSize)
sub_direction=zeros(1,8);
direction = zeros(1,8);
if (X - 1) <= 1 || (Y - 1) <= 1 || (X + 1) >= MapSize || (Y + 1) >= MapSize
    if X == 1 || Y == 1 || X == MapSize || Y == MapSize
        if X == 1 && Y == 1
            for i = 1:3
                sub_direction = zeros(1,8);
                if i == 1
                    x = X + 1;
                    y = Y;
                    sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                    sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y) * (0.5^path(x-1,y));
                    sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                    sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x, y+1) * (0.5^path(x,y+1));
                    sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                    direction(1) = max(sub_direction);
                end
                if i == 2
                    x = X;
                    y = Y + 1;
                    sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                    sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                    sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
                    sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                    sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                    direction(7) = max(sub_direction);
                end
                if i == 3
                    x = X + 1;
                    y = Y + 1;
                    sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                    sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                    sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                    sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                    sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                    sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                    sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                    sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                    direction(8) = max(sub_direction);
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
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                end
            elseif X == 1 && Y == 2
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x, y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x, y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(8) = max(sub_direction);
                    end
                end
            elseif X == 1 && Y == MapSize - 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(8) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(8) = max(sub_direction);
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
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(6) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y + 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(7) = max(sub_direction);
                    end
                end
            elseif X == 2 && Y == 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x, y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(6) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(7) = max(sub_direction);
                    end
                    if i == 5
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(8) = max(sub_direction);
                    end
                end
            elseif X == MapSize - 1 && Y == 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(6) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(8) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(6) = max(sub_direction);
                    end
                    if i == 4
                        x = X;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(7) = max(sub_direction);
                    end
                    if i == 5
                        x = X + 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(8) = max(sub_direction);
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
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 4
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(4) = max(sub_direction);
                    end
                    if i == 5
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        direction(5) = max(sub_direction);
                    end
                end
            elseif X == MapSize -1 && Y == MapSize
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(4) = max(sub_direction);
                    end
                    if i == 5
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(5) = max(sub_direction);
                    end
                end
            elseif X == MapSize && Y == MapSize
                for i = 1:3
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X;
                        y = Y -1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(5) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X + 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(1) = max(sub_direction);
                    end
                    if i == 2
                        x = X + 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(2) = max(sub_direction);
                    end
                    if i == 3
                        x = X;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1 ;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 5
                        x = X -1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(5) = max(sub_direction);
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
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(6) = max(sub_direction);
                    end
                    if  i == 5
                        x = X;
                        y = Y + 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(7) = max(sub_direction);
                    end
                end
            elseif Y == MapSize - 1
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X ;
                        y = Y - 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(6) = max(sub_direction);
                    end
                    if  i == 5
                        x = X;
                        y = Y + 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        direction(7) = max(sub_direction);
                    end
                end
            else
                for i = 1:5
                    sub_direction = zeros(1,8);
                    if i == 1
                        x = X ;
                        y = Y - 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(3) = max(sub_direction);
                    end
                    if i == 2
                        x = X - 1;
                        y = Y - 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(4) = max(sub_direction);
                    end
                    if i == 3
                        x = X - 1;
                        y = Y;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(5) = max(sub_direction);
                    end
                    if i == 4
                        x = X - 1;
                        y = Y + 1;
                        sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                        sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                        direction(6) = max(sub_direction);
                    end
                    if  i == 5
                        x = X;
                        y = Y + 1;
                        sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                        sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                        sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                        sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                        sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                        direction(7) = max(sub_direction);
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
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(8) = max(sub_direction);
            end
        end
        
    elseif X == 2 && Y == MapSize - 1
        for i = 1:8
            sub_direction = zeros(1,8);
            if i == 1
                x = X + 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                direction(8) = max(sub_direction);
            end
        end
    else
        for i = 1:8
            sub_direction = zeros(1,8);
            if i == 1
                x = X + 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(8) = max(sub_direction);
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
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(8) = max(sub_direction);
            end
        end
    elseif Y == MapSize - 1
        for i = 1:8
            sub_direction = zeros(1,8);
            if i == 1
                x = X + 1;
                y = Y;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                direction(8) = max(sub_direction);
            end
        end
    else
        for i = 1:8
            sub_direction = zeros(1,8);
            if i == 1
                x = X + 1;
                y = Y;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(1) = max(sub_direction);
            end
            if i == 2
                x = X + 1;
                y = Y - 1;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(2) = max(sub_direction);
            end
            if i == 3
                x = X;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(3) = max(sub_direction);
            end
            if  i == 4
                x = X - 1;
                y = Y - 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(4) = max(sub_direction);
            end
            if i == 5
                x = X - 1;
                y = Y;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(5) = max(sub_direction);
            end
            if i == 6
                x = X -1;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(6) = max(sub_direction);
            end
            if i == 7
                x = X;
                y = Y + 1;
                sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
                sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
                direction(7) = max(sub_direction);
            end
            if i == 8
                x = X + 1;
                y = Y + 1;
                sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
                sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
                sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
                sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
                sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
                direction(8) = max(sub_direction);
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
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(1) = max(sub_direction);
        end
        if i == 2
            x = X + 1;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(2) = max(sub_direction);
        end
        if i == 3
            x = X;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(3) = max(sub_direction);
        end
        if  i == 4
            x = X - 1;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(4) = max(sub_direction);
        end
        if i == 5
            x = X - 1;
            y = Y;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(5) = max(sub_direction);
        end
        if i == 6
            x = X -1;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(6) = max(sub_direction);
        end
        if i == 7
            x = X;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(7) = max(sub_direction);
        end
        if i == 8
            x = X + 1;
            y = Y + 1;
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            direction(8) = max(sub_direction);
        end
    end
end
    
if Y == MapSize - 1 && X > 2 && X < MapSize - 1
    for i = 1:8
        sub_direction = zeros(1,8);
        if i == 1
            x = X + 1;
            y = Y;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(1) = max(sub_direction);
        end
        if i == 2
            x = X + 1;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(2) = max(sub_direction);
        end
        if i == 3
            x = X;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(3) = max(sub_direction);
        end
        if  i == 4
            x = X - 1;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(4) = max(sub_direction);
        end
        if i == 5
            x = X - 1;
            y = Y;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.1 * scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
            direction(5) = max(sub_direction);
        end
        if i == 6
            x = X -1;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5 * scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            direction(6) = max(sub_direction);
        end
        if i == 7
            x = X;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            direction(7) = max(sub_direction);
        end
        if i == 8
            x = X + 1;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            direction(8) = max(sub_direction);
        end
    end
end 
    
    
else
    for i = 1:8
        sub_direction = zeros(1,8);
        if i == 1
            x = X + 1;
            y = Y;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if i == 2
            x = X + 1;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if i == 3
            x = X;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if  i == 4
            x = X - 1;
            y = Y - 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if i == 5
            x = X - 1;
            y = Y;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if i == 6
            x = X - 1;
            y = Y + 1;
            
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if i == 7
            x = X;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        if i == 8
            x = X + 1;
            y = Y + 1;
            sub_direction(1) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y) * (0.5^path(x+1,y));
            sub_direction(2) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y-1) * (0.5^path(x+1,y-1));
            sub_direction(3) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y-1) * (0.5^path(x,y-1));
            sub_direction(4) = (0.5^path(x,y)) * scoremap(x,y) + 0.5*scoremap(x-1,y-1) * (0.5^path(x-1,y-1));
            sub_direction(5) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y) * (0.5^path(x-1,y));
            sub_direction(6) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x-1,y+1) * (0.5^path(x-1,y+1));
            sub_direction(7) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x,y+1) * (0.5^path(x,y+1));
            sub_direction(8) = (0.5^path(x,y)) * scoremap(x,y) + scoremap(x+1,y+1) * (0.5^path(x+1,y+1));
        end
        direction(i) = max(sub_direction);
        
    end
end

s = find(direction == max(direction));
s= s(1);


