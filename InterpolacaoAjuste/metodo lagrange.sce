clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE LAGRANGE - Ver. MODULARIZADA **\n")

//exec("lagrange_poly.sce", -1)
function [PolLagrange, CoefLagrange] = lagrange_poly(X, Y)
    n = length(X)
    x = poly(0, "X")
    PolLagrange = 0
    CoefLagrange = list()

    for i = 1:n
        Li = 1
        for j = 1:n
            if j <> i then
                Li = Li * (x - X(j)) / (X(i) - X(j))
            end
        end
        CoefLagrange(i) = Li
        PolLagrange = PolLagrange + Li * Y(i)
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

function interpolacao_por_lagrange(X, Y, PONTOS)
    n = length(X);
    grau_polinomio = n - 1;

    printf("\n[1] TABELA DE DADOS:\n");
    for i = 1:n
        printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i));
    end

    printf("\n[2] POLINÔMIOS DE BASE DE LAGRANGE:\n");
    [PolLagrange, CoefLagrange] = lagrange_poly(X, Y);
    for i = 1:n
        pol_str = pol2str(CoefLagrange(i));
        printf("   L_%d(x) = %s\n", i-1, pol_str);
    end

    printf("\n[3] POLINÔMIO INTERPOLADOR POR LAGRANGE:\n");
    disp(PolLagrange);

    // Avaliação dos pontos fornecidos
    for i = 1:length(PONTOS)
        ponto = PONTOS(i);
        valor_real = horner(PolLagrange, ponto); // ou fornecido manualmente
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto, valor_real);

        printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox);
        printf("[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual);
    end

    plotar_interpolador(X, Y, PolLagrange, PONTOS);
    printf("\n******** FIM DE INTERPOLAÇÃO POR LAGRANGE ********\n");
endfunction


// Problema 1 — Estimativa da pressão de recalque em fundações profundas
// Durante o ensaio de carregamento de uma estaca, foi registrada a pressão de recalque em diferentes profundidades.
// Estimar a pressão entre os pontos medidos permite prever o comportamento do solo ao longo do fuste.
X = [0,1,3,6]
Y = [0,95,260,510]
PONTOS = [2,4,5]

//gerar gráfico dos pontos e estimar os pontos
interpolacao_por_lagrange(X, Y, PONTOS)

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
