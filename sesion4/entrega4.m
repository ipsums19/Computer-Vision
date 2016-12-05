function x = motion_blur(Img, angle)
   h = ones(10, 10)/100;
   x = imfilter(Img, h);
end
