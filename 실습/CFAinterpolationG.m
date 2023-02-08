function [imgG]=CFAinterpolationG(cfa)


[row,col]=size(cfa);
cfa=double(cfa);
imgG=zeros(row,col);

for r=2:2:row-2
    for c=2:2:col-2
        imgG(r,c)=(cfa(r-1,c)+cfa(r,c-1)+cfa(r,c+1)+cfa(r+1,c))/4;
        imgG(r,c+1)=cfa(r,c+1);
        imgG(r+1,c)=cfa(r+1,c);
        imgG(r+1,c+1)=(cfa(r,c+1)+cfa(r+1,c)+cfa(r+1,c+2)+cfa(r+2,c+1))/4;
    end
end
imgG=uint8(imgG);
end

