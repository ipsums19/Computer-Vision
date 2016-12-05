%Binaritzacio de gradients
I = rgb2gray(imread('Blispac2.tif'));
h = fspecial('average', 5);
F = imfilter(I, h);
D = (I-F) > 8; % el contorns no quedan ben localitzats
%imshow(D) 
BW = edge(I, 'sobel');%'sobel', 'canny', 'log'.
%sobel = localitzacio baixa
%canny = no els detecta tots pero bona localitzacio (diff sobel)
%log = passos per zero de la segona derivada
imshow(BW);
pause(10);
