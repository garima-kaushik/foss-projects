function [ img_spiht ]=main_decod(share,load,pgrbar,tot,comp)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%------------------------------ VC  Decoding ----------20%--->>20--------------
per=comp+(.0*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....VC Docoding'));
uiProgressBar(pgrbar,per);
pause(.5)
fprintf('------------------------------ VC Decoding ---------------------------\n');
stegoImg=VCDecod(share);
fprintf('done!\n');
%----------------------------- Extract LSB ---------------30%--->>>50----------
per=comp+(.2*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Extracting LSB'));
uiProgressBar(pgrbar,per);
pause(.5)
fprintf('-------------------------------Extract LSB ---------------------------\n');
%stegoImg=imread('stegoImg.bmp');
[nx,ny] = size(stegoImg);
nx=nx/2;
ny=ny/2;
img_enc2=zeros([nx,ny]);
img_enc=zeros([1,nx*ny]);
img_enc2(1,1)=nx;
img_enc2(1,[2,3])=stegoImg(1,[2,3]);
n_max=stegoImg(1,2);
level=stegoImg(1,3);
for j=4:nx
    img_enc2(1,j)=mod(stegoImg(1,j),2)+mod(floor(double(stegoImg(1,j))/2),2)*2;
end
for i=2:ny
    for j=1:nx
        img_enc2(i,j)=mod(stegoImg(i,j),2)+mod(floor(double(stegoImg(i,j))/2),2)*2;
    end
end
img_enc=reshape(img_enc2',1,nx*ny);
fprintf('done!\n');

%----------------------------- SPIHT Decoding ---------------50%-----------
per=comp+(.5*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Decoding'));
uiProgressBar(pgrbar,per);
pause(.5)
S = [nx ny nx*ny];
x=nx;
y=ny;
for i=1:level
    x=x/2;
    y=y/2;
    S=[x y x*y;S];
end
S=[x y x*y;S];
fprintf('----------------------------- SPIHT Decoding --------------------------\n');

%-----------   Decoding   ----------30%------
fprintf('-----------   Decoding   ----------------\n');
img_dec = func_SPIHT_Dec(img_enc);
fprintf('done!\n');
fprintf('-----------   Wavelet Reconstruction   ----------------\n');
per=comp+(.8*tot);
set(load,'string',strcat(num2str(floor(per*100)),'%....Wavelet Reconstruction'));
uiProgressBar(pgrbar,per);
pause(.5)
%20
type = 'haar';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(type);
img_spiht = func_InvDWT(img_dec, S, Lo_R, Hi_R, level);
out=uint8(img_spiht);
fprintf('done!\n');
%------------------------------------Decoded Image---------------------------
fprintf('Image Decoded!!!\n');
end

