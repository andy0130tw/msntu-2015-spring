function [ Ap ] = approx_matrix( G , dir )
%APPROX_FUNC Summary of this function goes here
%   Detailed explanation goes here
    [mg , ng ] = size(G);
    Ap = [ G(2,1); G(1,1) ];
    k = 0;
    if ng >= 2
        if G(2,1) == G(2,2)
            n = abs( G(1,1) - G(1,2) ) + 1 ;
            Ap = [G(2,2) ; (G(1,1) + G(1,2))/2 ]; 
            for i = 3:ng
                if i+1 <= ng && G(2,i) == G(2,i+1) && i ~= k + 1
                    Ap = [ Ap , [G(2,i) ; (G(1,i) + G(1,i+1))/2] ];
                    k = i ;
                elseif i == k + 1
                    continue ;
                elseif i+1 <= ng && G(2,i) ~= G(2,i+1)
                    Ap = [ Ap , [ G(2,i) ; G(1,i)] ];
                else 
                    Ap = [ Ap , [ G(2,i) ; G(1,i)] ];
                end
            end
        else
            for i = 2:ng
                if i+1 <= ng && G(2,i) == G(2,i+1) && i ~= k + 1
                    Ap = [ Ap , [G(2,i) ; (G(1,i) + G(1,i+1))/2] ];
                    k = i;
                elseif i == k + 1 
                    continue ;
                elseif i+1 <= ng && G(2,i) ~= G(2,i+1)
                    Ap = [ Ap , [G(2,i) ; G(1,i)] ];
                else
                    Ap = [ Ap , [G(2,i) ; G(1,i)] ];
                end
            end
        end
    end
end
