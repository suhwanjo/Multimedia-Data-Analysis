function [imgR]=CFAinterpolationR(cfa)


[row,col]=size(cfa);
cfa=double(cfa);
imgR=zeros(row,col);

for r=1:2:row-2
    for c=1:2:col-2
        imgR(r,c)=cfa(r,c);
        imgR(r,c+1)=(cfa(r,c)+cfa(r,c+2))/2;
        imgR(r+1,c)=(cfa(r,c)+cfa(r+2,c))/2;
        imgR(r+1,c+1)=(cfa(r,c)+cfa(r,c+2)+cfa(r+2,c)+cfa(r+2,c+2))/4;
    end
end
imgR=uint8(imgR);
end
