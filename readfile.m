function [ A, imgmap ] = readfile( x )
%READFILE Summary of this function goes here
%   Detailed explanation goes here

[ori, map]=imread(x);
% determine the type of the incoming picture
%  convert to grayscale
if size(map)
  ori=ind2rgb(ori, map);
end
gray=rgb2gray(ori);

BW=edge(gray,'canny');
result_logic=BW ;
result_uint8=uint8(result_logic);

[m,n]=size(result_uint8);
A=zeros(m,n);
for i=1:m
	for j=1:n
    	A(i,j)=result_uint8(m+1-i,j);
	end
end

% pass image map
imgmap = map;

end