I = rgb2gray(imread('Blispac2.tif'));
%calculamos el histograma acumulado
C = cumsum(imhist(I));
plot(C)
%area de los pixeles oscuros aproximadamente
area = 276000;
%empezamos con el tresh a 0 y vamos asignandolo para cada bucle
thresh = 0;
%bucle para recorrer todo el histograma
for i = 1:256
    %si superamos la area salimos del bucle
    if C(i) > area
        break;
    end
    %asignamos el tresh para cada vuelta
    thresh = i;
end
%mostramos binario
figure; imshow(I>thresh);
%comprobamos que el resultado sea aproximadamente el area dada
sum(sum(I<thresh))
