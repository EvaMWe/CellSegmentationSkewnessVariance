%this function calculates the variance
% input is a preprocessed vector according to the function preprocess (
% x(i)j = (xj - myi) / sdi: subtracted mean, divided by standard deviation
% to normalize

function var = calcVar(preproVec)
N = length(preproVec);
product = preproVec*preproVec';
var = product/(N-1);
end

