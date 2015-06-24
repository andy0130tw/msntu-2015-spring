function [ I , idx , Dots , num ] = dealing_plot( rA , S , G1 , G2 , I , idx , Dots , num )
%   DEALING_PLOT Svummary of this function goes here
%   Detailed explanation goes here
    [ ms , ns ] = size(S);
    [ ~ , n_g1 ] = size(G1);
    [ ~ , n_g2 ] = size(G2);
    
    color = 1;
    
    if ns == 1
        if rA( S(1,1) , S(2,1) ) ~= 0.25
            if n_g1 > 2
                if num == 1
                    Dots = G1;
                    I = [idx]; 
                    plotfitting_Bezier( G1 , color );
                    idx = idx + n_g1;
                    display_dots( G1 , num , n_g1 );
                    num = num + 1;
                else
                    Dots = [ Dots , G1 ];
                    I = [I , idx]; 
                    plotfitting_Bezier( G1 , color );
                    idx = idx + n_g1;
                    display_dots( G1 , num , n_g1 );
                    num = num + 1;
                end
            end
%             disp(G1)
        end
        
        
        if rA( S(1,1) , S(2,1) ) ~= 0.75
            if n_g2 > 2
                if num == 1
                    Dots = G2;
                    I = [idx];
                    plotfitting_Bezier( G2 , color );
                    idx = idx + n_g2;
                    display_dots( G2 , num , n_g2 );                 
                    num = num + 1;
                else
                    Dots = [ Dots , G2 ];
                    I = [ I , idx ];
                    plotfitting_Bezier( G2 , color );
                    idx = idx + n_g2;
                    display_dots( G2 , num , n_g2 );
                    num = num + 1;
                end
            end
%             disp(G2)
        end
    else
        if n_g1 > 2
            if num == 1
                Dots = G1;
                I = [idx]; 
                plotfitting_Bezier( G1 , color );
                idx = idx + n_g1;
                display_dots( G1 , num , n_g1 );   
                num = num + 1;
            else
                Dots = [ Dots , G1 ];
                I = [I , idx]; 
                plotfitting_Bezier( G1 , color );
                display_dots( G1 , num , n_g1 );
                idx = idx + n_g1;
                num = num + 1;
            end
%             disp(G1)
        end
            
        if n_g2 > 2
            if num == 1
                Dots = G2;
                I = [idx];
                plotfitting_Bezier( G2 ,  color );
                idx = idx + n_g2;
                display_dots( G2 , num , n_g2 );
                num = num + 1;
            else
                Dots = [ Dots , G2 ];
                I = [ I , idx ];
                plotfitting_Bezier( G2 , color );
                idx = idx + n_g2;
                display_dots( G2 , num , n_g2 );
                num = num + 1;
            end
        end
%         disp(G2)
    end
end