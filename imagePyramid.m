% compute the image pyramid with 3 levels for waldo.png
im = imread('waldo.png');
im1 = impyramid(im);
im2 = impyramid(im1);
im3 = impyramid(im2);

imshow(im);
figure, imshow(im1);
figure, imshow(im2);
figure, imshow(im3);
