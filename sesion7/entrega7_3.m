I = rgb2gray(imread('normal-blood1.jpg'));
% binarizan
BW = I < 200;
BW = imfill(BW, 'holes');
% quitamos las celulas de los bordes
B = imfill( (1-BW), 'holes');
BW = BW - (1-B);
% erosionamos y obtenemos la celulas
SE = strel('disk', 30);
E = imerode(BW, SE);
%dejamos solo 1 punto y creamos la distancia euclidea
E2 = bwmorph(~E, 'shrink', Inf);
TD = bwdist(E2);
%filtramos por celulas
TD(~BW) = 0;
%obtenemos maximo
[m p] = max(TD(:))
[i j] = ind2sub(size(TD), p);

imshow(I, []); 
%pintamos el punto
line([j - 20, j + 20], [i, i]);
line([j, j], [i - 20, i + 20]);

