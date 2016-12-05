% leemos la imagen y la convertimos a escala de grises
img = rgb2gray(imread('Jupiter.jpg'));
% aplicamos ruido para ver la diferencia
I = imnoise(img, 'salt & pepper', 0.05);
IF = I;
[r c] = size(I);
% vector para guardar la suma de los vecinos de cada apixel
Sums = zeros(1, c);
% Suma actual apra realizar el filtrado 
Current = 0;
% Ignoramos los bordes, suponemos una ventana de 3x3 y todos los pixels
% vecinos con el mismo peso
for i = 2:(r-1)
    % Calculamos Sums  
    Sums = sum(I(i-1:i+1 , :));
    % Calculamos el primer pixel 
    Current = sum (Sums(1:3));
    IF(i, 2) = Current / 9;
    for j = 3:(c-1)
        % calculamos los siguiente pixels, 
        % ahorrando tener que volver a sumarlo todo
        Current = Current - Sums(j-2) + Sums(j+1);
        IF(i,j) = Current / 9;                
    end    
end
% Mostramos las imagenes de salida
imshow(I);
figure;
imshow(IF);
