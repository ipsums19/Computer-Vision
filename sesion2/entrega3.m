% Ejercicio 3
% leemos la imagen y la convertimos a escala de grises
img = imread('bad_contrast.jpg');
Original = rgb2gray(img);
% escalamos 3/7 y la volvemos a dejar como estaba
R = imresize(Original, 3/7);
Processed = imresize(R, 2.327); % aproximado 7/3, para que las dimensiones sean correctas
% media de la escala de grises de la imagen original
PN = mean2(Original);
% Desviacion estandard de la diferencia de imagenes
Diff = double(abs(int16(Original) - int16(Processed)));
Ps = std(Diff(:));
% calculamos el Signal Noise Ratio
SNR = 10*log10(Ps/PN)
imshow(Processed)
