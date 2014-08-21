clear
close all
scoremap = csvread('../data/costmap2.txt');
M = csvread('../output/sh.out');
x = M(:,1);
y = M(:,2);
map = zeros(100,100);
figure;
contour3(scoremap, 50);
hold on
grid on
axis manual %// prevent axis from auto-scaling
xlabel('X');
ylabel('Y','Rotation',0);

TOTAL_POINTS = size(x);
for i=TOTAL_POINTS-1:-1:1
	px1 = x(i)+1;
	py1 = y(i)+1;
	px2 = x(i+1)+1;
	py2 = y(i+1)+1;
    plot3([py1 py2], [px1 px2], [scoremap(px1, py1) scoremap(px2, py2)], 'Color','b','LineWidth',1,'Marker','.');
    %pause(.002) %// pause 0.1 seconds to slow things down
    drawnow
endfor

