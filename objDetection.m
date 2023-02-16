img = imread('cameraman.tif');
subplot(2, 3, 1)
image(img)
axis equal tight
colormap(gray)
title('cameraman.tif')

subplot(2, 3, 2)
imhist(img)
title('Intensity distribution')
xline(88, 'r', 'LineWidth', 2)
h = imhist(img);
thrsh = otsuthresh(h)*(size(img, 1)-1);
mask = img<thrsh;

subplot(2, 3, 3)
imagesc(mask)
title('Mask')
axis tight equal

sigma = 5;
w = [30, 30];
filt = fspecial('gaussian', w, sigma);
filtered = conv2(mask, filt, 'same');
subplot(2, 3, 4)
imagesc(filtered)
title('Gaussian-filtered')
axis tight equal

mask2 = filtered>0.5;
subplot(2, 3, 5)
imagesc(mask2)
title('Second mask')
axis tight equal

comp = bwconncomp(mask2);
segm = zeros(size(mask2));
segm(comp.PixelIdxList{1}) = 1;
subplot(2, 3, 6)
imagesc(segm)
title('After filtering irrelevant parts')
axis tight equal
subplot(2, 3, 1)
hold on
contour(segm, [0.5,0.5], 'r', 'LineWidth', 1.5)
legend('Deteced')
