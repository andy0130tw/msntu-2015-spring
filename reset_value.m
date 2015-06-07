function [ A ] = reset_value( A , dir , j , i )
%   RESET_VALUE Summary of this function goes here
%   Detailed explanation goes here
    [ ma , na ] = size(A);
    
    switch dir
        case 0
               
        case 1
            if j+1 <= ma & j ~= 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j-1 , i ) ~= 0
                    A ( j , i ) = 0.25;
                elseif A( j , i+1 ) ~= 0 & A( j-1 , i ) == 0
                    A ( j , i ) = 0;
                elseif A ( j+1 , i+1 ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.25;
                end
            elseif j == 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 
                    A ( j , i ) = 0;
                elseif A ( j+1 , i+1 ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.25;
                end
            elseif j == 1 & i == na
                A ( j , i ) = 0;
            elseif j == ma & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j-1 , i ) ~= 0
                    A ( j , i ) = 0.25;
                elseif A( j , i+1 ) ~= 0 & A( j-1 , i ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0;
                end
            elseif j ~= 1 & j+1 <= ma & i == na
                if A( j+1 , i ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.25;
                end
            elseif j == ma & i == na
                A ( j , i ) = 0;
            end
            
        case 2
            if j+1 <= ma & j ~= 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j+1 , i ) ~= 0
                    A ( j , i ) = 0.75;
                elseif A( j , i+1 ) ~= 0 & A( j+1 , i ) == 0
                    A ( j , i ) = 0;
                elseif A ( j-1 , i+1 ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.75;
                end
            elseif j == 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 
                    A ( j , i ) = 0;
                elseif A ( j-1 , i+1 ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.75;
                end
            elseif j == 1 & i == na
                A ( j , i ) = 0;
            elseif j == ma & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j+1 , i ) ~= 0
                    A ( j , i ) = 0.75;
                elseif A( j , i+1 ) ~= 0 & A( j+1 , i ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0;
                end
            elseif j ~= 1 & j+1 <= ma & i == na
                if A( j-1 , i ) == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.75;
                end
            elseif j == ma & i == na
                A ( j , i ) = 0;
            end

    end
end