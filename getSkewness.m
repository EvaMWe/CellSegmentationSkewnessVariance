%this function will calculate the variance of pixel assigned time lapses

%time vector is a cell containing the time lapse assigned to a specific
%pixel

function skewList = getSkewness(timeVectors, showHist)
numbPxl = length(timeVectors);
skewList = zeros(numbPxl,1);
for pxl = 1:numbPxl
    vec = cell2mat(timeVectors(pxl,1));
    vecPro = preprocess_skew(vec);
    skew = calcSkew(vecPro);
    skewList(pxl,1) = skew;
end

if showHist == 1
    histogram(skewList)
end

end