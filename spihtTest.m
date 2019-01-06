fprintf('-----------   Welcome to SPIHT Matlab Demo!   ----------------\n');

fprintf('-----------   Load Image   ----------------\n');
infilename = 'out.bmp';
outfilename = 'joker.bmp';

Orig_I = double(imread(infilename));

rate = 1;

OrigSize = size(Orig_I, 1);
max_bits = floor(rate * OrigSize^2);
OutSize = OrigSize;
image_spiht = zeros(size(Orig_I));
[nRow, nColumn] = size(Orig_I);

fprintf('done!\n');
fprintf('-----------   Wavelet Decomposition   ----------------\n');
n = size(Orig_I,1);
n_log = log2(n); 
level = n_log;
% wavelet decomposition level can be defined by users manually.

type = 'haar';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(type);

[I_W, S] = func_DWT(Orig_I, level, Lo_D, Hi_D);

fprintf('done!\n');
fprintf('-----------   Encoding   ----------------\n');
img_enc = func_SPIHT_Enc(I_W, max_bits, nRow*nColumn, level);
fprintf('done!\n');
[x y]=size(img_enc);
df=max_bits - y;
for i=1:df
    img_enc=[img_enc 0];
end
coverImg = imread('jokerrs.bmp');
stegoImg= imresize(coverImg,[2*nx,2*nx]);
coverImg=imresize(coverImg,[2*nx,2*nx]);
img_enc1=reshape(img_enc,[nx,ny])';

stegoImg(1,[1,2,3])= img_enc1(1,[1,2,3]);
for j=4:nx
    stegoImg(1,j)=floor(double(stegoImg(1,j))/4)*4+img_enc1(1,j);
end
for i=2:ny
    for j=1:nx
        stegoImg(i,j)=floor(double(stegoImg(i,j))/4)*4+img_enc1(i,j);
    end
end
fprintf('done!');
%-----------------------------------------------------------------------
img_enc3=zeros([nx,ny]);
img_enc3(1,1)=nx;
img_enc3(1,[2,3])=stegoImg(1,[2,3]);
n_max=stegoImg(1,2);
%level=stegoImg(1,3);
for j=4:nx
    img_enc3(1,j)=mod(stegoImg(1,j),2)+mod(floor(double(stegoImg(1,j))/2),2)*2;
end
for i=2:ny
    for j=1:nx
        img_enc3(i,j)=mod(stegoImg(i,j),2)+mod(floor(double(stegoImg(i,j))/2),2)*2;
    end
end
img_enc2=reshape(img_enc3',1,nx*ny);
S1 = [nx ny nx*ny];
x=nx;
y=ny;
for i=1:level
    x=x/2;
    y=y/2;
    S1=[x y x*y;S1];
end
S1=[x y x*y;S1];

% fprintf('-----------   Decoding   ----------------\n');
% img_dec = func_SPIHT_Dec(img_enc);
% fprintf('done!\n');
% fprintf('-----------   Wavelet Reconstruction   ----------------\n');
% img_spiht = func_InvDWT(img_dec, S, Lo_R, Hi_R, level);
% 
% fprintf('done!\n');
% fprintf('-----------   PSNR analysis   ----------------\n');
% 
% imwrite(img_spiht, gray(256), outfilename, 'bmp');
% 
% Q = 255;
% MSE = sum(sum((img_spiht-Orig_I).^2))/nRow / nColumn;
% fprintf('The psnr performance is %.2f dB\n', 10*log10(Q*Q/MSE));