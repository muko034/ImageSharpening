addpath examples
for i=1:31
    img = imread(strcat(num2str(i),'.png'));
    img=imresize(img,0.25);
    img=imresize(img,4);
    A(:,:,i)= img(:,:);
end

B=imread('RGB.bmp');
B=rgb2gray(B);