function [cfaR,cfaG,cfaB]=CFAsplit(cfa);
%
% cfa RGGB pattern

[row,col]=size(cfa);
cfaR=uint8(zeros(row,col));
cfaG=cfaR;
cfaB=cfaR;

% RG -> even line
% GB -> odd line
for r=1:2:row
    for c=1:2:col
        cfaR(r,c)=cfa(r,c);
        cfaG(r,c+1)=cfa(r,c+1);
        cfaG(r+1,c)=cfa(r+1,c);
        cfaB(r+1,c+1)=cfa(r+1,c+1);
    end
end
end
