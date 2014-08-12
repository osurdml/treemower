%% compare receding horizon and systematic
% x = 100:100:1000;
% y1 = INFO(1,:);
% y2 = INFO(2,:);
% figure
% hold on
% plot(x,y1,'-.or','MarkerFaceColor','g');
% plot(x,y2,'-.ob','MarkerFaceColor','g');
% legend('Receding Horizon','Systematic');
% title('Infomation Gathering');
% xlabel('Budget');
% ylabel('Information');

%% percent comparing
x = 100:100:1000;
y1 = INFO(1,:);
y2 = INFO(2,:);
y3 = INFO(3,:);
y4 = INFO(4,:);
figure
hold on
plot(x,y1,'-.or','MarkerFaceColor','g');
plot(x,y2,'-.ob','MarkerFaceColor','g');
plot(x,y3,'-.oy','MarkerFaceColor','g');
plot(x,y4,'-.ok','MarkerFaceColor','g');
legend('25%','50%','75%','100%');
title('Infomation Gathering');
xlabel('Budget');
ylabel('Information');