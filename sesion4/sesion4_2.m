%mesurar la presicio de l'operador sobel i prewidth en calcular l'angle d'un contorn
%creem imatge sintetica
I = double(ones(100));
%creem contorn
I(50:100,:) = 0;
%efecta prewitt
h = fspecial('prewitt');
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
    prewitt(i) = radtodeg(b(50, 50));
    prewitt2(i) = i - radtodeg(b(50, 50));

end
%mostrem figures
plot(1:90, prewitt); figure
plot(1:90, prewitt2);