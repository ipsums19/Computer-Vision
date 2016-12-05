%Sessio 9
I = rgb2gray(imread('Chess_figures.png'));
BW = I > 128;
SE = strel('disk', 5);
BW = imopen(BW, SE);
BW = ~BW;
imshow(BW);
%segmentacio
CC = bwconncomp(BW);

%Caracteristiques
Props = regionprops(CC, 'Area', 'Extent', 'Eccentricity', 'Solidity',  'Perimeter');
X = cell2mat(struct2cell(Props))';
X = [X(:,2:4) ((X(:,5).^2)./X(:,1))];
Y = [string('cavall'); string('rei'); string('reina'); string('alfil'); string('torre'); string('peo')];

%classificador
f = TreeBagger(100,X,Y);

%table(f.classNames, scores, "variablenames",{'name','score'});
