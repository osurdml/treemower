clear
close all
scoremap = csvread('../data/costmap2.txt');
M = csvread('../output/sh.out');
x = M(:,1);
y = M(:,2);
map = zeros(100,100);
figure;
contour(scoremap);
hold on
grid on
axis manual %// prevent axis from auto-scaling
xlabel('X');
ylabel('Y','Rotation',0);

TOTAL_POINTS = size(x);
for i=1:TOTAL_POINTS
    line([x(i) x(i+1)], [y(i) y(i+1)],'Color','b','LineWidth',1,'Marker','.');
    %pause(.002) %// pause 0.1 seconds to slow things down
    drawnow
endfor

