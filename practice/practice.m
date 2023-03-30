% image loading
fhead='lena';
fext='png';
filename=sprintf('%s.%s',fhead,fext);
img=imread(filename);
pnginf=imfinfo(filename);
filesize=pnginf.FileSize;
[row,col,dep]=size(img);
% imgR=img(:,:,1);
% imgG=img(:,:,2);
% imgB=img(:,:,3);
figure(1);
imshow(img);

pitch=[2,2];
phpit=[0,0];

imgD=SamplingDown(img,pitch,phpit);

% up sampling
imgU=SamplingUp(img,pitch,phpit);


% Draw a horizontal line on the image
color=[0,255,0]; % red
stpos=[100,200];
linelen=150;

img(stpos(1),stpos(2):stpos(2)+linelen-1,1)=color(1); % R-plane
img(stpos(1),stpos(2):stpos(2)+linelen-1,2)=color(2);
img(stpos(1),stpos(2):stpos(2)+linelen-1,3)=color(3);

% Vertical line

img(stpos(1):stpos(1)+linelen-1,stpos(2),1)=color(1); % R-plane
img(stpos(1):stpos(1)+linelen-1,stpos(2),2)=color(2);
img(stpos(1):stpos(1)+linelen-1,stpos(2),3)=color(3);













