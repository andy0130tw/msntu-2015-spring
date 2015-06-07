function [ output_args ] = dealing( A )
%   MAIN Summary of this function goes here
%   Detailed explanation goes here
%   A           inputs  picture matrix
%   rA          local   remember A
%   ma          local   # A's row
%   na          local   # A's column
%   flag        local   which column program proceed to
%                       initial number 1
%   S           local   record the start position of the column first
%                       non-zero entry and the end postion of the
%                       successive non-zero entry 
%   judge_num   local   0 implies that column all zeros 
%                       1 implies that column has non-zero entry
%   ms          local   # S's row
%   ns          local   # S's column
%   run         local   initial # assemble iteratedly
%   dir         local   0 implies no need direction
%                       1 implies direction is up
%                       2 implies direction is down
%   G1          local   the group is successive 1 start with start position and 
%                       only direction up 
%   G2          local   the group is successive 1 start with end position and
%                       only direction down
%   X           local   the figure's x-coordinate
%   Y           local   the figure's y-coordinate
%   coeff       local   the function's coefficient

    [ ma , na ] =size( A );
    flag = 1 ;
    
    tic;
    
    global timer
    textctrl = findobj('tag', 'text4');
    
    % when A become a zero matrix , program finished
    while norm(A) > 0
        
        set(textctrl, 'string', round((now - timer) * 24 * 60 * 60 * 1000) / 1000);
        drawnow;
        
        rA = A;
        % start to search non-zero column from flag column
        for i = flag : na ;
            [ A , S , judge_num ] = judge_col ( A , i , [-1 ; -1] , 0);
            if  judge_num == 1
                flag = i ;
                break ;
            end
        end
        
        [ ms , ns ] = size(S);
        
        if norm(S) ~= 0
            disp(S)
        end
        % start to group
        [ A , G1 , G2 ] = dealing_group( A , rA , S );

        disp(A)
        
        hold on;
        axis equal;

        % plot G1's and G2's figure
        if ns == 1
            if rA( S(1,1) , S(2,1) ) ~= 0.25
                plotfittingBYInterpolation(G1);
            end

            if rA( S(1,1) , S(2,1) ) ~= 0.75
                plotfittingBYInterpolation(G2);
            end
        else
            plotfittingBYInterpolation(G1);
            plotfittingBYInterpolation(G2);      
        end
        
    disp(G1)
    disp(G2)    
        
    end
    toc;
end