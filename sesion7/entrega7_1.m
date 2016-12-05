
I = rgb2gray(imread('Wheel.bmp'));
% binarizamos
BW = I > 20; 
F = imfill(BW, 'holes');imshow(F);

% erocionamos
SE = strel('disk', 10);
E = imopen(F, SE);
figure; imshow(E);

% contar dientes
IM = F - E; figure; imshow(IM);
IM = bwmorph(IM, 'clean'); figure; imshow(IM);
C = bwconncomp(IM);
C.NumObjects