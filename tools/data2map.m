function exitcode = data2map(in_fn, out_fn)
	UNIT_LENGTH = 0.5;   % Distance in meters per map unit.
	SAMPLE_RADIUS = 30;   % Radius of sample area in map units.

	% Fetch data
	fprintf('Loading data\n');
	format long;
	load(in_fn);
	lon = Longitude(:);
	lat = Latitude(:);

	% Calculate some dimensions
	fprintf('Calculating dimensions: ');
	origin = [min(lat), min(lon)];
	nigiro = [max(lat), max(lon)];   % Corner opposite origin
	map_x = 1000 * haversine([origin(1), nigiro(2)], origin) / UNIT_LENGTH;   % Map X unit length
	map_y = 1000 * haversine([nigiro(1), origin(2)], origin) / UNIT_LENGTH;   % Map Y unit length
	x_scale = map_x / (nigiro(2)-origin(2));
	y_scale = map_y / (nigiro(1)-origin(1));
	fprintf('%d, %d\n', map_x, map_y);

	% Build map
	fprintf('Building map\n');
	map = ones(map_y, map_x);
	%matlabpool open 4;
	for i = 1:30:length(lat)
		% Calculate location in meters relative to origin
		x = 1 + round(x_scale * (lon(i) - origin(2)));
		y = 1 + round(y_scale * (lat(i) - origin(1)));
		fprintf('%d/%d: (%d, %d)\n', i, length(lat), x, y);

		% Calculate sample area
		for dx = -SAMPLE_RADIUS:SAMPLE_RADIUS
			for dy = -SAMPLE_RADIUS:SAMPLE_RADIUS
				dist = sqrt(dx^2 + dy^2);
				if dist <= SAMPLE_RADIUS
					x_ = x + dx;
					y_ = y + dy;
					if x_ <= map_x && x_ >= 1 && y_ <= map_y && y_ >= 1
						map(y_,x_) = 0.5 * map(y_,x_);
					end
				end
			end
		end    
	end

	%scoremap
	%contour(scoremap);
	%hold on;
	f = fopen(out_fn, 'w');
	fprintf(f, '%d,%d,%f,%f\n', map_x, map_y, origin(1), origin(2));
	dlmwrite(out_fn, map, '-append');
	fclose(f);
