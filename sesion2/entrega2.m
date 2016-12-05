% Ejercicio 2
% leemos la imagen y la convertimos a escala de grises
img = imread('bad_contrast.jpg');
G = rgb2gray(img);
% variables auxiliares
H = zeros (1, 256);
[Rows, Cols] =  size(G);
% bucle que recorre toda la matriz de la imagen
for i = 1:Rows
    for j = 1:Cols
        % contamos cada escala de gris cuantos pixeles tiene
        H(G(i,j)) = H(G(i,j)) + 1;
    end    
end
bar(H);

