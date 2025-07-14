clear(); clc();


//exec("01-progressiva_1a_ordem.sce", -1)
function Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)
    h = abs(X(k+1) - X(k))
    derivada_numerica = (Y(k+1) - Y(k)) / h

    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Progressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k), h)
    printf("   Resultado: %f\n", derivada_numerica)

    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada_2a_exata)
endfunction


//exec("02-regressiva_1a_ordem.sce", -1)
function Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada2a_exata)
    h = abs(X(k) - X(k-1))
    derivada_numerica = (Y(k) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Regressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk) - f(xk-1)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada2a_exata)
endfunction


//exec("03-centrada_2a_ordem_1aderv.sce", -1)
function Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h = h1 + h2
    derivada_numerica = (Y(k+1) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Centrada de 2a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk-1)) / (h1 + h2)\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_C21(h/2, derivada_3a_exata)
endfunction

//exec("04-centrada_2a_ordem_2aderv.sce", -1)
function Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h_prod = h1 * h2
    derivada_numerica = (Y(k+1) - 2*Y(k) + Y(k-1)) / h_prod
    
    printf("\n   Cálculo da derivada de 2a ordem em x = %g pela fórmula Centrada de 2a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - 2*f(xk) + f(xk-1)) / (h1 * h2)\n")
    printf("   Computando: (%f - 2*%f + %f) / %f\n", Y(k+1), Y(k), Y(k-1), h_prod)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_2a_exata, derivada_numerica)
    Erro_Truncamento_C(h_prod, derivada_4a_exata)
endfunction

