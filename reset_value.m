function [ A ] = reset_value( A , dir , j , i , edge )
%   RESET_VALUE Summary of this function goes here
%   Detailed explanation goes here
    [ ma , na ] = size(A);
    judge_leftnum = judge_left( A , i , j , edge );
    
    switch dir
        case -1
               
        case 1
            if j+1 <= ma & j ~= 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j-1 , i ) ~= 0
                    A ( j , i ) = 0.25;
                elseif A( j , i+1 ) ~= 0 & A( j-1 , i ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                elseif A ( j+1 , i+1 ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                elseif A( j+1 , i ) ~= 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.25;
                end
            elseif j == 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                elseif A ( j+1 , i+1 ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                else
                    A ( j , i ) = 0.25;
                end
            elseif j == 1 & i == na
%                 A ( j , i ) = 0;
                
                if judge_leftnum == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 1;
                end
                
            elseif j == ma & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j-1 , i ) ~= 0
                    A ( j , i ) = 0.25;
                elseif A( j , i+1 ) ~= 0 & A( j-1 , i ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                else
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                end
            elseif j ~= 1 & j+1 <= ma & i == na
                if A( j+1 , i ) == 0
                    A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                else
                    A ( j , i ) = 0.25;
                end
            elseif j == ma & i == na
                A ( j , i ) = 0;
                
                if judge_leftnum == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 1;
                end
                
            end
            
        case 2
            if j+1 <= ma & j ~= 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 & A( j+1 , i ) ~= 0
                    A ( j , i ) = 0.75;
                elseif A( j , i+1 ) ~= 0 & A( j+1 , i ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                elseif A ( j-1 , i+1 ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                elseif A( j-1 , i ) ~= 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 0.75;
                end
            elseif j == 1 & i+1 <= na
                if A( j , i+1 ) ~= 0 
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end                    
                else
                    A ( j , i ) = 0.75;
                end
            elseif j == 1 & i == na
%                 A ( j , i ) = 0;
                
                if judge_leftnum == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 1;
                end
                
            elseif j == ma & i+1 <= na
                if A( j , i+1 ) ~= 0 
                    A ( j , i ) = 0.75;
%                 elseif A( j , i+1 ) ~= 0 
%                     A ( j , i ) = 0;
                    
%                     if judge_leftnum == 0
%                         A ( j , i ) = 0;
%                     else
%                         A ( j , i ) = 1;
%                     end
                    
                else
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                end
            elseif j ~= 1 & j+1 <= ma & i == na
                if A( j-1 , i ) == 0
%                     A ( j , i ) = 0;
                    
                    if judge_leftnum == 0
                        A ( j , i ) = 0;
                    else
                        A ( j , i ) = 1;
                    end
                    
                else
                    A ( j , i ) = 0.75;
                end
            elseif j == ma & i == na
%                 A ( j , i ) = 0;
                
                if judge_leftnum == 0
                    A ( j , i ) = 0;
                else
                    A ( j , i ) = 1;
                end
                
            end
        end
end



function [ judge_leftnum ] = judge_left( A , i , j , edge )
%   JUDGE_LEFT Summary of this function goes here
%   Detailed explanation goes here

    [ ma , na ] = size(A);
    
    if i == 1
        judge_leftnum = 0;
    elseif i ~= 1 & edge == 0
        if j ~= 1 & j ~= ma
            if A( j-1 , i-1 ) == 0 & A( j ,i-1 ) == 0 & A( j+1 , i-1 ) == 0
                judge_leftnum = 0;
            else
                judge_leftnum = 1;
            end
        elseif j == 1 
            if  A( j ,i-1 ) == 0 & A( j+1 , i-1 ) == 0
                judge_leftnum = 0;
            else
                judge_leftnum = 1;
            end
        else j == ma
            if A( j-1 , i-1 ) == 0 & A( j ,i-1 ) == 0
                judge_leftnum = 0;
            else
                judge_leftnum = 1;
            end
        end
    else
        judge_leftnum = 0;        
    end
end
 