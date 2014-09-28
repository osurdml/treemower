%% create a scoremap
MapSize = 100;
goalX = MapSize;
goalY = MapSize;
goalZ = 1;
[dc,cost,Z2]=MapH(MapSize,5,20,goalX,goalY,goalZ); % you can change 5 and 20 to get different map, just play with it and see what do you need.
csvwrite('scoremap.csv',cost);
figure;
contour(cost);
