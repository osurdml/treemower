clear
close all
scoremap = csvread('scoremap.csv');
M1 = csvread('lm.out');
M2 = csvread('sh.out');
x1 = M1(:,1);
y1 = M1(:,2);
x2 = M2(:,1);
y2 = M2(:,2);
map = zeros(100,100);
figure;
contour(scoremap);
hold on
grid on
xlabel('X');
ylabel('Y','Rotation',0);
line(x1,y1,'Color','b','LineWidth',1,'Marker','.');
figure;
contour(scoremap);
hold on
grid on
xlabel('X');
ylabel('Y','Rotation',0);
line(x2,y2,'Color','b','LineWidth',1,'Marker','.');
