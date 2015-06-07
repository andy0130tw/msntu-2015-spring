function [ A , G1 , G2 ] = dealing_group( A , rA , S )
%   DEALING_GROUP Summary of this function goes here
%   Detailed explanation goes here

    run = 0 ;
    [ ms , ns ] = size(S);
    G1 = [0;0];
    G2 = [0;0];

    if ns == 1
        switch rA( S(1,1) , S(2,1) )
            % entry 0 means the first time use to plot the figure
            % entry is 1 originally, become zero when it first search it
            case 1
                dir = 1 ;
                [ A , G1 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                    
                dir = 2 ;
                [ A , G2 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                
            % entry 0.75 means second time use to plot the figure
            % direction goes up this time
            case 0.75
                dir = 1 ;
                [ A , G1 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                
            % entry 0.25 means second time use to plot the figure
            % direction goes down this time
            case 0.25
                dir = 2 ;
                [ A , G2 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                
        end
    else
        switch rA( S(1,1) , S(2,1) )
            case 1 
                dir = 1 ;
                [ A , G1 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                
            case 0.75
                dir = 1 ;
                [ A , G1 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                
            case 0.25
                dir = 2 ;
                [ A , G1 ] = group( A , [S(1,1) ; S(2,1)] , [ 0 ; 0 ] , run , dir);
                
        end
        disp(A)
            
        switch rA( S(1,2) , S(2,2) )
            case 1
                dir = 2 ;
                [ A , G2 ] = group( A , [S(1,2) ; S(2,2)] , [ 0 ; 0 ] , run , dir);
                
            case 0.75
                dir = 1 ;
                [ A , G2 ] = group( A , [S(1,2) ; S(2,2)] , [ 0 ; 0 ] , run , dir);
                
            case 0.25
                dir = 2 ;
                [ A , G2 ] = group( A , [S(1,2) ; S(2,2)] , [ 0 ; 0 ] , run , dir);
        end
        disp(A)
    end

    if ns ~= 1
        [ ~ , n_g1 ] =size(G1);
        [ ~ , n_g2 ] =size(G2);
        
        if n_g1 > 1 & n_g2 > 1
            G1 = [ [ (S(1,1) + S(1,2))/2 ; S(2,2) ] , G1 ];
            G2 = [ [ (S(1,1) + S(1,2))/2 ; S(2,1) ] , G2 ];
        elseif n_g1 > 1 & n_g2 == 1
            switch rA( S(1,1) , S(2,1) )
                case 1
                    G1 = [ [ S(1,2) ; S(2,2) ] , G1 ];
                case 0.75
                    G1 = [ [ S(1,2) ; S(2,2) ] , G1 ];
                case 0.25
                    G1(1,1) = S(1,2);
                    G1(2,1) = S(2,2);
                    G1 = [ [ S(1,1) ; S(2,1) ] , G1 ];
            end
        elseif n_g1 == 1 & n_g2 > 1
            switch rA( S(1,2) , S(2,2) )
                case 1
                    G2 = [ [ S(1,1) ; S(2,1) ] , G2 ];
                case 0.75
                    G2(1,1) = S(1,1);
                    G2(2,1) = S(2,1);
                    G2 = [ [ S(1,2) ; S(2,2) ] , G1 ];
                case 0.25
                    G2 = [ [ S(1,1) ; S(2,1) ] , G2 ];
            end
        end
    end
end