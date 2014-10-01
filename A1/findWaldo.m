template = imread('template.png');
waldo = imread('waldo.png');

% compute the magnitude of gradients for the images
[template_grad_mag, template_grad_dir] = imgradient(rgb2gray(template));
[waldo_grad_mag, waldo_grad_dir] = imgradient(rgb2gray(waldo));

template_grad_mag = uint8(template_grad_mag);
waldo_grad_mag = uint8(waldo_grad_mag);

figure, imshow(uint8(template_grad_mag));
figure, imshow(waldo_grad_mag);

% normalized cross-correlation
out = normxcorr2(template_grad_mag, waldo_grad_mag);

% plot the cross-correlation results
figure('position', [100,100,size(out,2),size(out,1)]);
subplot('position',[0,0,1,1]);
imagesc(out)
axis off;
axis equal;

% find the peak in response
[y,x] = find(out == max(out(:)));
y = y(1) - size(template_grad_mag, 1) + 1;
x = x(1) - size(template_grad_mag, 2) + 1;

% plot the detection's bounding box
figure('position', [300,100,size(im,2),size(im,1)]);
subplot('position',[0,0,1,1]);
imshow(waldo)
axis off;
axis equal;
rectangle('position', [x,y,size(template_grad_mag,2),size(template_grad_mag,1)], 'edgecolor', [0.1,0.2,1], 'linewidth', 3.5);
