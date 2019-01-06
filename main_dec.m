function main_dec
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%------------------------------ VC  Decoding ---------------------------
fprintf('------------------------------ VC Decoding ---------------------------\n');
N=2;
share = cell(N, 1);
for i=1:N
   share{i} = strcat('Share',num2str(i));
   share{i} = strcat(share{i},'.bmp');
end
stegoImg=vcd(share);
fprintf('done!\n');
%----------------------------- Extract LSB ----------------------------
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

%----------------------------- SPIHT Decoding --------------------------
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
%-----------   Decoding   ----------------
fprintf('-----------   Decoding   ----------------\n');
img_dec = func_SPIHT_Dec(img_enc);
fprintf('done!\n');
fprintf('-----------   Wavelet Reconstruction   ----------------\n');
type = 'haar';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(type);
img_spiht = func_InvDWT(img_dec, S, Lo_R, Hi_R, level);
fprintf('done!\n');
%------------------------------------Decoded Image---------------------------
imwrite(img_spiht, gray(256), 'res.bmp', 'bmp');
fprintf('Image Decoded!!!\n');
end

