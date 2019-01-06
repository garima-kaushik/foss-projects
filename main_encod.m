    function [share]=main_encod(inImg,cvrImg,n,load,pgrbar,tot,comp)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%---------------------------- Loading Image -------------10%--------------
fprintf('---------------------------- Loading Image ---------------------------\n');
set(load,'string','Loading Image');
% infilename = inImg; %-----------------<<<<<<<<<<<<<<<<<<<----
nos=n;
coverImg = cvrImg;%-----------------------------<<<<<<<<<<<<<<<<<<<---Cover Image----------------
Orig_I = double(inImg);
[x,y,z]=size(Orig_I);
fprintf('done!\n');


%-------------------------------- Resizing -----------------10%>>>20%--------
fprintf('-------------------------------- Resizing ----------------------------\n');
per=comp+(.1*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Resizing'));
uiProgressBar(pgrbar,per);
pause(.5)
if x<y
    sc=x;
else
    sc=y;
end
nlog=log2(sc);
if isinteger(nlog)
    nx=sc;
    ny=sc;
else
    nlog=floor(nlog);
    nx=2.^nlog;
    ny=nx;
end
Orig_I=imresize(Orig_I,[nx ny]);
fprintf('done!\n');
%---------------------------- Setting Image Data --------------5%>>>>25$--------
per=comp+(.2*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Setting Image Data'));
uiProgressBar(pgrbar,per);
pause(.5)
fprintf('---------------------------- Setting Image Data ----------------------\n');
rate = 1;

OrigSize = size(Orig_I, 1);
max_bits = floor(rate * OrigSize^2);
OutSize = OrigSize;
image_spiht = zeros(size(Orig_I));
[nRow, nColumn] = size(Orig_I);
fprintf('done!\n');
%----------------------------- SPIHT Encoding ---------------30%-----------
fprintf('----------------------------- SPIHT Encoding --------------------------\n');
%10>>35%
per=comp+(.25*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Wavelet Decomposition'));
uiProgressBar(pgrbar,per);
pause(.5)
fprintf('----   Wavelet Decomposition ----\n');
n = size(Orig_I,1);
n_log = log2(n); 
level = n_log;
% wavelet decomposition level can be defined by users manually.

type = 'haar';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(type);

[I_W, S] = func_DWT(Orig_I, level, Lo_D, Hi_D);

fprintf('done!\n');
%20%>>>55%
fprintf('------ Encoding  ------\n');
per=comp+(.35*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Encoding'));
uiProgressBar(pgrbar,per);
pause(.5)
img_enc = func_SPIHT_Enc(I_W, max_bits, nRow*nColumn, level);
df=max_bits - size(img_enc,2);
for i=1:df
   img_enc=[img_enc 0];
end    
fprintf('done!\n');

%----------------------------- LSB Method -----------------------25%>>80%
per=comp+(.55*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....LSB method'));
uiProgressBar(pgrbar,per);
pause(.5)
fprintf('----------------------------- LSB Method --------------------------\n');
stegoImg= imresize(coverImg,[2*nx,2*ny]);
img_enc2=reshape(img_enc,[nx,ny])';
stegoImg(1,[1,2,3])=img_enc2(1,[1,2,3]);

for j=4:nx
    stegoImg(1,j)=floor(double(stegoImg(1,j))/4)*4+img_enc2(1,j);
end
for i=2:ny
    for j=1:nx
        stegoImg(i,j)=floor(double(stegoImg(i,j))/4)*4+img_enc2(i,j);
    end
end

imwrite(stegoImg,'stegoImg.bmp');
fprintf('done!');
%------------------------------ VC encoding -------------------20%---->>>100%----
per=comp+(.8*tot)
set(load,'string',strcat(num2str(floor(per*100)),'%....VC Encoding'));
uiProgressBar(pgrbar,per);
pause(.5)
fprintf('------------------------------ VC encoding ---------------------------\n');
share = VCEncod(stegoImg,nos);
% share1=imread(share{1});
% share2=imread(share{2});
% figure;
%     subplot(121);imshow(share1);
%     subplot(122);imshow(share2);
fprintf('Image Encoded!\n');
end

