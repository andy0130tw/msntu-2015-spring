function [ C ] = seperate_color( A , k )
%   SEPERATE_COLOR Summary of this function goes here
%   Detailed explanation goes here

    [ m , n ] = size(A);
    C = zeros(m,n);
    
    for i = 1 : m
        for j = 1 : n
            if A(i,j) == k
                C(i,j) = 1 ;
            end
        end
    end
    
    T = C;
    for i = 2 : m-1
        for j = 2 : n-1
            if T(i,j) == 1
                if T(i-1,j-1) == 0 | T(i-1,j) == 0 | T(i-1,j+1) == 0 | T(i,j-1) == 0
                    continue;
                elseif T(i,j+1) == 0 | T(i+1,j-1) == 0 | T(i+1,j) == 0 | T(i+1,j+1) == 0
                    continue;
                else
                    C(i,j) = 0;
                end
            end
        end
    end
end