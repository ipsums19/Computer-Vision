%Binarització
I = imread('money.tif');
%imhist(I);
BW = I > 60;
imshow(BW);
A = sum(sum(I));
level = graythresh(I);
BWO = im2bw (I, level); figure; imshow(BWO);