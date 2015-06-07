function [ I , idx , Dots , num ] = dealing_plot( rA , S , G1 , G2 , I , idx , Dots , num )
%   DEALING_PLOT Summary of this function goes here
%   Detailed explanation goes here
    [ ms , ns ] = size(S);
    [ ~ , n_g1 ] = size(G1);
    [ ~ , n_g2 ] = size(G2);

    if ns == 1
        if rA( S(1,1) , S(2,1) ) ~= 0.25
            if n_g1 > 2
                if num == 1
                    Dots = G1;
                    I = [idx]; 
                    plotfitting_Bezier(G1);
                    idx = idx + n_g1;
                    
                    listctrl = findobj('tag', 'listbox1');
                    set(listctrl, 'string', [
                        get(listctrl, 'string'); [
                        'Function #',
                        num,
                        ': (' ,G1(1,1) , ',' , G1(2,1) , ') ... (',
                        Dots(1,n_g1), ',' , Dots(2,n_g1) ,') #' , n_g1
                        ]]);
                    
                    num = num + 1;
                else
                    Dots = [ Dots , G1 ];
                    I = [I , idx]; 
                    plotfitting_Bezier(G1);
                    idx = idx + n_g1;
                    
                    listctrl = findobj('tag', 'listbox1');
                    set(listctrl, 'string', [
                        get(listctrl, 'string'); [
                        'Function #',
                        num,
                        ': (' ,G1(1,1) , ',' , G1(2,1) , ') ... (',
                        Dots(1,n_g1), ',' , Dots(2,n_g1) ,') #' , n_g1
                        ]]);
                    
                    num = num + 1;
                end
            end
        end
        
        if rA( S(1,1) , S(2,1) ) ~= 0.75
            if n_g2 > 2
                if num == 1
                    Dots = G2;
                    I = [idx];
                    plotfitting_Bezier(G2);
                    idx = idx + n_g2;
                    
                    listctrl = findobj('tag', 'listbox1');
                    set(listctrl, 'string', [
                        get(listctrl, 'string'); [
                        'Function #',
                        num,
                        ': (' ,G2(1,1) , ',' , G2(2,1) , ') ... (',
                        Dots(1,n_g2), ',' , Dots(2,n_g2) ,') #' , n_g2
                        ]]);
                    
                    num = num + 1;
                else
                    Dots = [ Dots , G2 ];
                    I = [ I , idx ];
                    plotfitting_Bezier(G2);
                    idx = idx + n_g2;
                    
                    listctrl = findobj('tag', 'listbox1');
                    set(listctrl, 'string', [
                        get(listctrl, 'string'); [
                        'Function #',
                        num,
                        ': (' ,G2(1,1) , ',' , G2(2,1) , ') ... (',
                        Dots(1,n_g2), ',' , Dots(2,n_g2) ,') #' , n_g2
                        ]]);
                    
                    num = num + 1;
                end
            end
        end
    else
        if n_g1 > 2
            if num == 1
                Dots = G1;
                I = [idx]; 
                plotfitting_Bezier(G1);
                idx = idx + n_g1;
                
                listctrl = findobj('tag', 'listbox1');
                set(listctrl, 'string', [
                    get(listctrl, 'string'); [
                    'Function #',
                    num,
                    ': (' ,G1(1,1) , ',' , G1(2,1) , ') ... (',
                    Dots(1,n_g1), ',' , Dots(2,n_g1) ,') #' , n_g1
                    ]]);
                
                num = num + 1;
            else
                Dots = [ Dots , G1 ];
                I = [I , idx]; 
                plotfitting_Bezier(G1);
                
                listctrl = findobj('tag', 'listbox1');
                set(listctrl, 'string', [
                    get(listctrl, 'string'); [
                    'Function #',
                    num,
                    ': (' ,G1(1,1) , ',' , G1(2,1) , ') ... (',
                    Dots(1,n_g1), ',' , Dots(2,n_g1) ,') #' , n_g1
                    ]]);
                
                idx = idx + n_g1;
                num = num + 1;
            end
        end
            
        if n_g2 > 2
            if nuum == 1
                Dots = G2;
                I = [idx];
                plotfitting_Bezier(G2);
                idx = idx + n_g2;
                
                listctrl = findobj('tag', 'listbox1');
                set(listctrl, 'string', [
                    get(listctrl, 'string'); [
                    'Function #',
                    num,
                    ': (' ,G2(1,1) , ',' , G2(2,1) , ') ... (',
                    Dots(1,n_g2), ',' , Dots(2,n_g2) ,') #' , n_g2
                    ]]);
                
                num = num + 1;
            else
                Dots = [ Dots , G2 ];
                I = [ I , idx ];
                plotfitting_Bezier(G2);
                idx = idx + n_g2;
                
                listctrl = findobj('tag', 'listbox1');
                set(listctrl, 'string', [
                    get(listctrl, 'string'); [
                    'Function #',
                    num,
                    ': (' ,G2(1,1) , ',' , G2(2,1) , ') ... (',
                    Dots(1,n_g2), ',' , Dots(2,n_g2) ,') #' , n_g2
                    ]]);
                
                num = num + 1;
            end
        end
    end
end