//Interpolação POLINOMIAL POR SISTEMA LINEAR - Ver. MODULARIZADA

clc(); clear(); clf();
printf("Interpolação POLINOMIAL POR SISTEMA LINEAR - Ver. MODULARIZADA\n");
printf("--------------------------------------------------------\n");
//===================================================
//[0] carregamento das funções modularizadas
//===================================================
//Gauss // Resolução de sistemas lineares por eliminação de Gauss
//vander matrix //Geração da matriz de Vandermonde
//avaliar polinomio //Avaliação de polinômios em um ponto específico
// plotar interpolador //geração do gráfico com pontos e polinômio interpolador
//===================================================
exec("Gauss.sce",-1);
exec("vander_matrix.sce",-1);
exec("avaliar_polinomio.sce",-1);
//===================================================
//[1]ENTRADA DE DADOS
//===================================================
X = [0, 1, 2, 3]; //Pontos de abscissa
Y = [1, 6, 5, -8]; //Pontos de ordenada
n = length(X); //Número de pontos
grau_polinomio = n-1;

printf("Tabela de dados: %d\n", n);
for i = 1:n     
    printf("x = %.6f; f(x) = %.6f\n ", X(i), Y(i));
end

Vander = vander_matrix(X); //Geração da matriz de Vandermonde
printf("Matriz de Vandermonde:\n");
disp(Vander);
//===================================================
//[3]RESOLUÇÃO DO SISTEMA LINEAR
COEF = Gauss(Vander, Y'); //Resolução do sistema linear
printf("Coeficientes do polinômio interpolador:\n");
coef_labels = ['a0','a1','a2','a3', 'a4',  'a5'];
for i = 1:n
    mprintf(" %s = %.6f\n", coef_labels(i), COEF(i));
end
//===================================================
//[4]AVALIAÇÃO DO POLINÔMIO INTERPOLADOR
//  ===================================================
Pol = poly(COEF, 'x','c');
printf("Polinômio interpolador:\n");
disp(Pol);
//===================================================
//[5]AVALIAÇÃO DO POLINOMIO EM PONTO ESPECÍFICO
//=====================================================
ponto = 3.0
valor_real = -8;
[valor_aprox,erro_percentual] = avaliar_polinomio(Pol, ponto, valor_real);
printf("\n [5] VALOR APROXIMADO: p(%.2f) = (%.6f\n)", ponto,valor_aprox);
printf(" [5] ERRO PERCENTUAL: %.2f%%\n", erro_percentual);
//===================================================
//[6]PLOTAGEM DO POLINÔMIO INTERPOLADOR
//===================================================
plotar_interpolador(X, Y, COEF);

//........
printf("\n ******* FIM DA INTERPOLAÇÃO POR SISTEMAS DE EQUAÇÕES *****\n");