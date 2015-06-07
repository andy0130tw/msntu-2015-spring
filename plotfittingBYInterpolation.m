function [  ] = plotfittingBYInterpolation( S )
%   PLOTFITTINGBYINTERPOLATION Summary of this function goes here
%   Detailed explanation goes here
   [~,n] = size(S);
   if n <= 2
       return;
   end
   t = linspace(0,1 ,100);
   for i = 1:100
       G=S;
       for j = n:-1:2
           for k = 1:j-1
               G(:,k) = (1-t(i))*G(:,k)+t(i)*G(:,k+1);             
           end
       end 
       X(i) = G(1,1);
       Y(i) = G(2,1);
   end
   
   global axesctrl
   plot(axesctrl, Y,X,'color','red');

%    parameter generation
%    Xi = S(1, :) * parameter(n);
%    Yi = S(2, :) * parameter(n);
%   
%    listctrl = findobj('tag', 'listbox1');
%    set(listctrl, 'string', [get(listctrl, 'string'); ['X: ', char(Xi)]; ['Y: ', char(Yi)]; '------']);
   
   drawnow;
end


function [ T ] = parameter( n )
%   PA Summary of this function goes here
%   Detailed explanation goes here
    T = sym(['t']);
    S = (1-T);
    T = S^(n-1);
    for i = 1:n-1
        T = [T ;nchoosek(n-1,i)*S^(n-1-i)*(1-S)^i];
    end    
end
