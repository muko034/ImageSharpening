clc;
close all;
clear all;

% cd ../examples
addpath ../examples
load image1M.mat;
filenameM=A;
load image1P.mat;
filenameP=B;
% cd ..

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
handles.Pnormed=handles.P/max(max(handles.P));
% plotpan(handles);
% guidata(hObject,handles);

%-----------------------------
% addpath IHS
% cd IHS
fihs = FIHS(handles.M, handles.P);
handles.F=FIHS(handles.M, handles.P);
handles.Fnormed=FIHS(handles.Mnormed, handles.Pnormed);
% cd ..

handles.Fnormed=handles.Fnormed-min(min(min(handles.Fnormed)));
handles.Fnormed=handles.Fnormed/max(max(max(handles.Fnormed)));

imshow(handles.Fnormed);
