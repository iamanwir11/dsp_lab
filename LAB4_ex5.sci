img = imread('F:\dsp_lab\anh_test.jpg');
img_gray = rgb2gray(img);

img_eq = imhistequal(img_gray);

h = fspecial('gaussian', [35 35], 15);
img_blur = imfilter(img_gray, h);

[r, c] = size(img_gray);
watermark = zeros(r, c);
watermark(20:80, 20:150) = 255;

img_watermarked = uint8(double(img_gray)*0.8 + double(watermark)*0.2);

figure(0);
f = gcf();
f.figure_size = [1000, 600];
f.background = 8;

subplot(2,3,1);
imshow(img_gray);
title('Anh goc (Grayscale)');

subplot(2,3,4);
counts = imhist(img_gray);
plot(counts);
title('Histogram cua Anh goc');

subplot(2,3,2);
imshow(img_eq);
title('Can bang Histogram');

subplot(2,3,5);
imshow(img_blur);
title('Anh bi lam mo (Gaussian Blur)');

subplot(2,3,3);
imshow(img_watermarked);
title('Anh chen Watermark');
