function [ output_args ] = test_main( A )
%TEST_MAIN Summary of this function goes here
%   Detailed explanation goes here
    hold on;
    axis equal;
    
    for i = 1 : 8
        if i ~= 2
            C = seperate_color( A , i );
            if norm(C) > 0
                disp(i);
                disp(C);
            end
            dealing(C);
        end
    end
end
