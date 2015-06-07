function [  ] = plotfitting_Bezier( G )
%   PLOTFITTINGBYINTERPOLATION Summary of this function goes here
%   Detailed explanation goes here
   [ ~ , n ] = size(G);
   t = linspace(0,1 ,100);
   for i = 1:100
       S = G;
       for j = n:-1:2
           for k = 1:j-1
               S(:,k) = (1-t(i)) * S(:,k) + t(i) * S(:,k+1);             
           end
       end 
       X(i) = S(1,1);
       Y(i) = S(2,1);
   end    
   plot( Y , X ,'color','red');
end


