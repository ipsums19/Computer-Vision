% leemos la imagen y la convertimos a escala de grises
img = rgb2gray(imread('Jupiter.jpg'));
% aplicamos ruido para ver la diferencia
IN = imnoise(img, 'salt & pepper', 0.05);
IF = IN;
[r, c] = size(IN);
% Recorremos la imagen
for i = 1:(r)    
    for j = 1:(c)     
        pixel = IN(i, j);
        % si encontramos un pixel blanco o negro
        % aplicamos el filtro mediana (no lineal)
        if (pixel == 0 || pixel == 255)     
            % calculamos todos los pixeles para aplicar el filtro
            % suponemos una ventana de 3x3, menos en los bordes (solo pixeles vecinos)
            x1 = i-1; if (i == 1) x1 = 1; end;
            x2 = i+1; if (i == r) x2 = r; end;
            y1 = j-1; if (j == 1) y1 = 1; end;
            y2 = j+1; if (j == c) y2 = c; end;
            % miramos la mediana y la ponemos en el pixel
            X = IN(x1:x2 , y1:y2);
            IF(i, j) = median(X(:));
        end                    
    end    
end
% Mostramos las imagenes de salida.
imshow(IN);
figure;
imshow(IF);
