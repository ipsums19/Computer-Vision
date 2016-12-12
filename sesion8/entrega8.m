I = rgb2gray(imread('cellsegmentationcompetition.png'));
%extreura marc
M = I == 255;
SE = strel('disk', 5);
%dilatem marc
E = imdilate(M, SE);
%marc a 0;
I(E) = 0;
%busquem celules
BW = I > 20;
%eliminem forats
BW = imfill(BW, 'holes');
%transformacio
TD = bwdist(1-BW, 'euclidean');
%eliminem celules petites
TD = imopen(TD, SE);


%suavitzar
TDS = imgaussfilt(TD, 5);
TDS = 1 - TDS;
TDS(BW==0)=-Inf;
%watershed
WS = watershed(TDS);
C = WS == 0;


%imatge+contorns
SE2 = strel('disk', 1);
E = imdilate(C, SE2);
I(E) = 255;
imshow(I);
