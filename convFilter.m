t = 1:10;
rng(0);
y = randn(1,10);

tnew = 1:0.01:10;
ynew = interp1(t,y,tnew, 'spline');

w = 40;
ynoisy = awgn(ynew,15,'measured');
filtered = conv(ynoisy, ones(1,w)/w, 'same');

sigma = w/6;
gaussian_filter = fspecial('gaussian', [1, w], sigma);
gFiltered = conv(ynoisy, gaussian_filter, 'same');

subplot(4,1,1)
plot(tnew, ynew,'r', 'LineWidth', 1.1)
title('Original siganl')

subplot(4,1,2)
plot(tnew, ynoisy, 'g')
title('Noisy signal')

subplot(4,1,3)
plot(tnew, filtered, 'k', 'LineWidth', 1.1)
title('Box-filtered')

subplot(4,1,4)
plot(tnew, gFiltered, 'b')
title('Gaussian-filtered')
