% cell segmentation by VAR_MAX_COVAR
% selection of pixel with a high variance
% non-maximum suppression for sparsal classification
% segmetal covariance

function  [data, sizeParameters] = cellSeg(data)

%hier multi einfügen: for exp = 1:length(dataComplete)
[timeVectors, sizeParameters] = LoadTimeVec(data, 0); 

showHist = 0;
minArea = 10;
varList = getVar(timeVectors, showHist);
skewList = getSkewness(timeVectors, showHist); 
[data1, data2] = selection (skewList, varList); %returns lists

data1 = getTemp(data1, sizeParameters(1:2), minArea);
data2 = getTemp(data2, sizeParameters(1:2), minArea);

data = concateStruct(data1, data2);
% extract the data from each image within the movie
end

