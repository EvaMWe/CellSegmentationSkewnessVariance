% This function will load tiff files from selected stack into Matlab
% output 3D Matrix

% pxlCell gives a cell frame containing the time vectors for each pixel
% sizeParameters is a vector containing the size parameters of the movie;
% first 2 values is the size of one frame, third value is the length of the
% movie (number of frames)

function [pxlCell, sizeParameters] = LoadTimeVec (fname, showImage, varargin)

info = imfinfo(fname);
frameNumber=numel(info);
if nargin <= 2
    numb = frameNumber;
else
    numb = varargin{1};
end
    
%preallocate memory for cell containing the time vectors for each pixle
imageSize = size(imread(fname,1));  %load one image to get the size;
numbPixl = imageSize(1) * imageSize(2);
pxlCell = cell(numbPixl,1);
sizeParameters = [imageSize(1) imageSize(2) numb];


for time=1:numb  % numb is similar to time
    timeFrame = double(imread(fname,time)); 
    pixlVec = reshape(timeFrame,numbPixl,1); %make a list    
    
    for pxl = 1:numbPixl
        pxlCell{pxl,1}(time) = pixlVec(pxl,1);
    end    
        
end

% if showImage == 1
%     figure (1)
%     img1 = imgStack(:,:,2);
%     imshow(img1,'DisplayRange',[min(img1(:)) max(img1(:))])
%     title ('initial frame')
%     
%     figure (2)
%     img2 = imgStack(:,:,frameNumber -1);
%     imshow(img2,'DisplayRange',[min(img2(:)) max(img2(:))])
%     title ('last frame')
% end

end