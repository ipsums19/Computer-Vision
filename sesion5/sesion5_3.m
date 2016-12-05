%Binaritzacio multinivell
I = imread('calc.tif');
T = multithresh(I, 2);%N = numero thresh, N+1 lvls
J = imquantize(I, T);
imshow(J, []);