function imgOut = imnorm(img)
imgOut = double(img);
for i=1:size(imgOut,3)
    imgOut(:,:,i) = imgOut(:,:,i)-min(min(imgOut(:,:,i)));
    imgOut(:,:,i) = imgOut(:,:,i)/max(max(imgOut(:,:,i)));
end