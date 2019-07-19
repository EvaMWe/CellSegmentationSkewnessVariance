%this function will calculate the variance of pixel assigned time lapses

%time vector is a cell containing the time lapse assigned to a specific
%pixel

function varList = getVar(timeVectors, showHist)
numbPxl = length(timeVectors);
if ~isa(numbPxl,'double')
    numbPxl = gather(numbPxl(1,1));
end
varList = zeros(numbPxl,1);
for pxl = 1:numbPxl
    vec = cell2mat(timeVectors(pxl,1));
    vec=gather(vec);
    vecPro = preprocess(vec);
    var = calcVar(vecPro);
    varList(pxl,1) = var;
end

if showHist == 1
    histogram(varList)
end

end