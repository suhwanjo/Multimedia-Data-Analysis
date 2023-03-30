function [imgY]=DrawBox(img,pos,boxsize,color)
%

[row,col,dep]=size(img);
if dep==1
end

for k=1:dep
    value=color(k);
    imgY(:,:,k)=DrawBoxGray(img(:,:,k),pos,boxsize,value);
end
end

function [imgY]=DrawBoxGray(img,pos,boxsize,value)
% 
strow=pos(1);
stcol=pos(2);
enrow=pos(1)+boxsize(1)-1;
encol=pos(2)+boxsize(2)-1;

img(strow,stcol:encol)=value;
img(enrow,stcol:encol)=value;
img(strow:enrow,stcol)=value;
img(strow:encol,encol)=value;


imgY=img;
end

