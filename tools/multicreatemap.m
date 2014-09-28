%% create a scoremap
mapSize = 500;
%peakSize = 20;
%peakNum = 50;
goalX = mapSize;
goalY = mapSize;
goalZ = 1;

%matlabpool open 4;
for i=5:5:30
for j=5:5:50
	fprintf('Creating map with peakSize %d, peakNum %d\n', peakSize, peakNum);
	peakSize = i;
	peakNum = j;
	[dc,outmap,Z2]=MapH(mapSize,peakSize,peakNum,goalX,goalY,goalZ); % you can change 5 and 20 to get different map, just play with it and see what do you need.
	outname = sprintf('../data/%dx%d_%02d_%02d.map', mapSize, mapSize, peakSize, peakNum);
	csvwrite(outname, outmap);
end
end

%cost = 10*cost;
%figure;
%contour(cost);
