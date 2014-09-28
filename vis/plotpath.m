function exitcode = plotpath(scoremap_fn, path_fn)
	scoremap = csvread(scoremap_fn);
	M = csvread(path_fn);
	x = M(:,1);
	y = M(:,2);
	map = zeros(100,100);

	figure;
	contour(scoremap, 10);
	hold on
	grid on
	title(scoremap_fn)
	xlabel('X');
	ylabel('Y');
	line(y,x,'Color','b','LineWidth',1,'Marker','.');

	exitcode = 0;
end
