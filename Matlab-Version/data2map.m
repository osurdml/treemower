function exitcode = data2map(in_fn, out_fn)
	load(in_fn); % load the data, change the name pls.
	format long;
	radius = 100; % this could be change to different radius.
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
        for X = -radius:radius
            for Y = -radius:radius
                dist = sqrt(X^2 + Y^2);
                if dist <= radius
                    if x + X <= MapSize && x + X >= 1 && y + Y <= MapSize && y + Y >= 1
                        scoremap(x+X,y+Y) = 0.5 * scoremap(x+X,y+Y);
                    end
                end
            end
        end    
	end

	%scoremap
	%contour(scoremap);
	%hold on;
	csvwrite(out_fn,scoremap);
