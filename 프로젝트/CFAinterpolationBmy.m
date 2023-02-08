function [imgB]=CFAinterpolationBmy(cfa)


[row,col]=size(cfa);
cfa=double(cfa);
imgB=zeros(row,col);
% RG -> even line
% GB -> odd line
% 내 알고리즘
for r=2:2:row-2
    for c=2:2:col-2
        imgB(r,c)=cfa(r,c);
        
        if abs(cfa(r,c)-cfa(r+2,c+2))>abs(cfa(r,c+2)-cfa(r+2,c))
             imgB(r+1,c+1)=(cfa(r,c+2)+cfa(r+2,c))/2;
         elseif abs(cfa(r,c)-cfa(r+2,c+2))<abs(cfa(r,c+2)-cfa(r+2,c))
              imgB(r+1,c+1)=(cfa(r,c)+cfa(r+2,c+2))/2;
         else
              imgB(r+1,c+1)=(cfa(r,c)+cfa(r+2,c+2)+cfa(r,c+2)+cfa(r+2,c))/4;
        end
    end
end
        
for r=3:2:row-3
    for c=3:2:col-3
        if abs(imgB(r,c)-imgB(r,c+2))>abs(imgB(r-1,c+1)-imgB(r+1,c+1))
             imgB(r,c+1)=(imgB(r-1,c+1)+imgB(r+1,c+1))/2;
         elseif abs(imgB(r,c)-imgB(r,c+2))<abs(imgB(r-1,c+1)-imgB(r+1,c+1))
              imgB(r,c+1)=(imgB(r,c)+imgB(r,c+2))/2;
         else
              imgB(r,c+1)=(imgB(r,c)+imgB(r,c+2)+imgB(r-1,c+1)+imgB(r+1,c+1))/4;
        end
        
        if abs(imgB(r,c)-imgB(r+2,c))>abs(imgB(r+1,c+1)-imgB(r+1,c-1))
             imgB(r+1,c)=(imgB(r+1,c+1)+imgB(r+1,c-1))/2;
         elseif abs(imgB(r,c)-imgB(r+2,c))<abs(imgB(r+1,c+1)-imgB(r+1,c-1))
              imgB(r+1,c)=(imgB(r,c)+imgB(r+2,c))/2;
         else
              imgB(r+1,c)=(imgB(r,c)+imgB(r+2,c)+imgB(r+1,c+1)+imgB(r+1,c-1))/4;
        end
    end
end 

imgB=uint8(imgB);
end
