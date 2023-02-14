img = imread("cameraman.tif");
[r, c] = size(img);
nr = 1000;
nc = 1500;
[R, C] = meshgrid(1:(r-1)/(nr-1):r, 1:(c-1)/(nc-1):c);
nimg = interp2(double(img), R, C);
imagesc(nimg)
colormap(gray)
