%% Random PP 
% Andrew Stuntz
clear all
close all
clf 
clc
%% This generates a random path. 
startX = 3;
startY = 3;
goalY = 400;
goalX = 400;
goalZ=9;
MapSize = 500;

 [dc,cost,Z2]=MapH(MapSize,100,100,goalX,goalY,goalZ);
%positionm=zeros(MapSize,MapSize);
%searchmap = zeros(MapSize,MapSize);
rpath=zeros(MapSize,MapSize);

%%
rcost=0;
i=1;
Xpos=startX;
Ypos=startY;
maxiter=5000000;

costmap=(dc.*2+cost);

pathsexp=9;


while(i<=maxiter)
    r = randi(8);
    
    previousxy=rpath(Xpos,Ypos);
if(r==1)
    Xpos=Xpos+1;
    Ypos=Ypos+1;
end
if(r==2)
    Xpos=Xpos+1;
    Ypos=Ypos;
end
if(r==3)
    Xpos=Xpos+1;
    Ypos=Ypos-1;
end
if(r==4)
    Xpos=Xpos;
    Ypos=Ypos-1;
end
if(r==5)
    Xpos=Xpos-1;
    Ypos=Ypos-1;
end
if(r==6)
    Xpos=Xpos-1;
    Ypos=Ypos;
end
if(r==7)
    Xpos=Xpos-1;
    Ypos=Ypos+1;
end
if(r==8)
    Xpos=Xpos;
    Ypos=Ypos+1;
end
if(Xpos+1>length(costmap))
    Xpos=length(costmap);
elseif(Xpos<=0)
    Xpos=1;
else
    Xpos=Xpos;
end
if(Ypos+1>length(costmap))
    Ypos=length(costmap);
elseif(Ypos<=0)
    Ypos=1;
else
    Ypos=Ypos;
end

rpath(Xpos,Ypos)=previousxy+1;

rcost = rcost+costmap(Xpos,Ypos);



if(Xpos==goalX && Ypos==goalY)
    fprintf('goal reached')
    contour(rpath)
    return
end
if(i==maxiter)
    fprintf('no more please stop')
    contour3(rpath)
    hold on
    grid on
    contour(costmap)
end
i=i+1;
end