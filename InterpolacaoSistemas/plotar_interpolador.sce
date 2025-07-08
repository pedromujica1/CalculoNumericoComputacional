function plotar_interpolador(X,Y, COEF)
    //se o COEF não for fornecido, calcula os coeficientes
    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF)
        // Description of name(input)
    end
    Pol = poly(COEF, 'x','c');

    //gera pointso para traçar a curva suavemente
    xx = linspace(X(1), X($), 300);
    yy = horner(Pol,xx);

    //definie titulo 
    titulo = "Polinômio Interpolador: p_n(x)" +pol2str(Pol);

    //geraçao do grafico
    clf();
    plot(X,Y,'ro',xx,yy,'b','LineWidth',3); // pontos + curva
    xgrid();

    xtitle(titulo, "x", "f(x)");
    //ajustes visuais
    a = gca();
    a.title.FontSize = 6;
    a.xlabel.FontSize = 4;
    a.ylabel.FontSize = 4;

    legend("Pontos de Interpolação", "Polinômio Interpolador", "Location", "best");
endfunction