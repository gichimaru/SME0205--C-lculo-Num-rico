%% Primeira parte do Trabalho: Manipulacao do Grafo e da maior componente conexa
format long; 

xy = load('manh.xy');
el = load('manh.el');

nv = size(xy,1); % numero de vertices do grafo completo
na = size(el,1); % numero de arestas do grafo completo

Ad = matriz_adjacencia(nv,na,el); % criando a matriz adjacencia do grafo acima

imprimir_grafo(Ad); % Para imprimir o grafo completo

% Achando a maior componente conexa do grafo, onde:
% nc: numero de componentes conexas;
% nvc: numero de vertices por cada componente;
% vc: vertices por componentes conexas.
[nc, nvc, vc] = Split_Edges(nv,Ad);

maiorcomp = vc(1,:); % maior componente conexa
n = nvc(1,1); % numero de vertices da maior componente conexa
ad = Ad(maiorcomp,maiorcomp); % matriz adjacencia da maior componente

imprimir_grafo(ad); % Para imprimir a maior componente conexa

%% Segunda parte do Trabalho: Construcao das matrizes penalidades e Laplaciana
% Passo 1 e 3 do Trabalho:

[P,b1] = matriz_penalidade(n);

% Passo 2 do trabalho: Construir a matriz Lapalaciana do grafo de ruas
% L = D-A eh a matriz desejada,sendo:
% D: a matriz de graus da maior componente;
% A: a matriz de adjacencia da maior componente.

Dg = matriz_grau(n,ad); % matriz de graus

L = Dg-ad; % Logo, temos a matriz laplaciana do problema

%% Terceira parte do trabalho: Comparar o tempo de diferentes metodos de solucao
% Por fim, vamos resolver o sistema:
% (L+P)*x = P*b

A = L+P;
b = P*b1; % termo independente
x0 = zeros(n,1); % vetor solucao 'chute'

% Metodo da barra do MATLAB
tic;
x = A\b;
t = toc

%
% Metodo da Decomposicao LU
tic;
[L,U] = lu(A);
yLU = sub_progressiva(L,b); % aqui vamos usar o metodo 'cru' e abaixo, 
                            % vamos substituir as funcoes sub_prog. e sub_regre. pelo metodo da barra
                            % para analisar a diferença
xLU = sub_regressiva(U,yLU); % Soluçao do Metodo LU
tLU = toc

% Metodo da decomposicao LU com o auxilio da barra '\' do MATLAB
tic;
[l,u] = lu(A);
ylu = L\b;
xlu = U\ylu;
tlu = toc

%
% Metodo de Cholesky
tic;
H = chol(A);
yChol = sub_progressiva(H',b);
xChol = sub_regressiva(H,yChol); % Soluçao do Metodo
tChol = toc

% Metodo da decomposicao Cholesky com o auxilio da barra '\' do MATLAB
tic;
h = chol(A);
ychol = h'\b;
xchol = h\ychol;
tchol = toc

%
% Metodo de Jacobi
tic;
[xJac,kJac] = gauss_jacobi(A,b,x0,1e-4);
tJac = toc

%
% Metodo de Gaus-Seidel
tic;
[xSei,kSei] = gauss_seidel(A,b,x0,1e-4);
tSei = toc

%
% Metodo dos Gradientes Conjugados
tic;
[xGrad,kGrad] = gradc(A,b,x0,1e-14,10000);
tGrad = toc

%% Imprimindo um grafo
function imprimir_grafo(A)
G = graph(A,'upper');
plot(G);
end