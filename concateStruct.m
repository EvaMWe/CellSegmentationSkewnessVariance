function structAll = concateStruct(set1, set2)

len1 = length(set1);
len2 = length(set2);

num = len1 + len2;

structAll = repmat(struct('pxlList',1), num, 1 );

%insert set 1
for plus = 1:len1
    structAll(plus).pxlList = set1(plus).pxlList;
    structAll(plus).pxlIdxList = set1(plus).pxlIdxList;
end

%insert set 2

for plus = 1:len2
    structAll(len1+plus).pxlList = set2(plus).pxlList;
    structAll(len1+plus).pxlIdxList = set2(plus).pxlIdxList;
end

%create image

image = zeros(size(set1(1).show));
image(set1(1).show == 1 | set2(1).show == 1) = 1;
structAll(1).show = image;

end