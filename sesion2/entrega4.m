% Ejercicio 4
% leemos la imagen y la convertimos a escala de grises
img = imread('bad_contrast.jpg');
G = rgb2gray(img);
G2 = G
[r1, c1] = size(G);
theta = 45;
Rotation = [cos(theta) -sin(theta); sin(theta) cos(theta)];
Point =  [r1 ; c1];
% rotate image -45
G1 = imrotate(G, -45);
% calculate canvas
[r1, c1] = size(G1)
[r2, c2] = size(G2);
canvas = [r2 + Point(2); int16(c1*1.5)];
% move right
Tmove = affine2d([1 0 0; 0 1 0; c1*0.5 0 1]);
G1 = imwarp(G1, Tmove, 'OutputView', imref2d (canvas));
% move down
Tmove = affine2d([1 0 0; 0 1 0; 0 Point(2) 1]);
G2 = imwarp(G2, Tmove, 'OutputView', imref2d (canvas));
% result image
imshow(G1 + G2)