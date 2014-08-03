x = 500:500:5000;
y1 = INFO(2,:);
y2 = INFO(3,:);
figure
hold on
plot(x,y1,'-.or','MarkerFaceColor','g');
plot(x,y2,'-.ob','MarkerFaceColor','g');
legend('Receding Horizon','Systematic',2);
title('Infomation Gathering');
xlabel('Budget');
ylabel('Information');
