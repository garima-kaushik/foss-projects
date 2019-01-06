a=imread('joker.jpg');
a=rgb2gray(a);
% %-----------------------------------VCEncoding------------------------------%  
share=vce(b);
share1=imread(share{1});
share2=imread(share{2});
figure;
    subplot(121);imshow(share1);
    subplot(122);imshow(share2);

out=vcd(share);
[x y z]=size(out);

imwrite(out,'out.bmp');
MSE = sum(sum((b-out).^2))/(x*y*z);
PSNR = 10*log10(256*256/MSE);

fprintf('\nMSE: %7.2f ', MSE);
fprintf('\nPSNR: %9.7f dB\n', PSNR);
figure;imshow(out);
