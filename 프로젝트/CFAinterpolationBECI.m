function [imgB]=CFAinterpolationBECI(cfa,imgG)


[row,col]=size(cfa);
cfa=double(cfa);
imgG=double(imgG);
imgB=zeros(row,col);
for r=3:2:row-3
    for c=3:2:col-3
        %R위치 보간
        imgB(r,c)=imgG(r,c)-(imgG(r-1,c)-(cfa(r-1,c-1)+cfa(r-1,c+1))/2+imgG(r,c-1)-(cfa(r-1,c-1)+cfa(r+1,c-1))/2+imgG(r,c+1)-(cfa(r-1,c+1)+cfa(r+1,c+1))/2+imgG(r+1,c)-(cfa(r+1,c-1)+cfa(r+1,c+1))/2)/4;
     
        imgB(r+1,c+1)=cfa(r+1,c+1);
    end
end
for r=3:2:row-3
    for c=3:2:col-3
        imgB(r,c+1)=imgG(r,c+1)-(imgG(r,c)-imgB(r,c)+imgG(r,c+2)-imgB(r,c+2))/2;
        imgB(r+1,c)=imgG(r+1,c)-(imgG(r,c)-imgB(r,c)+imgG(r+2,c)-imgB(r+2,c))/2;
    end
end

 imgB=CutBoundary(imgB,[2,2]);
 imgB=padarray(imgB,[2,2],'symmetric');
imgB=uint8(imgB);
end