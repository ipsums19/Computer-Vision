% cremoas imagen, blanco arriba y negro abajo
I =  double (ones(200));
I(100:200, :) = 0;

% sobel error
errorSobel = zeros(90, 1);
% suavizado
fd = fspecial('disk', 3);
% sobel
h = fspecial('sobel');
v = h';
for i = 1:90
    Ir = imrotate(I, i, 'bilinear','crop');
    Ir = imfilter(Ir, fd);
    gx = imfilter(Ir, h);
    gy = imfilter(Ir, v);
    a = atan2(gy, gx);
    errorSobel(i) = rad2deg(a(100, 100));    
end
plot(1:90,errorSobel);

% sobel error
errorSobel = zeros(90, 1);
% suavizado
fd = fspecial('disk', 3);
% sobel
h = fspecial('sobel');
v = h';
for i = 1:90
    Ir = imrotate(I, i, 'bilinear','crop');
    Ir = imfilter(Ir, fd);
    gx = imfilter(Ir, h);
    gy = imfilter(Ir, v);
    a = atan2(gy, gx);
    errorSobel(i) = rad2deg(a(100, 100));    
end
errorSobel;



