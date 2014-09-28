function exitcode = animpath(map_fn, path_fn)
	map = csvread(map_fn);
	path = csvread(path_fn);

	% Get map dimentions from first row
	map_x = map(1,1);
	map_y = map(1,2);
	map = map(2:end, :);
	path = path(2:end, :);
	x = path(:,1);
	y = path(:,2);

	figure;
	contour3(map, 50);
	hold on
	grid on
	title(map_fn)
	xlabel('X');
	ylabel('Y');

	TOTAL_POINTS = size(x);
	for i=1:1:TOTAL_POINTS-1
		px1 = x(i)+1;
		py1 = y(i)+1;
		px2 = x(i+1)+1;
		py2 = y(i+1)+1;
		plot3([px1 px2], [py1 py2], [map(py1, px1) map(py2, px2)], 'Color','b','LineWidth',1,'Marker','.');
		pause(0.001)
	end

	exitcode = 0;
end
