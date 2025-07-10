//-------TRABALHO 1-P2-RESOLUÇÃO DE SISTEMAS DE EQUAÇÕES LINEARES----------------
//Alunos: Pedro Miotto Mujica, Thiago Oliveira Dupim, Vinicius Castaman, Gabriel Costa
//Resolvendo Sistemas de Equações Lineares
clear(); clc(); clf()

printf("\n** INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES - Ver. MODULARIZADA **\n")

//exec("gauss.sce", -1)
function [COEF] = gauss(mat_vander, vetor_Y)

    n = length(vetor_Y)
    COEF = zeros(n, 1)

    for k = 1:n-1
        for i = k+1:n
            m = mat_vander(i, k) / mat_vander(k, k)
            mat_vander(i, k) = 0
            for j = k+1:n
                mat_vander(i, j) = mat_vander(i, j) - m * mat_vander(k, j)
            end
            vetor_Y(i) = vetor_Y(i) - m * vetor_Y(k)
        end
    end

    for k = n:-1:1
        soma = 0
        for j = k+1:n
            soma = soma + COEF(j) * mat_vander(k, j)
        end
        COEF(k) = (vetor_Y(k) - soma) / mat_vander(k, k)
    end
endfunction
//exec("vander_matrix.sce", -1)
function V = vander_matrix(X)
    n = length(X)
    V = zeros(n, n)

    for i = 1:n
        for j = 1:n
            V(i, j) = X(i)^(j-1)
        end
    end
endfunction
//exec("avaliar_polinomio.sce", -1)
function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_real)
    valor_aprox = horner(POL, ponto)
    
    if argn(2) == 3 then
        erro_percentual = abs((valor_aprox - valor_real) / valor_real) * 100
    else
        erro_percentual = %nan;
    end
endfunction
        
//exec("plotar_interpolador.sce", -1)
function plotar_interpolador(X, Y, COEF, PONTOS)
    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF)
    end

    Pol = poly(COEF, 'x', 'c')

    // Curva de interpolação
    xx = linspace(X(1), X($), 300)
    yy = horner(Pol, xx)

    // Avaliar o polinômio nos pontos desejados
    yp = horner(Pol, PONTOS)

    // Título do gráfico
    titulo = "Polinômio Interpolador: p_n(x) = " + pol2str(Pol)

    // Gráfico
    clf()
    plot(X, Y, 'ro')                  // Pontos dados
    plot(xx, yy, 'b', 'LineWidth', 2) // Curva do polinômio
    plot(PONTOS, yp, 'mo.')            // Pontos interpolados (marcados com 'x' verde)
    h.mark_style = 9;                    // círculo preenchido
    h.mark_size = 8;                     // tamanho grande
    h.mark_foreground = color("magenta");
    h.mark_background = color("magenta");
    

    // Eixos e grade
    xgrid()
    xtitle(titulo, "x", "f(x)")

    // Legenda
    legend(["Pontos dados", "Polinômio interpolador", "Pontos estimados"])

    // Ajuste de fontes
    a = gca()
    a.title.font_size = 4
    a.x_label.font_size = 4
    a.y_label.font_size = 4
endfunction

