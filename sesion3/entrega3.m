% % leemos la imagen
% im = imread('rabbit.jpg');
% % Aplicamos un filtro, para suavizar perdemos detalles (contornos)
% h = fspecial('disk', 5);
% I = imfilter(im, h);
% imshow(I);
% % hacemos la diferencia con la imagen original
% % asi nos quedamos solo con el contorno
% R = im - I;
% figure, imshow(R, []);
% figure, imshow(R);


im = double(imread('rabbit.jpg'));
k = fspecial('sobel');
k = k / 4;
gy = imfilter(im, k, 'conv', 'replicate');
gx = imfilter(im, k', 'conv', 'replicate');


mod = sqrt( double(gy.^2 + gx.^2));

imshow(uint8(im))
imshow(uint8(mod))