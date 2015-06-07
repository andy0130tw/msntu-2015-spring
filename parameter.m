function [ X,Y ] = parameter( G )
%   PARAMETER Summary of this function goes here
%   Detailed explanation goes here
    [ ~ , n ] = size(G);
    T = sym(['t']);
    S = (1-T);
    T = S^(n-1);
    for i = 1 : n-1
        T = [ T ; nchoosek(n-1,i) * S^(n-1-i) * (1-S)^i];
    end    
    X = G(1,:) * T;
    Y = G(2,:) * T;

end

