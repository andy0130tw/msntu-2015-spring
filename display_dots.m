function [ output_args ] = display_dots( G , num , n )
%   DISPLAY_FUNCTION Summary of this function goes here
%   Detailed explanation goes here
    
    listctrl = findobj('tag', 'listbox1');
    if num < 10
        if num == 1
           set(listctrl, 'string', [' ']);       
           set(listctrl, 'string', [{[
                'Function #0', num2str(num), ': (' , num2str(G(1,1)) , ',' , num2str(G(2,1)) , ') ... (', num2str(G(1,n)), ',' , num2str(G(2,n)) ,') #' , num2str(n)
                ]}
           ]);
        else        
           set(listctrl, 'string', [get(listctrl, 'string'); {[
               'Function #0', num2str(num), ': (' , num2str(G(1,1)) , ',' , num2str(G(2,1)) , ') ... (', num2str(G(1,n)), ',' , num2str(G(2,n)) ,') #' , num2str(n)
                ]}
           ]);
        end
    else
        set(listctrl, 'string', [get(listctrl, 'string'); {[
            'Function #', num2str(num), ': (' , num2str(G(1,1)) , ',' , num2str(G(2,1)) , ') ... (', num2str(G(1,n)), ',' , num2str(G(2,n)) ,') #' , num2str(n)
           ]}
        ]);
    end
end