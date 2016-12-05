% // Image Transform
img = imread('bad_contrast.jpg');
G = rgb2gray(img);

% // Create object Transformation
T = affine2d([1 0 0; .5 1 0; 50 100 1]);
% // Apply tranform T
% Gtr = imwarp(G, T);
%Gtr = imwarp(G, T), 'OutputView', imref2d (size(G) + [100 50]));
Gtr = imrotate(G, -45);
Gtr2 = imwarp(G, T);
imshow(Gtr)
hold on;
imshow(Gtr2)