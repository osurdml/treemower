function exitcode = plotpath(scoremap_fn, path_fn)
	scoremap = csvread(scoremap_fn);
	M = csvread(path_fn);
	x = M(:,2);
	y = M(:,1);
	map = zeros(100,100);

	figure;
	contour(scoremap, 10);
	hold on
	grid on
	xlabel('X');
	ylabel('Y');
	line(x,y,'Color','b','LineWidth',1,'Marker','.');

	exitcode = 0;
end
