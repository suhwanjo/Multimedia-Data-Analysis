% image loading
fhead='lena';
fext='png';
filename=sprintf('%s.%s',fhead,fext);
img=imread(filename);

pnginf=imfinfo(filename);
filesize=pnginf.FileSize;
[row,col,dep]=size(img);

% R-plane sampling
% R 0 R 0
% 0 0 0 0
pitch=[2,2];
phpit=[0,0]; % pitch의 phase정보
imgD1=SamplingDown(img(:,:,1),pitch,phpit);
figure(1);
imshow(imgD1);
filename=sprintf('%s_imgR.%s',fhead,fext);
imwrite(imgD1,filename);
cfaR=SamplingUp(imgD1,pitch,phpit);


% B-plane sampling
% 0 0 0 0
% 0 B 0 B
pitch=[2,2];
phpit=[1,1]; % pitch의 phase정보
imgD2=SamplingDown(img(:,:,3),pitch,phpit);
figure(2);
imshow(imgD2);
filename=sprintf('%s_imgG.%s',fhead,fext);
imwrite(imgD2,filename);
cfaB=SamplingUp(imgD2,pitch,phpit);


% G1-plane sampling
% 0 G 0 G
% 0 0 0 0
pitch=[2,2];
phpit=[0,1]; % pitch의 phase정보
imgD3=SamplingDown(img(:,:,2),pitch,phpit);
figure(3);
imshow(imgD3);
filename=sprintf('%s_imgB.%s',fhead,fext);
imwrite(imgD3,filename);
cfaG1=SamplingUp(imgD3,pitch,phpit);
% G2-plane sampling
% 0 0 0 0
% G 0 G 0
pitch=[2,2];
phpit=[1,0]; % pitch의 phase정보
imgD4=SamplingDown(img(:,:,2),pitch,phpit);
cfaG2=SamplingUp(imgD4,pitch,phpit);
cfaG=cfaG1+cfaG2;

cfa=cfaR+cfaG+cfaB; % single lens에서 받아오는 이미지
filename=sprintf('%s_cfa.%s',fhead,fext);
imwrite(cfa,filename);

figure(4);
imshow([cfaR,cfaG,cfaB]);
filename=sprintf('%s_Ds.%s',fhead,fext);
imwrite([imgD1,imgD2,imgD3],filename);
figure(5);
imshow(cfa);


