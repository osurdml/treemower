function exitcode = data2map(in_fn, out_fn)
	load(in_fn); % load the data, change the name pls.
	format long;
	radius = 3; % this could be change to different radius.
	lon = Longitude(:);
	lat = Latitude(:);
	MapSize1 = max(lon(:)) - min(lon(:));
	MapSize2 = max(lat(:)) - min(lat(:));
	MapSize = max(MapSize1,MapSize2);
	MapSize = round(abs(300000 * MapSize));

	while mod(MapSize,10) ~= 0
		MapSize = MapSize + 1;
	end
	scoremap = ones(MapSize,MapSize);


	for i = 1:length(lat)
		x = round(300000 * (abs(lat(i) - min(lat(:))))) + 1;
		y = round(300000 * (abs(lon(i) - min(lon(:))))) + 1;
		if x + 1 >MapSize
			x = MapSize;
		end
		if y + 1 > MapSize
			y = MapSize;
		end
		scoremap(x,y) = 0.5 * scoremap(x,y);
		if x + radius <= MapSize
			scoremap(x+1,y) = 0.5 * scoremap(x+1,y);
		end
		if x - radius >= 1
			scoremap(x-1,y) = 0.5 * scoremap(x-1,y);
		end
		if y - radius >= 1
			scoremap(x, y-1) = 0.5 * scoremap(x, y-1);
		end
		if y + radius <= MapSize
			scoremap(x, y+1) = 0.5 * scoremap(x, y+1);
		end
	end

	%scoremap
	%contour(scoremap);
	%hold on;
	csvwrite(out_fn,scoremap);
