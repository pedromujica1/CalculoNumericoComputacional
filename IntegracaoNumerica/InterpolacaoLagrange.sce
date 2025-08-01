clear(); clc(); clf();

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
function plotar_interpolador(X, Y, COEF)
    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF)
    end

    Pol = poly(COEF, 'x', 'c')

    xx = linspace(X(1), X($), 300)
    yy = horner(Pol, xx)

    titulo = "Polinômio Interpolador: p_n(x) = " + pol2str(Pol)

    clf()
    plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3)
    xgrid()
    xtitle(titulo, "x", "f(x)")

    a = gca()
    a.title.font_size = 4
    a.x_label.font_size = 4
    a.y_label.font_size = 4
endfunction

function interpolacao_por_lagrange(X, Y)
    printf("\n** INTERPOLAÇÃO PELO MÉTODO DE LAGRANGE - Ver. MODULARIZADA **\n")

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

    plotar_interpolador(X, Y, PolLagrange);
    printf("\n******** FIM DE INTERPOLAÇÃO POR LAGRANGE ********\n");
endfunction

// PROBLEMA 1 INTEGRAIS!!!!!
X = [0,1,2,3,4,5,6]
Y = [5.04,5.93,12.08,26.01,44.91,70.21,100.87]
interpolacao_por_lagrange(X, Y)

// PROBLEMA 2 INTEGRAIS!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [0.01,0.69,1.09,1.40,1.60,1.79,1.95]
//interpolacao_por_lagrange(X, Y)

// PROBLEMA 3 INTEGRAIS!!!!!
//X = [0,0.1667,0.3333,0.5,0.6667,0.8333,1]
//Y = [0,0.515,0.866,1,0.866,0.515,0.01]
//interpolacao_por_lagrange(X, Y)

// PROBLEMA 4 INTEGRAIS!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [1,0.49,0.2,0.099,0.06,0.038,0.027]
//interpolacao_por_lagrange(X, Y)

// PROBLEMA 5 INTEGRAIS!!!!!
// polinômio não consegue inferir função, propor solução usando mais pontos
//X = [0,1,2,3,4,5,6]
//Y = [1,0.44,-0.23,-0.47,-0.24,0.13,0.27]
//interpolacao_por_lagrange(X, Y)