im = imread('temple.jpg');
[imMag, imDir] = imgradient(rgb2gray(im));

imMag = uint8(imMag);

figure, imshow(im);
figure, imshow(imMag);