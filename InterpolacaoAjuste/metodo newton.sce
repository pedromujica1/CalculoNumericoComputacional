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

function interpolacao_por_newton(X, Y, ponto)
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

    valor_real = horner(PolNewton, ponto); // ou fornecido, se desejar
    [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto, valor_real);

    printf("\n[4] VALOR APROXIMADO: p(%.2f) = %.6f\n", ponto, valor_aprox)
    printf("[5] ERRO PERCENTUAL: %.3f%%\n", erro_percentual)

    plotar_interpolador(X, Y, PolNewton);
    printf("\n******** FIM DE INTERPOLAÇÃO POR NEWTON ********\n")
endfunction

X = [0,1,2,3];
Y = [1,6,5,-8];
ponto = 3.0;

interpolacao_por_newton(X, Y, ponto)

