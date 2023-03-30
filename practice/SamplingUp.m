function [imgU]=SamplingUp(img,pitch,phpit)
% [imgU]=SamplingUp(img,pitch,phpit)
% pitch=[2,2]; phpit=[0,0];

% image up sampling
[row,col,dep]=size(img);
imgU=uint8(zeros(row*pitch(1),col*pitch(2),dep));
imgU(phpit(1)+1:pitch(1):end,phpit(2)+1:pitch(2):end,:)=img;