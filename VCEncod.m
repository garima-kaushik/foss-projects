function [ share ] = VCEncod( in,n )
%VCEncod is used to org into 'n' images
[x,y,z]=size(in);
share = uint8(zeros(x,y,n));
lastShare=uint8(zeros(x,y));
for i=1:n-1
    tempShare=uint8(255*rand(size(in)));
    share(:,:,i)=tempShare;
    lastShare=bitxor(lastShare,tempShare);
end
% size(share)
% size(lastShare)
% size(in)
tempShare=bitxor(lastShare,in);
share(:,:,n)=tempShare;
share(x,y,:)=n;
% sharestr = cell(n, 1);
% for i=1:n
%     sharestr{i} = strcat(shareName,num2str(i));
%     sharestr{i} = strcat(sharestr{i},'.bmp');
%     imwrite(share(:,:,i),sharestr{i},'bmp');
% end
end

