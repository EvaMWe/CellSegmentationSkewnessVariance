% this function takes the reduced image according to max skewness and
% determines the connected areas and assign them to cell candidates

% To DO
% eliminate single, not connected values

%idxList: contains a a list of indices of pixels that are  involved in a
%signal and set to one;
%sizParameter: size of one frame
%minArea: minimal pixel number to be count as a cell
%
% returns a data struct containing 
% .pxlList: a list of pxl for each ROI, 
% .show: the template (for display)

function template = getTemp(idxList, sizPara, minArea)

bw = zeros(sizPara(1),sizPara(2));
bw(idxList) = 1;
%bw = im2bw(image); %Verwandelt Bild in ein binäres Bild; alle Werte > "level" == 1 und < "level" == 0
bw = imclearborder(bw); %Eliminiert Bereiche die in Kontakt mit Grenzen stehen
bw = imfill(bw,'holes');
[L,num]=bwlabel(bw,4);

%create a struct with info
templateTemp = regionprops(L,'PixelIdxList');
templateTemp2 = regionprops(L,'PixelList');

%remove single pixels

count = 1;
amountAll = 0;
template = repmat(struct('pxlList',1), num, 1 );

for i = 1:num
    amount = length(templateTemp(i).PixelIdxList);
    if amount > minArea
    template(count).pxlIdxList = templateTemp(i).PixelIdxList;
    template(count).pxlList = templateTemp2(i).PixelList;
    amountAll = amountAll + amount;
    count = count +1;
    end    
end
template(count:end) = [];


% creates a pixel vector conaining all pixels belonging to an ROI
pixelVector = zeros(amountAll,1);
start = 1;
for i=1:count-1
    fill = template(i).pxlIdxList;
    n = length(fill);
    if i ~= 1
     start = find(pixelVector ==0, 1);
    end
    pixelVector(start:start+n-1) = fill;
end


templateImg = zeros(size(bw));
templateImg(pixelVector) = 1;

template(1).show = templateImg;

%need: -idx per region

end


