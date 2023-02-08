function [imgG]=CFAinterpolationGECI(cfa,cfaR,cfaB)


[row,col]=size(cfa);
cfa=double(cfa);
imgG=zeros(row,col);
cfaR=zeros(row,col);
cfaB=zeros(row,col);
for r=3:2:row-3
    for c=3:2:col-3
        imgG(r,c)=cfaR(r,c)+(cfa(r-1,c)-(cfaR(r,c)+cfaR(r-2,c))/2+cfa(r,c-1)-(cfaR(r,c)+cfaR(r,c-2))/2+cfa(r,c+1)-(cfaR(r,c)+cfaR(r,c+2))/2+cfa(r+1,c)-(cfaR(r,c)+cfaR(r+2,c))/2)/4;
        imgG(r,c+1)=cfa(r,c+1);
        imgG(r+1,c)=cfa(r+1,c);
        imgG(r+1,c+1)=cfaB(r+1,c+1)+(cfa(r,c+1)-(cfaB(r+1,c+1)+cfaB(r-1,c+1))/2+cfa(r+1,c)-(cfaB(r+1,c+1)+cfaB(r+1,c-1))/2+cfa(r+1,c+2)-(cfaB(r+1,c+1)+cfaB(r+1,c+3))/2+cfa(r+2,c+1)-(cfaB(r+1,c+1)+cfaB(r+3,c+1))/2)/4;
    end
end
 imgG=CutBoundary(imgG,[2,2]);
 imgG=padarray(imgG,[2,2],'symmetric');
imgG=uint8(imgG);
end

