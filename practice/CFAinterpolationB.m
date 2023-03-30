function [imgB]=CFAinterpolationB(cfa)


[row,col]=size(cfa);
cfa=double(cfa);
imgB=zeros(row,col);

for r=2:2:row-2
    for c=2:2:col-2
        imgB(r,c)=cfa(r,c);
        imgB(r,c+1)=(cfa(r,c)+cfa(r,c+2))/2;
        imgB(r+1,c)=(cfa(r,c)+cfa(r+2,c))/2;
        imgB(r+1,c+1)=(cfa(r,c)+cfa(r,c+2)+cfa(r+2,c)+cfa(r+2,c+2))/4;
    end
end
imgB=uint8(imgB);
end