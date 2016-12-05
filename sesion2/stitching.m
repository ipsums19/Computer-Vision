function ret = stitching( T )
% Ejercicio 4
% leemos la imagen y la convertimos a escala de grises
img = imread('bad_contrast.jpg');
G = rgb2gray(img);
G2 = G
% transform image
G1 = imwarp(G, affine2d(T));
% calculate canvas
[r1, c1] = size(G1)
[r2, c2] = size(G2);
canvas = [r1; c1];
% not move
Tmove = affine2d([1 0 0; 0 1 0; 0 0 1]);
G1 = imwarp(G1, Tmove, 'OutputView', imref2d (canvas));
% move down
Tmove = affine2d([1 0 0; 0 1 0; 0 0 1]);
G2 = imwarp(G2, Tmove, 'OutputView', imref2d (canvas));
% result image
imshow(G2 + G1)
ret = G1 + G2;
end

