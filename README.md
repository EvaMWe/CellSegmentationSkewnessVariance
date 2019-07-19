# CellSegmentationSkewnessVariance
This algorithmn performs a data segmentation based on data variance and skewness with the goal to get areas showing fluorescence signals in a frame sequence <br>

<h2> SYNTAX </h2>
[data, sizeParameters] = cellSeg(data);

<h2> DESCRIPTION </h2>

input data is a NxMx3 Matrix representing a stack of frames. <br>
output : returns a data struct containinga list of pxl for each ROI (.pxlList) and the mask (template for dsplaying) (.show)<br><br>
 
data points are rearranged resulting in an matrix with intensity values stored in rows for each pixel in columns<br>
for each pixel variance and skewness are computed and thresholded (selection)<br>
region of interests are defined including a minimum value of pixels<br>

