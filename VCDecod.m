function [ out ] = VCDecod( share )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[x y n]=size(share);
out=uint8(zeros(x,y));
for i=1:n
    out=bitxor(out,share(:,:,i));
end
end

