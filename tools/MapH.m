function [DCnorm,Z1norm,Z1] = MapH(X,Y,Z,XGoal1,YGoal1,ZGoal1)
%This function outputs everything we need from the graph. 
[X1,Y1,Z1] = generateGauss(X, Y, Z);
Z1norm = (Z1 - min(Z1(:)))/(max(Z1(:)) - min(Z1(:)));
[m,n]=size(Z1);
Z1=zeros(X);
DistanceCost=zeros(size(Z1));

for i=1:size(Z1,1)
    for j=1:size(Z1,2)
        k=1:size(Z1,3);
        Goal1Cost(i,j)=sqrt((i-XGoal1)^2+(j-YGoal1)^2+(k-ZGoal1)^2);
    end
end
DistanceCost = Goal1Cost;
DCnorm = (DistanceCost - min(DistanceCost(:)))/(max(DistanceCost(:)) - min(DistanceCost(:)));
end