function interpolacao_por_sistema(X, Y, ponto)
    n = length(X);
    grau_polinomio = n - 1;

    printf("\n[1] TABELA DE DADOS:\n")
    for i = 1:n
        printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
    end

    Vander = vander_matrix(X);

    printf("\n[2] MATRIZ DE VANDERMONDE:\n")
    disp(Vander)
    COEF = gauss(Vander, Y);

    printf("\n[3] COEFICIENTES DO POLINÔMIO:\n")
    coef_labels = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5'];
    for i = 1:n
        mprintf("   %s = %.6f\n", coef_labels(i), COEF(i))
    end

    Pol = poly(COEF, 'x', 'c');

    printf("\n[4] POLINÔMIO INTERPOLADOR:\n")
    disp(Pol)

    // Avaliação do ponto fornecido
    valor_real = horner(Pol, ponto);
    [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto, valor_real);
    printf("\n[5] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox);
    printf("[6] ERRO PERCENTUAL: %.3f%%\n", erro_percentual);

    plotar_interpolador(X, Y, COEF, [ponto]); // vetor com um único ponto para manter compatibilidade
    printf("\n***** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES *****\n")
endfunction


// Problema 1 — Estimativa da pressão de recalque em fundações profundas
// Durante o ensaio de carregamento de uma estaca, foi registrada a pressão de recalque em diferentes profundidades.
// Estimar a pressão entre os pontos medidos permite prever o comportamento do solo ao longo do fuste.

X = [0,1,3,6]
Y = [0,95,260,510]
PONTOS = [2,4,5]

//estimar com 2metros 
//ponto = 2;
//interpolacao_por_sistema(X, Y, ponto)
//estimar com 4metros
//ponto = 4;
//interpolacao_por_sistema(X, Y, ponto)
//estimar 5metros
ponto = 5;
interpolacao_por_sistema(X, Y, ponto)
//gerar gráfico dos pontos
//interpolacao_por_sistema(X, Y, PONTOS)

// Problema 2 — Análise térmica de pavimento recém-aplicado sob variação solar
// Monitorar a temperatura do pavimento ao longo do dia é importante para prever cura e segurança.
// Deseja-se estimar a temperatura em horários intermediários.

//X = [8,10,12,15]
//Y = [25,36,47,55]
//PONTOS = [9.5,13,14]

//estimar com 9h30 horas
//ponto = 9.5;
//interpolacao_por_sistema(X, Y, ponto)
//estimar com 13 horas
//ponto = 13;
//interpolacao_por_sistema(X, Y, ponto)
//estimar com 14 horas
//ponto = 14;
//interpolacao_por_sistema(X, Y, ponto)
//gerar gráfico dos pontos
//interpolacao_por_sistema(X, Y, PONTOS)

// Problema 3 — Estimativa de altura d’água em reservatório com falhas de sensores
// Com sensores em posições fixas, falhas exigem interpolar níveis de água em tempos não medidos.

//X = [0,5,10,20]
//Y = [0, 1.4, 2.6, 5.3]
//PONTOS = [12,17]

//ponto = 12;
//interpolacao_por_sistema(X, Y, ponto)

//ponto = 17;
//interpolacao_por_sistema(X, Y, ponto)

//interpolacao_por_sistema(X, Y, PONTOS)

// Problema 4 — Previsão de consumo de memória com aumento do tamanho de entrada
// Analisar como o consumo de memória cresce com o tamanho da entrada ajuda na alocação dinâmica de recursos.

//X = [100,200,400,800]
//Y = [30.5,45,70.2,120]
//PONTOS = [300,600]

//interpolacao_por_sistema(X, Y, ponto)
//estimar com 300kB
//ponto = 300;
//interpolacao_por_sistema(X, Y, ponto)

//ponto = 600;
//interpolacao_por_sistema(X, Y, ponto)

//gerar gráfico dos pontos
//interpolacao_por_sistema(X, Y, PONTOS)


// Problema 5 — Previsão de tempo de download com base na banda disponível
// Estimar o tempo de download para velocidades não testadas ajuda no planejamento de desempenho de redes.

//X = [10,20,50,100]
//Y = [900,450,180,90]
//PONTOS = [30,75]

//interpolacao_por_sistema(X, Y, ponto)
//estimar com 300kB
//ponto = 30;
//interpolacao_por_sistema(X, Y, ponto)

//ponto = 75;
//interpolacao_por_sistema(X, Y, ponto)

//gerar gráfico dos pontos
//interpolacao_por_sistema(X, Y, PONTOS)


// Problema 6 — Estimativa do ganho de desempenho em sistemas paralelos
// A interpolação permite prever o tempo de execução para diferentes números de threads.
// Isso auxilia a identificar gargalos ou ganhos reais com paralelismo.

// Problema 7 — Estimativa de falhas em cluster de servidores
// Utiliza-se interpolação para prever falhas esperadas com base no tempo de operação contínua.
// Importante para manutenção preventiva e balanceamento de carga.

// Problema 8 — Cálculo de carga térmica em microprocessadores
// A temperatura depende da frequência e tensão de operação. Interpolar ajuda a prever regimes críticos.

// Problema 9 — Estimativa de pressão em reatores químicos com base na temperatura
// Estimar a pressão em temperaturas intermediárias auxilia na avaliação de segurança industrial.

// Problema 10 — Estimativa da umidade do solo entre profundidades medidas
// A interpolação ajuda a estimar o perfil de umidade no solo para melhor manejo hídrico.




