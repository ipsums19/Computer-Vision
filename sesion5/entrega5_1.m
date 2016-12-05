I = rgb2gray(imread('Blispac2.tif'));
%busquem minim i max
lmax = max(max(I));
lmin = min(min(I));
%alfa entre [0 1]
alfa = 0.5;
%calculem llindar
llindar = alfa*(lmax - lmin) + lmin;
%apliquem llindar
F = I > llindar
imshow(F);