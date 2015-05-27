clc;
close all;
clear all;

addpath ../examples
load image2M.mat;
imgM=imnorm(A);
load image2P.mat;
imgP=imnorm(B);

% imgF = imscale(FIHS(imgM, imgP));
imgF = FIHS(imgM, imgP);

figure,
    subplot(1, 3, 1), imshow(imgM(:,:,1:3))
    subplot(1, 3, 2), imshow(imgP)
    subplot(1, 3, 3), imshow(imgF(:,:,1:3))
    
RMSE(imgM, imgF)

imgF = modIHS(imgM, imgP);

figure,
    subplot(1, 3, 1), imshow(imgM(:,:,1:3))
    subplot(1, 3, 2), imshow(imgP)
    subplot(1, 3, 3), imshow(imgF(:,:,1:3))
    
RMSE(imgM, imgF)