% image loading
fhead='lena';
fext='png';
filename=sprintf('%s.%s',fhead,fext);
img=imread(filename);
filename=sprintf('%s_cfa.%s',fhead,fext);
cfa=imread(filename);
figure(1);
imshow(cfa);
[row,col]=size(cfa);

% Split cfa into each spectrum
[cfaR,cfaG,cfaB]=CFAsplit(cfa);
figure(2);
imshow([cfaR,cfaG,cfaB]);


% Linear image interpolation for R/G/B componants
% 
% % BI 알고리즘
% imgG=CFAinterpolationG(cfaG);
% 
% imgR=CFAinterpolationR(cfaR);
% 
% imgB=CFAinterpolationB(cfaB);

% 에지 방향 알고리즘
% imgG=CFAinterpolationGmy(cfaG);
% 
% imgR=CFAinterpolationRmy(cfaR);
% 
% imgB=CFAinterpolationBmy(cfaB);


% ECI 알고리즘
% imgG=CFAinterpolationGECI(cfaG,cfaR,cfaB);
% 
% imgR=CFAinterpolationRECI(cfaR,imgG);
% 
%  imgB=CFAinterpolationBECI(cfaB,imgG);


figure(3);
 imshow([imgR,imgG,imgB]);
filename=sprintf('%s_li.%s',fhead,fext);
 imwrite([imgR,imgG,imgB],filename);

% Comparison
imgRe=img;
imgRe(:,:,1)=imgR;
imgRe(:,:,2)=imgG;
imgRe(:,:,3)=imgB;



figure(4);
imshow([img,imgRe]);
filename=sprintf('%s_imgRe3.%s',fhead,fext);
imwrite(imgRe,filename);
filename=sprintf('%s_imgRe1.%s',fhead,fext);
imwrite([img,imgRe],filename);

% PSNR of SSIM
cutsize=[3,3];
imgRe=CutBoundary(imgRe,cutsize); % 508x508
img=CutBoundary(img,cutsize);
pval=psnr(imgRe,img,255);
sval=ssim(imgRe,img); % 외곽 영향 별로 안받음
txt=sprintf('PSNR = %4.2fdB, SSIM = %4.3f',pval,sval);
disp(txt);


