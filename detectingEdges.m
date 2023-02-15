thresh = 350;
img = imread("moon.tif");
subplot(1,4,1)
imshow(img)
title("moon.tif")
axis tight equal
filter = fspecial("sobel");              %Horizontal kernel
edges = conv2(img, filter, "same");
subplot(1, 4, 2)
axis tight equal
a = abs(edges) > thresh;
[X, Y] = meshgrid(1:1:358, -(1:1:537));
contour(X, Y, a, [1,1])
title("Horizontal detection")
axis tight equal
edges2 = conv2(img, filter', "same");
aa = abs(edges2) >thresh;
subplot(1, 4, 3)
contour(X, Y, aa, [1,1])
title("Vertical detection")
axis tight equal
edges3 = sqrt(edges.^2 + edges2.^2);
subplot(1, 4, 4)
aaa = abs(edges3) > thresh;
contour(X, Y, aaa, [1,1])
title("Detected edges")
axis equal tight

%------------------------ Better approach ---------------------------

%img = imread('moon.tif');
%[px, py] = gradient(double(img));
%[X, Y] = meshgrid(1:1:358, -(1:1:537));
%contour(X,Y,double(img))
%hold on
%quiver(X,Y,px,py)
%div = divergence(X,Y,px,py);
%surf(X,Y,div)
%mag = sqrt(px.^2 + py.^2);
%figure
%contour(X, Y, abs(mag)>50, [1,1])
%axis equal tight

%Another approach can be Laplacian of Gaussian Filter.
