% this function performs a data segmentation according to skewness and
% variance in signals derived from frames sequences

% SYNTAX
% [data, sizeParameters] = cellSeg(data);

%DESCRIPTION
% input data is a NxMx3 Matrix representing a stack of frames.
% output : returns a data struct containinga list of pxl for each ROI
% (.pxlList) and the mask (template for dsplaying) (.show)
% 
%data points are rearranged resulting in an matrix with intensity values stored in rows for each pixel in columns
%for each pixel variance and skewness are computed and thresholded (selection)
%region of interests are defined including a minimum value of pixels


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

