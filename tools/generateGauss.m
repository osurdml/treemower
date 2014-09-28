function [X,Y,Z] = generateGauss(sideSize, maxNoise, numSources)

sources = zeros(numSources,2);
sourceStd = zeros(numSources,1);
for k = 1:numSources
    sources(k,1) = rand()*(sideSize-1)+1;
    sources(k,2) = rand()*(sideSize-1)+1;
    sourceStd(k) = rand()*maxNoise;
end

Z = zeros(sideSize,sideSize);
for i = 1:sideSize
    for j = 1:sideSize
        X(i,j) = i;
        Y(i,j) = j;
        Z(i,j) = 0;
        for k = 1:numSources
            Z(i,j) = Z(i,j) + exp(-sqrt(sum(([i j]-sources(k,1:2)).^2))/sourceStd(k));
        end
    end
end

end