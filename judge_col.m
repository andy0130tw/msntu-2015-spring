function [ A , S , judge_num ] = judge_col( A , i , dot , dir )
%   JUDGE Summary of this function goes here
%   three type of judge column
%   type one
%       find the successive non-zero entries start from the first
%       entry of the column
%       reset the entry into zero
%   type two : used in group function
%       find the successive non-zero entries start from the dot and
%       direction is up
%       reset the entry into 0.25
%   type three : used in group function
%       find the successive non-zero entries start from the dot and
%       direction is down
%       reset the entry into 0.75

%   Detailed explanation goes here
%   A           inputs  picture matrix
%   i           inputs  the i-th column
%   dot         inputs  start postition to find successive non-zero entry
%                       [-1;-1] means find successive non-zero entry from
%                       the begining
%   dir         inputs  0 implies no need direction
%                       1 implies direction is up
%                       2 implies direction is down
%   ma          local   # A's row
%   na          local   # A's column
%   judge_num   local   0 implies that column all zeros 
%                       1 implies that column has non-zero entry
%   flag        local   record the successive non-zero entry
%   check       local   check whether the number of successive non-zero
%                       entry is more than one

    [ ma , na ] = size( A );
    judge_num = 0;
    
    % type one
    % find successive non-zero entries from the begining
    % reset the entry into zero when we search it the first time
    if dir == 0
        flag = 0 ;
        i = dot(2,1);
        for j = dot(1,1) : ma ;
            if flag == 0 
                if A ( j , i ) ~= 0
                    judge_num = 1;
                    S = [ j ; i ];
                    A ( j , i ) = 0 ;
                    flag = j ;
                    check = j;
                end
            end
        
            if j == 1 && flag == 0 
                continue
            end
        
            if flag == j - 1 
                if A ( j , i ) ~= 0
                    if j == ma 
                        S = [ S , [ ma ; i ] ] ;
                        A ( j , i ) = 0 ;
                    else
                        A ( j , i ) = 0 ;
                        flag = j ;
                    end
                elseif flag ~= check  
                    S = [ S , [ flag ; i ] ] ;
                    break
                else
                    break
                end
            end
        end
        
        if judge_num == 0
            S = [ 0 ; 0 ];
        end       
    end
    
    % type two
    % direction is up start from the dot
    % find the successive non-zero entry in the same column of dot
    % reset the entry into 0.25 when we search it the first time 
    if dir == 1
        flag = 0 ;
        i = dot(2,1);
        for j = dot(1,1) : -1 : 1
            if flag == 0 
                if A ( j , i ) ~= 0
                    judge_num = 1;
                    S = [ j ; i ];
                    edge = 1;
                    A = reset_value( A , dir , j , i , edge);
                    flag = j ;
                    check = j;
                end
            end
        
            if flag == j + 1 
                edge = 0;
                if A ( j , i ) ~= 0
                    if j == 1 
                        S = [ S , [ 1 ; i ] ];
                        A = reset_value( A , dir , j , i ,edge );                      
                    else
                        flag = j;
                        A = reset_value( A , dir , j , i ,edge );
                    end
                elseif flag ~= check  
                    S = [ S , [ flag ; i ] ];
                    A = reset_value( A , dir , flag , i ,edge );
                    break
                else
                    break
                end
            end
        end
    end

    % type three
    % direction is down start from the dot
    % find the successive non-zero entry in the same column of dot
    % reset the entry into 0.75 when we search it the first time
    if dir == 2
        flag = 0 ;
        i = dot(2,1);
        for j = dot(1,1) : ma
            if flag == 0 
                if A ( j , i ) ~= 0
                    judge_num = 1;
                    S = [ j ; i ];
                    edge = 1;
                    A = reset_value( A , dir , j , i , edge );
                    flag = j ;
                    check = j;
                end
            end
        
            if flag == j - 1 
                edge = 0;
                if A ( j , i ) ~= 0
                    if j == ma 
                        S = [ S , [ j ; i ] ];
                        A = reset_value( A , dir , j , i ,edge );
                        else
                        flag = j ;
                        A = reset_value( A , dir , j , i ,edge );
                    end
                elseif flag ~= check  
                    S = [ S , [ flag ; i ] ] ;
                    A = reset_value( A , dir , flag , i ,edge );
                    break
                else
                    break
                end
            end
        end
    end
end