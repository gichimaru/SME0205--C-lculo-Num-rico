function [P,b] = matriz_penalidade(n)
P = zeros(n); % matriz das penalidades
b = zeros(n,1);

for i=1:80
    r1 = randperm(n,1) +1; % escolhendo um vertice aleatorio / +1 pelo vertice 0
    r2 = randperm(10,1); % escolhendo um valor aleatorio para esse vertice no intervalo (0,10]
    P(r1,r1) = 1.0e7; % construindo a matriz penalidades
    b(r1,1) = r2; % construindo o vetor solucao
end

end