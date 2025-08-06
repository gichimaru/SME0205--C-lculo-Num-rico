function [A] = matriz_adjacencia(nv,na,el)

A = zeros(nv); % matriz adjacencia

for i=1:na
    x = el(i,1) +1; % +1 porque o zero eh um vertice do grafo tambem
    y = el(i,2) +1;
    A(x,y) = 1;
    A(y,x) = 1;
end

end