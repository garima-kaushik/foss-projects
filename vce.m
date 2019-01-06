function [ share ] = vce( org )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
in=org;
y=uint8(255*rand(size(in)));
share1=y;
share2=bitxor(share1,in);
%figure

N=2;
share = cell(N, 1);
for i=1:N
   share{i} = strcat('share',num2str(i));
   share{i} = strcat(share{i},'.bmp');
end
imwrite(share1,share{1},'bmp');
imwrite(share2,share{2},'bmp');


end

