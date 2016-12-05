I = double(rgb2gray(imread('Board.bmp')));
h = fspecial('sobel');
v = h';
gx = imfilter(I, h);
gy = imfilter(I, v);
g = hypot(gx, gy);
%imshow(g, []);

a = atan2(gy, gx);
%figure; imshow(a, []);
%figure;imhist(mat2gray(a));
sigma = 1; 
g1 = fspecial('gaussian', 10, sigma);
g2 = fspecial('gaussian', 10, sigma/3);
f1 = imfilter(I, g1);
f2 = imfilter(I, g2);
g = f1 - f2; % aproximant laplacia
imshow(g, []);