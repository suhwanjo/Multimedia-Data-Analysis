function [imgR]=CFAinterpolationRmy(cfa)

[row,col]=size(cfa);
cfa=double(cfa);
imgR=zeros(row,col);
% RG -> even line
% GB -> odd line
% 내 알고리즘
% B위치의 R보간
for r=1:2:row-2
    for c=1:2:col-2
        imgR(r,c)=cfa(r,c);
        
        if abs(cfa(r,c)-cfa(r+2,c+2))>abs(cfa(r,c+2)-cfa(r+2,c))
             imgR(r+1,c+1)=(cfa(r,c+2)+cfa(r+2,c))/2;
         elseif abs(cfa(r,c)-cfa(r+2,c+2))<abs(cfa(r,c+2)-cfa(r+2,c))
              imgR(r+1,c+1)=(cfa(r,c)+cfa(r+2,c+2))/2;
         else
              imgR(r+1,c+1)=(cfa(r,c)+cfa(r+2,c+2)+cfa(r,c+2)+cfa(r+2,c))/4;
        end
    end
end
for r=2:2:row-2
    for c=2:2:col-2
        if abs(imgR(r,c)-imgR(r,c+2))>abs(imgR(r-1,c+1)-imgR(r+1,c+1))
             imgR(r,c+1)=(imgR(r-1,c+1)+imgR(r+1,c+1))/2;
         elseif abs(imgR(r,c)-imgR(r,c+2))<abs(imgR(r-1,c+1)-imgR(r+1,c+1))
              imgR(r,c+1)=(imgR(r,c)+imgR(r,c+2))/2;
         else
              imgR(r,c+1)=(imgR(r,c)+imgR(r,c+2)+imgR(r-1,c+1)+imgR(r+1,c+1))/4;
        end
        
        if abs(imgR(r,c)-imgR(r+2,c))>abs(imgR(r+1,c+1)-imgR(r+1,c-1))
             imgR(r+1,c)=(imgR(r+1,c+1)+imgR(r+1,c-1))/2;
         elseif abs(imgR(r,c)-imgR(r+2,c))<abs(imgR(r+1,c+1)-imgR(r+1,c-1))
              imgR(r+1,c)=(imgR(r,c)+imgR(r+2,c))/2;
         else
              imgR(r+1,c)=(imgR(r,c)+imgR(r+2,c)+imgR(r+1,c+1)+imgR(r+1,c-1))/4;
        end
    end
end

imgR=uint8(imgR);
end

