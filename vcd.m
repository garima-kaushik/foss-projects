function [ out ] = vcd( share )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
share1=imread(share{1});
share2=imread(share{2});
out=bitxor(share1,share2);
end

