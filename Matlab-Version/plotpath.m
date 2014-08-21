clear
close all
scoremap = csvread('../data/costmap2.txt');
M1 = csvread('../output/lm.out');
M2 = csvread('../output/sh.out');
x1 = M1(:,2);
y1 = M1(:,1);
x2 = M2(:,2);
y2 = M2(:,1);
map = zeros(100,100);
figure;
contour(scoremap, 30);
hold on
grid on
xlabel('X');
ylabel('Y','Rotation',0);
line(x1,y1,'Color','b','LineWidth',1,'Marker','.');
figure;
contour(scoremap, 30);
hold on
grid on
xlabel('X');
ylabel('Y','Rotation',0);
line(x2,y2,'Color','b','LineWidth',1,'Marker','.');
