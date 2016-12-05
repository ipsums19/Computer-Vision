%Sessio 6
%segmentacio per veinatge d'imatge binaries

I = imread('airplane.tif');
BW = I > 60;

c = bwconncomp(BW); %returns a struct
c.PixelIdxList{1}; %llista de llistes de punts expressats com a offset des de l'inici

%vector de 13 elements, on cada element indica el nombre de pixels segmentats
npixels = cellfun(@numel, c.PixelIdxList);
[v, i] = max(npixels);
BW(c.PixelIdxList{i}) = 0;
J = I - 512*uint8(BW);
%imshow(J);

%calcular el centroide d'una regio
s = regionprops(c, 'centroid');
s(i).Centroid

s = regionprops(c, 'centroid', 'boundingBox');
s(i).BoundingBox

%segmentacio per quadtree
S = qtdecomp(I, @my_split);

blocks = repmat(uint8(0), size(S));
for dim = [512 256 128 64 32 16 8 4 2 1];    
    numblocks = length(find(S==dim));    
    if (numblocks > 0)        
        values = repmat(uint8(1),[dim dim numblocks]);
        values(2:dim,2:dim,:) = 0;
        blocks = qtsetblk(blocks,S,dim,values);
    end
end
blocks(end,1:end) =1;
blocks(1:end,end) = 1;
imshow(I),figure,imshow(blocks*256+I,[])

%**************************************************
%**************   KMEAN  **************************
%**************************************************

%c = kmeans(X, N); X no es una imatge es un vector
I = imread('Bird24b.bmp');
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
O = [R(:), G(:), B(:)];
C = kmeans(double(O),2);
imagesc(reshape(C, 202, 272));
