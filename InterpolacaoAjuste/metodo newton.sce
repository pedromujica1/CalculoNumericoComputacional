clear(); clc(); clf();

printf("\n** INTERPOLAÇÃO PELO MÉTODO DE NEWTON - Ver. MODULARIZADA **\n")

//exec("dif_divididas.sce", -1)
function coef = dif_divididas(X, Y)
    n = length(X)
    coef = Y

    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (X(i) - X(i-j+1))
        end
    end
endfunction
//exec("newton_poly.sce", -1)
function P = newton_poly(X, coef)
    n = length(X)
    x = poly(0, "x")
    P = coef(1)
    px = 1

    for i = 2:n
        px = px * (x - X(i-1))
        P = P + coef(i) * px
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

function interpolacao_por_newton(X, Y, PONTOS)
    n = length(X);

    printf("\n[1] TABELA DE DADOS:\n")
    for i = 1:n
        printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
    end

    printf("\n[2] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n")
    coef = dif_divididas(X, Y);
    for i = 1:n
        printf("   a_%d = %.6f\n", i-1, coef(i))
    end

    PolNewton = newton_poly(X, coef);
    printf("\n[3] CONSTRUÇÃO DO POLINÔMIO DE NEWTON:\n")
    disp(PolNewton)

    // Avaliar todos os pontos fornecidos
    for i = 1:length(PONTOS)
        ponto = PONTOS(i);
        valor_real = horner(PolNewton, ponto);
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto, valor_real);
        printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox)
        printf("[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual)
    end

    plotar_interpolador(X, Y, PolNewton, PONTOS);
    printf("\n******** FIM DE INTERPOLAÇÃO POR NEWTON ********\n")
endfunction

// Problema 1 — Estimativa da pressão de recalque em fundações profundas
// Durante o ensaio de carregamento de uma estaca, foi registrada a pressão de recalque em diferentes profundidades.
// Estimar a pressão entre os pontos medidos permite prever o comportamento do solo ao longo do fuste.
X = [0,1,3,6]
Y = [0,95,260,510]
PONTOS = [2,4,5]

//gerar gráfico dos pontos e estimar os pontos
interpolacao_por_newton(X, Y, PONTOS)

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

