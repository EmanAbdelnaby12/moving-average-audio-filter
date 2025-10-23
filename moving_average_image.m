clc
clear 
close all

img = imread('dog.JPG'); % Grayscale image 

% Convert image to double for processing
img_double = double(img);

% Add Gaussian noise to the image
noisy_img = imnoise(img, 'gaussian', 0, 0.01);

% Define moving average filter
windowSize = 5; % 5x5 averaging filter
h = fspecial('average', windowSize);

% Apply the moving average filter to noisy image
filtered_img = imfilter(noisy_img, h, 'replicate');

figure;
subplot(3,1,1);
imshow(img);
title('Original Image');

subplot(3,1,2);
imshow(noisy_img);
title('Noisy Image');

subplot(3,1,3);
imshow(filtered_img);
title('Filtered Image (Moving Average)');

