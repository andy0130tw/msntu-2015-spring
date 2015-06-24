function [ output_args ] = display_function( G )
%   DISPLAY_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

    [ X , Y ] = parameter( G );
    
    textctrl = findobj('tag', 'listbox2');
    set(textctrl, 'string', [' ']);
    set(textctrl, 'string', [{[
        'X :' , char(X) , 10  , 'Y :' , char(Y)
       ]}
    ]);
end