function [ I , idx , Dots ] = dealing_plot( rA , S , G1 , G2 , I , idx , Dots )
%   DEALING_PLOT Summary of this function goes here
%   Detailed explanation goes here
    [ ms , ns ] = size(S);
    [ ~ , n_g1 ] = size(G1);
    [ ~ , n_g2 ] = size(G2);

    if ns == 1
        if rA( S(1,1) , S(2,1) ) ~= 0.25
            if n_g1 > 2
                if idx == 1
                    Dots = G1;
                    I = [idx]; 
                    plotfitting_Bezier(G1);
                    idx = idx + n_g1;
                else
                    Dots = [ Dots , G1 ];
                    I = [I , idx]; 
                    plotfitting_Bezier(G1);
                    idx = idx + n_g1;
                end
            end
        end
        
        if rA( S(1,1) , S(2,1) ) ~= 0.75
            if n_g2 > 2
                if idx == 1
                    Dots = G2;
                    I = [idx];
                    plotfitting_Bezier(G2);
                    idx = idx + n_g2;
                else
                    Dots = [ Dots , G2 ];
                    I = [ I , idx ];
                    plotfitting_Bezier(G2);
                    idx = idx + n_g2;
                end
            end
        end
    else
        if n_g1 > 2
            if idx == 1
                Dots = G1;
                I = [idx]; 
                plotfitting_Bezier(G1);
                idx = idx + n_g1;
            else
                Dots = [ Dots , G1 ];
                I = [I , idx]; 
                plotfitting_Bezier(G1);
                idx = idx + n_g1;
            end
        end
            
        if n_g2 > 2
            if idx == 1
                Dots = G2;
                I = [idx];
                plotfitting_Bezier(G2);
                idx = idx + n_g2;
            else
                Dots = [ Dots , G2 ];
                I = [ I , idx ];
                plotfitting_Bezier(G2);
                idx = idx + n_g2;
            end
        end
    end
end

