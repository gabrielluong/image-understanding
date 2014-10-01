im = imread('lena.png');

% create the Gaussian filter
sigma = 1;
filter = fspecial('gaussian', sigma * 3, sigma);

% compute the vertical and horizontal filters of the Gaussian filter
[U,S,V] = svd(filter);
vertical_filter = sqrt(S(1,1)) * U(:,1);
horizontal_filter = sqrt(S(1,1)) * V(:,1)';

tic;
% out = imfilter(im, filter, 'same', 'conv');
out = conv2(vertical_filter, horizontal_filter, im, 'same');
time_conv = toc;

imshow(out); % show the result of the convolution
fprintf('Time for convolution: %0.4f\n', time_conv);