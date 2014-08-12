function [s] = score(costmap)
MapSize = size(costmap,1);
s = zeros(MapSize,MapSize);
for x = 1:MapSize
    for y = 1:MapSize
        if x == 1 || y == 1 || x == MapSize || y == MapSize
            if x == 1
                if x == 1 && y == 1
                    s(x,y) = costmap(x,y) + costmap(x+1,y) + costmap(x,y+1);
                elseif x == 1 && y == MapSize
                    s(x,y) = costmap(x,y) + costmap(x+1,y) + costmap(x,y-1);
                else
                    s(x,y) = costmap(x,y) + costmap(x+1,y) + costmap(x, y+1) + costmap(x,y-1);
                end
            end
            if y == 1 && x ~= 1
                if x == MapSize && y == 1
                    s(x,y) = costmap(x,y) + costmap(x-1,y) + costmap(x, y+1);
                else
                    s(x,y) = costmap(x,y) + costmap(x-1, y) + costmap(x,y+1) + costmap(x+1,y);
                end
            end
            if x == MapSize && y ~= 1
                if x == MapSize && y == MapSize
                    s(x,y) = costmap(x,y) + costmap(x-1,y) + costmap(x, y-1);
                else
                    s(x,y) = costmap(x,y) + costmap(x-1,y) + costmap(x,y+1) + costmap(x,y-1);
                end
            end
            if y == MapSize && x~= MapSize && x ~= 1
                s(x,y) = costmap(x,y) + costmap(x-1,y) + costmap(x+1,y) + costmap(x,y-1);
            end
            
        else
            s(x,y) = costmap(x,y) + costmap(x+1,y) + costmap(x,y+1) + costmap(x-1,y) + costmap(x,y-1);
        end
    end
end