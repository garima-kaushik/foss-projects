a=imread('joker.jpg');
a=rgb2gray(a);
[x,y,z]=size(a);

%--------------------------------------Resizing--------------------------------%

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
b=imresize(a,[nx ny]);
imwrite(b,'jokerrs.bmp');
%----------------------------------Hafltoning-----------------------------%
% b=zeros(size(a(:,:,1)));
% b=a(:,:,1);
% %if z~=1
%     for n=1:z
%     
%        b(:,:,n)=floydHalftone(a(:,:,n));
% 
%     end  
% %end
% %imwrite(b,'maxb.bmp')
% 
% b=uint8(255*b);
% 
% %-----------------------------------VCEncoding------------------------------%  
share=vce(b);
share1=imread(share{1});
share2=imread(share{2});
figure;
    subplot(121);imshow(share1);
    subplot(122);imshow(share2);
%-------------------------------SPIHTEncod----------------------------------------------------%

%-------------------------------SPIHTDecod---------------------------------------------------%
%---------------------------------VCDecoding--------------------------------------------------%
out=vcd(share);
[x y z]=size(out);
%-----------------------------------Output---------------------------------------------%
imwrite(out,'out.bmp');
MSE = sum(sum((b-out).^2))/(x*y*z);
PSNR = 10*log10(256*256/MSE);

fprintf('\nMSE: %7.2f ', MSE);
fprintf('\nPSNR: %9.7f dB\n', PSNR);
figure;imshow(out);