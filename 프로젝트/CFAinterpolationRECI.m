function [imgR]=CFAinterpolationRECI(cfa,imgG)


[row,col]=size(cfa);
cfa=double(cfa);
imgG=double(imgG);
imgR=zeros(row,col);
for r=3:2:row-3
    for c=3:2:col-3
        %R위치 보간
        imgR(r+1,c+1)=imgG(r+1,c+1)-(imgG(r,c+1)-(cfa(r,c)+cfa(r,c+2))/2+imgG(r+1,c)-(cfa(r,c)+cfa(r+2,c))/2+imgG(r+1,c+2)-(cfa(r,c+2)+cfa(r+2,c+2))/2+imgG(r+2,c+1)-(cfa(r+2,c)+cfa(r+2,c+2))/2)/4;
        imgR(r,c)=cfa(r,c);
    end
end
for r=3:2:row-3
    for c=3:2:col-3
        imgR(r,c+1)=imgG(r,c+1)-(imgG(r-1,c+1)-imgR(r-1,c+1)+imgG(r+1,c+1)-imgR(r+1,c+1))/2;
        imgR(r+1,c)=imgG(r+1,c)-(imgG(r+1,c-1)-imgR(r+1,c-1)+imgG(r+1,c+1)-imgR(r+1,c+1))/2;
    end
end
 imgR=CutBoundary(imgR,[2,2]);
 imgR=padarray(imgR,[2,2],'symmetric');
imgR=uint8(imgR);
end