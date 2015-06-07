clc;
close all;
clear all;

addpath ../examples
fprintf('Example 1\n')
load image1M.mat;
imgM=imnorm(A);
load image1P.mat;
imgP=imnorm(B);
% load image4R.mat;
% imgR=imnorm(C);

imgF = imnorm(FIHS(imgM, imgP));
% imgF = FIHS(imgM, imgP);

figure,
    subplot(1, 3, 1), imshow(imgM(:,:,1:3))
    subplot(1, 3, 2), imshow(imgP)
    subplot(1, 3, 3), imshow(imgF(:,:,1:3))
    
    
fprintf('IHS RMSE: %f\n', RMSE(imgM, imgF)) 

imgF = modIHS(imgM, imgP);

figure,
    subplot(1, 3, 1), imshow(imgM(:,:,1:3))
    subplot(1, 3, 2), imshow(imgP)
    subplot(1, 3, 3), imshow(imgF(:,:,1:3))
    
fprintf('IHS RMSE: %f\n', RMSE(imgM, imgF))

fprintf('Example 2\n')
load image2M.mat;
imgM=imnorm(A);
load image2P.mat;
imgP=imnorm(B);
% load image4R.mat;
% imgR=imnorm(C);

imgF = imnorm(FIHS(imgM, imgP));
% imgF = FIHS(imgM, imgP);

figure,
    subplot(1, 3, 1), imshow(imgM(:,:,1:3))
    subplot(1, 3, 2), imshow(imgP)
    subplot(1, 3, 3), imshow(imgF(:,:,1:3))
    
fprintf('IHS RMSE: %f\n', RMSE(imgM, imgF)) 

imgF = modIHS(imgM, imgP);

figure,
    subplot(1, 3, 1), imshow(imgM(:,:,1:3))
    subplot(1, 3, 2), imshow(imgP)
    subplot(1, 3, 3), imshow(imgF(:,:,1:3))
    
fprintf('IHS RMSE: %f\n', RMSE(imgM, imgF))

