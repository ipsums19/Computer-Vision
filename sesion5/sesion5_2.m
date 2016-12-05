%Binaritzacio imatges en color
I = imread('Entersmanuscrits1.jpg');
% INDG = rgb2gray(I);
% level = graytresh(INDG);
% BWO = im2bw(INDG, level);
% imshow(BWO);

H = rgb2hsv(I);
B = I(:,:,3) > 96;
%imshow(H(:,:,2),[])
%1 hip
%2 saturacio
%3 lluminusitat

%HSV(0-360º, 0-100%, 0-100%)
C = (230/360 - H(:,:,1)).^2 + (50/100 - H(:,:,2)).^2 + (22/100 -H(:,:,3)).^2;
BW = C < 0.25; imshow(BW);