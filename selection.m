function [inclList1,inclList2] = selection (skewList, varList)

array = cat(2,skewList, varList);

%selection based on conditions according to scatter-plot
%
%1) skewness must be greater than 0.05
%2) include all pixels with a swekness of 0.4
%3) skweness between 0.25 and 0.36: variance > 1100
%4) skewness between 0.05 and 0.25: variance > 1300

%save candidates (cond 2):
inclList1 = find(array(:,1) >= 0.35);

%cond 1:
inclList2 = find(array(:,1) >= 0.005 & array(:,1) < 0.35 & array(:,2) > 1400);
%inclList3 = find(array(:,1) >= 0.005 & array(:,1) < 0.20 & array(:,2) > 1400);

end
