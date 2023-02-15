count = 0;
img = imread('text.png');
match = img(33:45, 88:99);
a = conv2(double(img), rot90(match,2), 'same');
log = a==sum(sum(match));
count = sum(sum(log));

a = conv2(double(img), rot90(flipud(match'), 2), 'same');
log = a==sum(sum(match'));
count = count + sum(sum(log));
