function [F]=modIHS(M,P)
lamda = 10^-9;
eps = 10^-10;
M=double(M);
P=double(P);

%norm all bands be in range 0 to 1.
for i=1:size(M,3)
    bandCoeffs(i)=max(max(M(:,:,i)));
    M(:,:,i)=M(:,:,i)/bandCoeffs(i);
end
%norm pan to be in range 0 to 1
panCoeff=max(max(P));
P=P/panCoeff;


alpha=findalph(M,P);
[n,m,s]=size(M);

E = expEdge(P,lamda,eps);

I=(alpha(1)*M(:,:,1)+alpha(2)*M(:,:,2)+alpha(3)*M(:,:,3)+alpha(4)*M(:,:,4));
P=(P-mean(P(:)))*std(I(:))/std(P(:)) + mean(I(:));

for i=1:s
    F(:,:,i)=M(:,:,i)+E.*(P-I);
end



%restore data to original data range
for i=1:size(F, 3)
    F(:,:,i)=F(:,:,i)*bandCoeffs(i);
end


%m= min(min(min(F)));
%if m<0
%    F=F-m;
%end    
%F=F/max(max(max(F)));
