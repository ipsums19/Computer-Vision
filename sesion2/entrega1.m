% Ejercicio 1
% leemos la imagen y la convertimos a escala de grises
img = imread('bad_contrast.jpg');
G = rgb2gray(img);
% diferencia entre el pixel izquierdo y derecho
[Rows, Cols] =  size(G);
leftPixels = int16(G (:, 1:(Cols-1)));
rightPixels = int16(G(:, 2:Cols));
difference = abs(leftPixels - rightPixels);
% get position of max value
[M, p] = max (difference);
[m, x] = max(M);
y = p(x);
% dibuja un circulo en la imagen en la posicion del pixel
IMG = insertShape(G,'circle',[x y 5],'LineWidth',2, 'Color', 'blue');
imshow(IMG);
    