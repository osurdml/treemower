function [scoremap, update_costmap] = updatecost(Xpos,Ypos,update_costmap)
reduce_per = 0.5;
update_costmap(Xpos,Ypos) = reduce_per * update_costmap(Xpos,Ypos);
MapSize = size(update_costmap,1);
if Xpos == 1 || Ypos == 1|| Xpos == MapSize || Ypos == MapSize
    if Xpos == 1
        if Ypos == 1
            update_costmap(Xpos,Ypos + 1) = reduce_per * update_costmap(Xpos,Ypos + 1);
            update_costmap(Xpos + 1,Ypos) = reduce_per * update_costmap(Xpos + 1,Ypos);
        elseif Ypos == MapSize
            update_costmap(Xpos,Ypos - 1) = reduce_per * update_costmap(Xpos,Ypos - 1);
            update_costmap(Xpos + 1,Ypos) = reduce_per * update_costmap(Xpos + 1,Ypos);
        else
            update_costmap(Xpos,Ypos - 1) = reduce_per * update_costmap(Xpos,Ypos - 1);
            update_costmap(Xpos + 1,Ypos) = reduce_per * update_costmap(Xpos + 1,Ypos);
            update_costmap(Xpos,Ypos + 1) = reduce_per * update_costmap(Xpos,Ypos + 1);
        end
    end
    if Ypos == 1 && Xpos > 1
        if Xpos == MapSize
            update_costmap(Xpos-1,Ypos) = reduce_per * update_costmap(Xpos -1,Ypos);
            update_costmap(Xpos,Ypos + 1) = reduce_per * update_costmap(Xpos,Ypos + 1);
        else
            update_costmap(Xpos-1,Ypos) = reduce_per * update_costmap(Xpos -1,Ypos);
            update_costmap(Xpos,Ypos + 1) = reduce_per * update_costmap(Xpos,Ypos + 1);
            update_costmap(Xpos + 1,Ypos) = reduce_per * update_costmap(Xpos + 1,Ypos);
        end
    end
    if Xpos == MapSize && Ypos > 1
        if Ypos == MapSize
            update_costmap(Xpos, Ypos -1) = reduce_per * update_costmap(Xpos, Ypos -1);
            update_costmap(Xpos - 1, Ypos) = reduce_per * update_costmap(Xpos - 1, Ypos);
            update_costmap(Xpos, Ypos - 1) = reduce_per * update_costmap(Xpos, Ypos - 1);
            
        else
            update_costmap(Xpos, Ypos -1) = reduce_per * update_costmap(Xpos, Ypos -1);
            update_costmap(Xpos - 1, Ypos) = reduce_per * update_costmap(Xpos - 1, Ypos);
            update_costmap(Xpos, Ypos + 1) = reduce_per * update_costmap(Xpos, Ypos + 1);
        end
    end
    if Ypos == MapSize && Xpos > 1 && Xpos < MapSize
        update_costmap(Xpos-1,Ypos) = reduce_per * update_costmap(Xpos-1,Ypos);
        update_costmap(Xpos + 1,Ypos) = reduce_per * update_costmap(Xpos + 1,Ypos);
        update_costmap(Xpos, Ypos -1) = reduce_per * update_costmap(Xpos, Ypos - 1);
    end
else
    update_costmap(Xpos,Ypos + 1) = reduce_per * update_costmap(Xpos,Ypos + 1);
    update_costmap(Xpos, Ypos - 1) = reduce_per * update_costmap(Xpos,Ypos - 1);
    update_costmap(Xpos - 1, Ypos) = reduce_per * update_costmap(Xpos - 1, Ypos);
    update_costmap(Xpos + 1, Ypos) = reduce_per * update_costmap(Xpos + 1, Ypos);
end
scoremap = score(update_costmap);