function [ B ] = rgb2hsl( A )
%   RGB2HSL Summary of this function goes here
%   Detailed explanation goes here
%   black:1 white:2 red:3 yellow:4 green:5 cyan:6 blue:7 pink:8
    A = double(A);
    A = A / 255;
    [ m , n , k ] = size(A);
    B = ones(m,n);
    for i = 1 : m
        for j = 1 : n
            largest = max(A(i,j,:));
            smallest = min(A(i,j,:));
            l = 0.5*(largest+smallest);
            if l == 0 | largest == smallest
                s = 0;
            elseif l <= 0.5
                s = (largest-smallest)/(largest+smallest);
            else 
                s = (largest-smallest)/(2-largest-smallest);
            end
            
            if s == 0
                if l > 0.5
                    B(i,j) = 2;
                end   
            elseif l > 0.9
                B(i,j) = 2;
            elseif l > 0.1
                if A(i,j,1) == largest
                    if A(i,j,2) >= A(i,j,3)
                        h = 60*(A(i,j,2)-A(i,j,3))/(largest-smallest);
                    else
                        h = 60*(A(i,j,2)-A(i,j,3))/(largest-smallest) + 360;
                    end
                elseif A(i,j,2) == largest
                    h = 60*(A(i,j,3)-A(i,j,1))/(largest-smallest) + 120;
                else
                    h = 60*(A(i,j,1)-A(i,j,2))/(largest-smallest) + 240;
                end
            
                if h < 30
                    B(i,j) = 3;
                elseif h < 90
                    B(i,j) = 4;
                elseif h < 150
                    B(i,j) = 5;
                elseif h < 210
                    B(i,j) = 6;    
                elseif h < 270
                    B(i,j) = 7;
                elseif h < 330
                    B(i,j) = 8;
                else
                    B(i,j) = 3;
                end
            end    
        end
    end
end