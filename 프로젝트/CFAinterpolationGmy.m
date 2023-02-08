function [imgG]=CFAinterpolationGmy(cfa)


[row,col]=size(cfa);
cfa=double(cfa);
imgG=zeros(row,col);
% RG -> even line
% GB -> odd line
% 내 알고리즘
 for r=2:2:row-2
     for c=2:2:col-2
         if abs(cfa(r,c-1)-cfa(r,c+1))>abs(cfa(r-1,c)-cfa(r+1,c))
             imgG(r,c)=(cfa(r-1,c)+cfa(r+1,c))/2;
         elseif abs(cfa(r,c-1)-cfa(r,c+1))<abs(cfa(r-1,c)-cfa(r+1,c))
              imgG(r,c)=(cfa(r,c-1)+cfa(r,c+1))/2;
         else
              imgG(r,c)=(cfa(r,c-1)+cfa(r,c+1)+cfa(r-1,c)+cfa(r+1,c))/4;
         end
           imgG(r,c+1)=cfa(r,c+1);
           imgG(r+1,c)=cfa(r+1,c);
           if abs(cfa(r+1,c)-cfa(r+1,c+2))>abs(cfa(r,c+1)-cfa(r+2,c+1))
             imgG(r+1,c+1)=(cfa(r,c+1)+cfa(r+2,c+1))/2;
             
           elseif abs(cfa(r+1,c)-cfa(r+1,c+2))<abs(cfa(r,c+1)-cfa(r+2,c+1))
                 imgG(r+1,c+1)=(cfa(r+1,c)+cfa(r+1,c+2))/2;
 
             else
                 imgG(r+1,c+1)=(cfa(r+1,c)+cfa(r+1,c+2)+cfa(r,c+1)+cfa(r+2,c+1))/4;
             end
           
           
 end
 end
imgG=uint8(imgG);
end