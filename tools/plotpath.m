function exitcode = plotpath(map_fn, path_fn)
	map = csvread(map_fn);
	path = csvread(path_fn);

	% Get map dimensions from first row
	map_x = map(1,1);
	map_y = map(1,2);
	map = map(2:end, :);
	path = path(4:end, :);
	x = path(:,1);
	y = path(:,2);

	figure;
	contour(map, 10);
	hold on
	grid on
	title(map_fn)
	xlabel('X');
	ylabel('Y');
	line(x,y,'Color','b','LineWidth',3,'Marker','.');
	axis equal;

	exitcode = 0;
end
