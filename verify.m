function [ rshare,gshare,bshare,valid,colorFlag ] = verify( sharepath,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

valid=0;
colorFlag=0;
rshare=-1;
gshare=-1;
bshare=-1;
tempshare=imread(sharepath{1});
[x,y,z]=size(tempshare);
for i=2:n
    a=imread(sharepath{i});
    [s,t,u]=size(a);
    if eq([x,y,z],[s,t,u])
        [x,y,z]=size(a);
    else
        return;
    end
end

for i=1:n
   tempshare=imread(sharepath{i});
   [x,y,z]=size(tempshare);
   if tempshare(x,y,1)~=n 
       return;
   end
end
rshare=uint8(zeros([x,y,n]));
valid=1;
if z==3
    colorFlag=1;
    gshare=uint8(zeros([x,y,n]));
    bshare=uint8(zeros([x,y,n]));
end
for i=1:n
    tempshare=imread(sharepath{i});
    if colorFlag
        rshare(:,:,i)=tempshare(:,:,1);
        gshare(:,:,i)=tempshare(:,:,2);
        bshare(:,:,i)=tempshare(:,:,3);
    else
        rshare(:,:,i)=tempshare;    
    end

end

