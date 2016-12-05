%mesurar la presicio de l'operador sobel i prewidth en calcular l'angle d'un contorn
%creem imatge sintetica
I = double(ones(100));
%creem contorn
I(50:100,:) = 0;
%efecta sobel
h = fspecial('sobel');
v = h';
for i = 1:90    
    %rotem
    I2 = imrotate(I, i, 'bilinear', 'crop');
    %apliquem filtres
    I2 = imfilter(I2, fd);
    gx = imfilter(I2, h);
    gy = imfilter(I2, v);
    b = atan2(gy, gx);
    %calculem angles
    sobel(i) = radtodeg(b(50, 50));
    sobel2(i) = i - radtodeg(b(50, 50));

end
%mostrem figures
plot(1:90, sobel); figure
plot(1:90, sobel2);