//exec("05-lagrange_1o_caso.sce", -1)
function Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k) - X(k+1))
    h2 = abs(X(k+1) - X(k+2))
    h = h1 + h2
    derivada_numerica = (-3*Y(k) + 4*Y(k+1) - Y(k+2)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 1o caso:\n", X(k))
    printf("   Aproximação: (-3*f(xk) + 4*f(xk+1) - f(xk+2)) / h\n")
    printf("   Computando: (-3*%f + 4*%f - %f) / %f\n", Y(k), Y(k+1), Y(k+2), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction

//exec("06-lagrange_2o_caso.sce", -1)
function Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h = h1 + h2
    derivada_numerica = (Y(k+1) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 2o caso (centrado):\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk-1)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction

//exec("07-lagrange_3o_caso.sce", -1)
function Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k-2) - X(k-1))
    h2 = abs(X(k-1) - X(k))
    h = h1 + h2
    derivada_numerica = (Y(k-2) - 4*Y(k-1) + 3*Y(k)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 3o caso:\n", X(k))
    printf("   Aproximação: (f(xk-2) - 4*f(xk-1) + 3*f(xk)) / h\n")
    printf("   Computando: (%f - 4*%f + 3*%f) / %f\n", Y(k+2), Y(k-1), Y(k), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction

//exec("08-imprimir_erro.sce", -1)
function Imprimir_Erro(derivada_exata, derivada_numerica)
    erro_percentual = abs((derivada_exata - derivada_numerica) / derivada_exata) * 100
    printf("   Erro relativo percentual: |(%f - %f) / %f| * 100%% = %f%%\n", derivada_exata, derivada_numerica, derivada_exata, erro_percentual)
endfunction

//exec("09-erro_truncamento.sce", -1)
function Erro_Truncamento_P(h, derivada_2a_exata)
    erro_trunc = abs(- (h/2) * derivada_2a_exata)
    printf("   Erro de truncamento (progressiva 1a ordem): |-(h/2) * segundaDerivada| = %.6f\n", erro_trunc)
endfunction

function Erro_Truncamento_R(h, derivada_2a_exata)
    erro_trunc = abs((h/2) * derivada_2a_exata)
    printf("   Erro de truncamento (regressiva 1a ordem): |(h/2) * segundaDerivada| = %.6f\n", erro_trunc)
endfunction

function Erro_Truncamento_C21(h, derivada_3a_exata)
    erro_trunc = abs((h^2 / 6) * derivada_3a_exata)
    printf("   Erro de truncamento (centrada 2a ordem 1a derivada): (h^2/6) * terceiraDerivada| = %.6f\n", erro_trunc)
endfunction

function Erro_Truncamento_C(h, derivada_4a_exata)
    erro_trunc = abs((h / 12) * derivada_4a_exata)
    printf("   Erro de truncamento (centrada 2a ordem 2a derivada): (h/12) * quartaDerivada| = %.6f\n", erro_trunc)
endfunction

function diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4)
    printf("\n***** DIFERENCIAÇÃO NUMÉRICA - MÓDULO COMPLETO *****\n")

    printf("\n>> Progressiva de 1a Ordem:")
    Progressiva_1a_Ordem(X, Y, k, d1, d2)

    printf("\n>> Regressiva de 1a Ordem:")
    Regressiva_1a_Ordem(X, Y, k, d1, d2)

    printf("\n>> Centrada de 2a Ordem (1a derivada):")
    Centrada_2a_Ordem_1a(X, Y, k, d1, d3)

    printf("\n>> Centrada de 2a Ordem (2a derivada):")
    Centrada_2a_Ordem_2a(X, Y, k, d2, d4)

    printf("\n>> Lagrange - 1o Caso:")
    Lagrange_1o_Caso(X, Y, k, d1)

    printf("\n>> Lagrange - 2o Caso:")
    Lagrange_2o_Caso(X, Y, k, d1)

    printf("\n>> Lagrange - 3o Caso:")
    Lagrange_3o_Caso(X, Y, k, d1)

    printf("\n***** FIM DIFERENCIAÇÃO NUMÉRICA *****\n")
endfunction

// ============================================================
// PROBLEMA 1 — Estimativa da taxa de transferência de dados
// em cache de processador
//
// Durante testes de benchmark, foram medidos os volumes de dados
// processados por unidade de tempo em cache L1 de um processador.
// O objetivo é estimar a taxa instantânea de transferência (MB/ms)
// em um tempo crítico de 2,0 milissegundos, aplicando técnicas de
// diferenciação numérica.

// Dados do problema
//X = [1.6, 1.8, 2.0, 2.2, 2.4];
//Y = [3.244909, 3.583519, 3.953032, 4.356755, 4.798624];
//k = find(X==2.0)


// Derivadas exatas
//d1 = 1.455213;
//d2 = 0.941608;
//d3 = -0.269390;
//d4 = -0.529599;

// Chamada modular
//diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4);
// ============================================================

// PROBLEMA 2 — Cálculo da taxa de crescimento de usuários
// simultâneos em sistema web
//
// Ao monitorar o comportamento de um sistema web sob carga,
// registrou-se o número de usuários simultâneos em instantes
// sucessivos. Deseja-se estimar a taxa de crescimento no instante
// 4,0 segundos após o início da carga, a fim de avaliar o ponto
// de inflexão no escalonamento automático do sistema.

// Dados do problema
//X = [3.6, 3.8, 4.0, 4.2, 4.4];
//Y = [156.071214, 164.706967, 173.831305, 183.496384, 193.761447];
//k = find(X == 4.0);

//d1 = 28.235294; 
//d2 = -6.228373; 
//d3 = 2.540199;  
//d4 = -1.387914;  

// Chamada modular
//diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4);
// ============================================================

// PROBLEMA 3 — Estimativa da variação do tempo de resposta
// em servidor sob carga crescente
//
// Durante um teste de estresse em um servidor de aplicações,
// o tempo médio de resposta foi registrado conforme a carga de
// requisições aumentava. Deseja-se estimar a taxa de crescimento
// do tempo de resposta quando a carga atinge 5,0 mil req/s.

// Dados do problema
//X = [4.6, 4.8, 5.0, 5.2, 5.4];
//Y = [35.777857, 38.285845, 41.000000, 43.967944, 47.240617];
//k = find(X==5.0)


// Derivadas exatas
//d1 = 11.418310;
//d2 = 6.794621;
//d3 = -1.418310;
//d4 = 0.435778;

// Chamada modular
//diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4);
// ============================================================

// PROBLEMA 4 — Cálculo da aceleração de uma partícula em
// simulação computacional
//
// Em uma simulação de física computacional, a posição de uma
// partícula foi registrada ao longo do tempo. Deseja-se calcular
// numericamente a 2ª derivada da posição (aceleração) no instante
// t = 2,0 segundos.

// Dados do problema
//X = [1.6, 1.8, 2.0, 2.2, 2.4];
//Y = [0.955512, 1.029619, 1.098612, 1.163151, 1.223775];
//k = find(X == 2.0);

//d1 = 0.333333; 
//d2 = -0.111111; 
//d3 = 0.074074;  
//d4 = -0.074074;  

// Chamada modular
//diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4);
// ============================================================


// ============================================================
// PROBLEMA 5 — Estimativa da variação do uso de CPU em função
// do número de processos
//
// Durante o gerenciamento dinâmico de escalonamento em sistemas
// operacionais, é importante prever como o uso da CPU se altera
// com o aumento do número de processos ativos. Deseja-se calcular
// a 1ª derivada do uso da CPU no ponto de 20 processos ativos.

// Dados do problema
//X = [16, 18, 20, 22, 24];
//Y = [57.432743, 63.591787, 70.000000, 76.744138, 83.816777];
//k = find(X==20)

// Derivadas exatas
//d1 = 1.095238;
//d2 = -0.052152;
//d3 = 0.044967;
//d4 = -0.000709;

// Chamada modular
//diferenciacao_numerica_completa(X, Y, k, d1, d2, d3, d4);
// ============================================================




