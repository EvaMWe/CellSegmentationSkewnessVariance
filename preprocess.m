%this function will preprocess the data matrix before the variance or the
%covariance are calculated

function processedVec = preprocess (unprocessedVec)

my = mean(unprocessedVec);
%s = std(unprocessedVec);

processedVec = (unprocessedVec - my);

end
