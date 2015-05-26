clc;
close all;
clear all;

addpath ../examples
load image3M.mat;
filenameM=A;
load image3P.mat;
filenameP=B;

handles.M=filenameM;
handles.P=filenameP;

handles.M=double(handles.M);
handles.Mnormed=handles.M;
[n1,n2,n3]=size(handles.M);
for i=1:n3
    handles.Mnormed(:,:,i)=handles.M(:,:,i)/max(max(handles.M(:,:,i)));
end
% axes(handles.multi_axes);
% plotmulti(handles);
% axes(handles.pan_axes);

handles.P=double(handles.P);
handles.Pnormed=handles.P/max(handles.P(:));
% plotpan(handles);
% guidata(hObject,handles);

% handles.F=FIHS(handles.M, handles.P);
% handles.F=modIHS(handles.M, handles.P);
handles.Fnormed1=FIHS(handles.Mnormed, handles.Pnormed);
handles.Fnormed2=modIHS(handles.Mnormed, handles.Pnormed);

handles.Fnormed1=handles.Fnormed1-min(handles.Fnormed1(:));
handles.Fnormed1=handles.Fnormed1/max(handles.Fnormed1(:));

handles.Fnormed2=handles.Fnormed2-min(handles.Fnormed2(:));
handles.Fnormed2=handles.Fnormed2/max(handles.Fnormed2(:));

figure, imshow(handles.Fnormed1(:,:,1:3));
figure, imshow(handles.Fnormed2(:,:,1:3));
fprintf('Root-mean-square deviation: %d',RMSE(A,handles.Fnormed1(:,:,1:3)))
