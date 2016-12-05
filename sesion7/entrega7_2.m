
I = rgb2gray(imread('normal-blood1.jpg'));
% binarizan
BW = I < 200;
BW = imfill(BW, 'holes'); figure; imshow(BW);
% quitamos las celulas de los bordes
B = imfill( (1-BW), 'holes'); figure; imshow(B);
BW = BW - (1-B); imshow(BW);
% erocionamos y obtenemos la celulas
SE = strel('disk', 30);
E = imerode(BW, SE);
figure; imshow(E);
% Contamos el numero de celulas
C = bwconncomp(E);
C.NumObjects