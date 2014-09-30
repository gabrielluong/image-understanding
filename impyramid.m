% Compute the Gaussian pyramid
function out = impyramid(im)
% create the Gaussian filter
sigma = 5;
filter = fspecial('gaussian', sigma * 3, sigma);

% blur the image with the Gaussian filter
blur_im = imfilter(im, filter, 'same', 'conv');

% separate the channels of an RGB image
im_red = blur_im(:,:,1);
im_green = blur_im(:,:,2);
im_blue = blur_im(:,:,3);

% downsample the channels by a factor of 2
downsample_im_red = im_red(1:2:size(im_red,1), 1:2:size(im_red, 2));
downsample_im_green = im_green(1:2:size(im_green,1), 1:2:size(im_green, 2));
downsample_im_blue = im_blue(1:2:size(im_blue,1), 1:2:size(im_blue, 2));

% put the channels back together
out = cat(3, downsample_im_red, downsample_im_green, downsample_im_blue);
end
