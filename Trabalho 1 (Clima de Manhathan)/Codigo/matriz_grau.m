function [Dg] = matriz_grau(n,ad)
Dg = zeros(n);

% calcula o grau de cada vertice
for i=1:n
    for j=1:n
        Dg(i,i) = Dg(i,i) + ad(i,j); 
    end
end

end