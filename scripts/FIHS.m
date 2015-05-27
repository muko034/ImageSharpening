function [FRGB]=FIHS(RGB, P)
RGB=double(RGB);
P=double(P);
I=RGB(:,:,1)*1/3+RGB(:,:,2)*1/3+RGB(:,:,3)*1/3;

%hist matching
%P=P*std(std(I))/std(std(P));
%P=P-(mean(mean(P))-mean(mean(I)));
P=(P-mean(P(:)))*std(I(:))/std(P(:)) + mean(I(:));

for n=1:3
    FRGB(:,:,n)=RGB(:,:,n)+P-I;
end
%m= min(min(min(FRGB)));
%if m<0
%    FRGB=FRGB-m;
%end    
%FRGB=FRGB/max(max(max(FRGB(:,:,1:3))));