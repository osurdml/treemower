function exitcode = animplot(scoremap_fn, path_fn)
	scoremap = csvread(scoremap_fn);
	M = csvread(path_fn);
	x = M(:,2);
	y = M(:,1);
	map = zeros(100,100);
	figure;
	contour3(scoremap, 50);
	hold on
	grid on
	%axis manual %// prevent axis from auto-scaling
	xlabel('X');
	ylabel('Y');

	TOTAL_POINTS = size(x);
	for i=TOTAL_POINTS-1:-1:1
		px1 = x(i)+1;
		py1 = y(i)+1;
		px2 = x(i+1)+1;
		py2 = y(i+1)+1;
		plot3([px1 px2], [py1 py2], [scoremap(py1, px1) scoremap(py2, px2)], 'Color','b','LineWidth',1,'Marker','.');
		pause(0.001)
	end

	exitcode = 0;
end
