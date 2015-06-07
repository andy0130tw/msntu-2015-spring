function [ A , G ] = group( A , S , G , run , dir)
%   GROUP Summary of this function goes here
%   Detailed explanation goes here
% A     inputs  pictures matrix 
% S     inputs  the start of successive dot and finish
% G     inputs  group matrix
% run   inputs  number of how much recursive used
% Msize inputs  column number of matrix M
% dir   inputs  up 1  or down 2

    [ ma , na ] = size(A);
    [ ms , ns ] = size(S);
    [ mg , ng ] = size(G);
    if run == 0 & dir == 1
        G = [ S(1,1) ; S(2,1)];
        if S(1,1) - 1 >= 1 & S(2,1) +1 <= na
            if A(S(1,1) , S(2,1) + 1) ~= 0 | A(S(1,1) - 1 , S(2,1) + 1) ~= 0
                if A(S(1,1) , S(2,1) + 1) ~= 0
                    [ A , M , x ] = judge_col( A , S(2,1) + 1 , [ S(1,1) ; S(2,1) + 1 ] , 1 ) ;
                else
                    [ A , M , x ] = judge_col( A , S(2,1) + 1 , [ S(1,1) - 1 ; S(2,1) + 1 ] , 1 ) ;
                end
                
                G = [ G , M ] ;
                run = run + 1 ;
                [ A , G ] = group ( A , M , G , run , dir);
            end
        end
    elseif run == 0 & dir == 2
        G = [ S(1,1) ; S(2,1)];
            if S(1,1) + 1 <= ma & S(2,1) +1 <= na
                if A(S(1,1) , S(2,1) + 1) ~= 0 | A(S(1,1) + 1 , S(2,1) + 1) ~= 0
                    if A(S(1,1) , S(2,1) + 1) ~= 0
                        [ A , M , x ] = judge_col( A , S(2,1) + 1 , [ S(1,1) ; S(2,1) + 1 ] , 2) ;
                    else
                        [ A , M , x ] = judge_col( A , S(2,1) + 1 , [ S(1,1) + 1 ; S(2,1) + 1 ] , 2) ;
                    end
                    
                    G = [ G , M ] ;
                    run = run + 1 ;
                    [ A , G ]  = group ( A , M , G , run , dir);
                end
            end
    elseif run ~= 0 & dir == 1 & G(1,ng) - 1 >= 1 & G(2,ng) +1 <= na
        if A(G(1,ng) , G(2,ng) + 1) ~= 0 |  A(G(1,ng) - 1 , G(2,ng) + 1) ~= 0 
            if A(G(1,ng) , G(2,ng) + 1) ~= 0
                [ A , M , x ] = judge_col( A , G(2,ng) + 1 , [ G(1,ng) ; G(2,ng) + 1 ] , 1) ;
            else
                [ A , M , x ] = judge_col( A , G(2,ng) + 1 , [ G(1,ng) - 1 ; G(2,ng) + 1 ] , 1) ;
            end
            
            G = [ G , M ] ;
            run = run + 1 ;
            [ A , G ] = group ( A , M , G , run , dir);
        else
            if A(G(1,ng) + 1 , G(2,ng)) ~= 0 |  A(G(1,ng) + 1 , G(2,ng) + 1) ~= 0 
                if A(G(1,ng) + 1 , G(2,ng)) ~= 0
                    [ A , M , x ] = judge_col( A , G(2,ng) , [ G(1,ng) + 1 ; G(2,ng) ] , 2) ;
                else
                    [ A , M , x ] = judge_col( A , G(2,ng) + 1 , [ G(1,ng) + 1 ; G(2,ng) + 1 ] , 2) ;
                end
            
                G = [ G , M ] ;
                run = run + 1 ;
                [ A , G ] = group ( A , M , G , run , dir);
            end
        end
    elseif run ~=0 & dir == 2 & G(1,ng) + 1 <= ma & G(2,ng) +1 <= na
        if A(G(1,ng) , G(2,ng) + 1) ~= 0 |  A(G(1,ng) + 1 , G(2,ng) + 1) ~= 0 
            if A(G(1,ng) , G(2,ng) + 1) ~= 0
                [ A , M , x ] = judge_col( A , G(2,ng) + 1 , [ G(1,ng) ; G(2,ng) + 1 ] , 2) ;
            else
                [ A , M , x ] = judge_col( A , G(2,ng) + 1 , [ G(1,ng) + 1 ; G(2,ng) + 1 ] , 2) ;
            end
            
            G = [ G , M ] ;
            run = run + 1 ;
            [ A , G ] = group ( A , M , G , run , dir);
        else
            if A(G(1,ng) - 1 , G(2,ng)) ~= 0 |  A(G(1,ng) - 1 , G(2,ng) + 1) ~= 0 
                if A(G(1,ng) - 1 , G(2,ng)) ~= 0
                    [ A , M , x ] = judge_col( A , G(2,ng) , [ G(1,ng) - 1 ; G(2,ng) ] , 1) ;
                else
                    [ A , M , x ] = judge_col( A , G(2,ng) + 1 , [ G(1,ng) - 1 ; G(2,ng) + 1 ] , 1) ;
                end
            
                G = [ G , M ] ;
                run = run + 1 ;
                [ A , G ] = group ( A , M , G , run , dir);
            end
        end
    end
end