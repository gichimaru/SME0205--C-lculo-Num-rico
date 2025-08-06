# Projetos de Cálculo Numérico (SME0205 - ICMC/USP)

Este repositório contém dois trabalhos desenvolvidos para a disciplina de Cálculo Numérico (SME0205) no Instituto de Ciências Matemáticas e de Computação (ICMC) da Universidade de São Paulo (USP).

**Autores:**
* Anne Kéllen de Nazaré dos Reis Dias
* Luiz Francisco Franca de Farias
* Luis Roberto Piva

---

## Projeto 1: Métodos Diretos vs. Iterativos para Sistemas Lineares

Este projeto, desenvolvido em **MATLAB**, analisa e compara o desempenho de métodos diretos e iterativos na resolução de um sistema linear derivado de um problema real.

### Descrição

O objetivo foi aplicar e avaliar a eficiência, complexidade e tempo de execução de diferentes métodos numéricos. O problema baseia-se na interpolação de dados de temperatura na cidade de Manhattan, NY, modelada como um grafo onde as esquinas são vértices e as ruas são arestas.

A metodologia envolveu:
1.  A construção de um grafo a partir de dados geográficos de Manhattan (8837 vértices e 13713 conexões) e a identificação de sua maior componente conexa.
2.  A criação de um sistema linear **(L + P)x = Pb** utilizando a matriz Laplaciana (L) do grafo e uma matriz de Penalidades (P) para estabilizar a solução.
3.  A resolução do sistema e a comparação dos tempos de execução dos métodos implementados.

### Métodos Implementados

**Métodos Diretos:**
* Decomposição LU
* Decomposição de Cholesky (aproveitando que a matriz do sistema é simétrica e positiva definida)
* Operador de barra (`\`) do MATLAB para comparação

**Métodos Iterativos:**
* Método de Gauss-Jacobi
* Método de Gauss-Seidel
* Método dos Gradientes Conjugados

---

## Projeto 2: Modelagem de Crescimento Populacional com Mínimos Quadrados

Este projeto, desenvolvido em **Python**, aplica o método dos mínimos quadrados (padrão e ponderado) para modelar e prever o crescimento populacional de diferentes países.

### Descrição

O objetivo foi estudar e aplicar o método dos mínimos quadrados para ajustar curvas a dados populacionais e realizar previsões. Foram analisados os dados de **Brasil, Bulgária e China** entre 1961 e 2021, escolhidos por seus distintos comportamentos demográficos (crescimento moderado, declínio e crescimento acelerado, respectivamente).

A metodologia envolveu:
1.  Coleta e leitura de dados populacionais de arquivos `.csv`.
2.  Análise das taxas de crescimento e visualização através de gráficos de dispersão.
3.  Ajuste de curvas utilizando o método dos mínimos quadrados padrão com diferentes modelos polinomiais.
4.  Ajuste de curvas utilizando o método dos mínimos quadrados ponderado, com diferentes funções de peso, para dar mais importância a dados específicos (como os mais recentes).
5.  Previsão da população para os próximos 10 anos (2022-2030) com base nos modelos ajustados.

### Métodos Implementados

* **Mínimos Quadrados Padrão:**
    * Ajuste com polinômios de grau 1 (linear), 2 e 3.
    * A qualidade do ajuste foi medida com o Erro Médio Quadrático (MSE) e o Coeficiente de Determinação (R²).

* **Mínimos Quadrados Ponderados:**
    * Uso de duas funções de peso distintas:
        1.  Pesos baseados nos erros absolutos em relação à média.
        2.  Pesos críticos, atribuindo maior importância aos últimos 10 anos de dados.

## Licença

Estes projetos são trabalhos acadêmicos e estão disponíveis para fins educacionais. Sinta-se à vontade para explorar o código e os conceitos implementados.
