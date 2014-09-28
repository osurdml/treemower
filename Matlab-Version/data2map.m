function exitcode = data2map(in_fn, out_fn)
	MAPSCALE = 300000;   % Magic number
	load(in_fn); % load the data, change the name pls.
	format long;
	radius = 100; % this could be change to different radius.
	lon = Longitude(:);
	lat = Latitude(:);
	origin = [min(lon(:)), min(lat(:))]

	% TODO(syoo): haversine
	map_x = MAPSCALE * (max(lon(:)) - min(lon(:)));
	map_y = MAPSCALE * (max(lat(:)) - min(lat(:)));
	map = ones(map_x, map_y);

	%matlabpool open 4;
	for i = 1:length(lat)
		fprintf('%d/%d\n', i, length(lat));
		x = round(MAPSCALE * (lon(i) - origin(1))) + 1;
		y = round(MAPSCALE * (lat(i) - origin(2))) + 1;
		for dx = -radius:radius
			for dy = -radius:radius
				dist = sqrt(dx^2 + dy^2);
				if dist <= radius
					x_ = x + dx;
					y_ = y + dy;
					if x_ <= map_x && x_ >= 1 && y_ <= map_y && y_ >= 1
						map(x_,y_) = 0.5 * map(x_,y_);
					end
				end
			end
		end    
	end

	%scoremap
	%contour(scoremap);
	%hold on;
	csvwrite(out_fn,map);
