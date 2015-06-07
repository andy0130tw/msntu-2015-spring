function [ A ] = read_colorfile( x )
%   READFILE Summary of this function goes here
%   Detailed explanation goes here

    ori=imread(x);
    % determine the type of the incoming picture
    % convert to grayscale

    B = rgb2hsl(ori);

    % ¯x°}­ËÂà
    [ m , n ] = size(B);
    A = zeros(m,n);

    for i = 1 : m
        for j = 1 : n 
            A(i,j) = B(m+1-i,j);
        end
    end
end