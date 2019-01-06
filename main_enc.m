function main_enc(inImg,coverImg,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%---------------------------- Loading Image ---------------------------
fprintf('---------------------------- Loading Image ---------------------------\n');
infilename = 'out.bmp';%-----------------<<<<<<<<<<<<<<<<<<<----
outfilename = 'out_recons.bmp';
coverImg = imread('jokerrs.bmp');%-----------------------------<<<<<<<<<<<<<<<<<<<---Cover Image----------------
Orig_I = double(imread(infilename));
[x,y,z]=size(Orig_I);
fprintf('done!\n');
%-------------------------------- Resizing ----------------------------
fprintf('-------------------------------- Resizing ----------------------------\n');
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
%---------------------------- Setting Image Data ----------------------
fprintf('---------------------------- Setting Image Data ----------------------\n');
rate = 1;

OrigSize = size(Orig_I, 1);
max_bits = floor(rate * OrigSize^2);
OutSize = OrigSize;
image_spiht = zeros(size(Orig_I));
[nRow, nColumn] = size(Orig_I);
fprintf('done!\n');
%----------------------------- SPIHT Encoding --------------------------
fprintf('----------------------------- SPIHT Encoding --------------------------\n');
fprintf('----   Wavelet Decomposition ----\n');
n = size(Orig_I,1);
n_log = log2(n); 
level = n_log;
% wavelet decomposition level can be defined by users manually.

type = 'haar';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(type);

[I_W, S] = func_DWT(Orig_I, level, Lo_D, Hi_D);

fprintf('done!\n');

fprintf('------ Encoding  ------\n');
img_enc = func_SPIHT_Enc(I_W, max_bits, nRow*nColumn, level);
df=max_bits - size(img_enc,2);
for i=1:df
   img_enc=[img_enc 0];
end    
fprintf('done!\n');

%----------------------------- LSB Method ----------------------------
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
%------------------------------ VC encoding ---------------------------
fprintf('------------------------------ VC encoding ---------------------------\n');
share=vce(stegoImg);
share1=imread(share{1});
share2=imread(share{2});
figure;
    subplot(121);imshow(share1);
    subplot(122);imshow(share2);
fprintf('Image Encoded!\n');
end

