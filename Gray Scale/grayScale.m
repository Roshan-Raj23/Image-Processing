% Created by Roshan Raj, BT22ECE118
% To convert Color image to Grayscale.

clc;
clear all;
close all;

% Reading the image
I = imread('Images/image2.jpg');

% Grayscale img using single layer of color img
gray1 = I(:,:,1);

% Grayscale img using average method
r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);
gray2 = round((r+g+b)/3);                           

% Grayscale img using luminosity method
gray3 = round(0.299*r+0.587*g+0.114*b);

% Red version of image
Ired = I;
Ired(:,:,2) = 0;
Ired(:,:,3) = 0;

% Green version of image
Igreen = I;
Igreen(:,:,1) = 0;
Igreen(:,:,3) = 0;

% Blue version of image
Iblue = I;
Iblue(:,:,1) = 0;
Iblue(:,:,2) = 0;

% Displaying RGB versions
figure;
subplot (2,2,1), imshow(I); xlabel('Reference Image');
subplot (2,2,2), imshow(gray1); xlabel('Grayscale Image #1');
subplot (2,2,3), imshow(gray2); xlabel('Grayscale Image #2');
subplot (2,2,4), imshow(gray3); xlabel('Grayscale Image #3');


% Displaying Grayscale versions using various methods
figure;
subplot(2, 2, 1), imshow(I); xlabel('Reference Image');
subplot(2, 2, 2), imshow(Ired); xlabel('Red-Filtered Image');
subplot(2, 2, 3), imshow(Igreen); xlabel('Green-Filtered Image');
subplot(2, 2, 4), imshow(Iblue); xlabel('Blue-Filtered Image');