function [ C ] = judge_edge( C )
%   JUDGE_EDGE Summary of this function goes here
%   Detailed explanation goes here
    [ m , n ] = size(C);
    T = C;
    for i = 2 : m-1
        for j = 2 : n-1
            if T(i,j) == 1
                if T(i-1,j-1) == 0
                    continue;
                elseif T(i-1,j) == 0
                    continue;
                elseif T(i-1,j+1) == 0
                    continue;
                elseif T(i,j-1) == 0
                    continue;
                elseif T(i,j+1) == 0
                    continue;
                elseif T(i+1,j-1) == 0
                    continue;
                elseif T(i+1,j) == 0
                    continue;
                elseif T(i+1,j+1) == 0
                    continue;
                else
                    C(i,j) = 0;
                end
            end
        end
    end
end