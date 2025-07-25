clear(); clc();
function ajuste_polinomial_mom(X, Y, ordem)
    n = length(X);
    
    printf("\n[1] TABELA DE DADOS:\n");
    for i = 1:n
        printf("   x = %.6f   y(x) = %.6f\n", X(i), Y(i));
    end

    grau = ordem + 1;
    A = zeros(grau, grau);
    B = zeros(grau, 1);

    // Montando matriz A
    for i = 1:grau
        for j = 1:grau
            for k = 1:n
                A(i,j) = A(i,j) + X(k)^(i-1 + j-1);
            end
        end
    end
    printf("\n[2] MATRIZ DO SISTEMA NORMAL (A):\n");
    disp(A);

    // Montando vetor B
    for i = 1:grau
        for k = 1:n
            B(i) = B(i) + X(k)^(i-1) * Y(k);
        end
    end
    printf("\n[3] VETOR DOS TERMOS INDEPENDENTES (B):\n");
    disp(B);

    // Resolvendo o sistema
    M = A \ B;
    printf("\n[4] COEFICIENTES DO POLINÔMIO DE AJUSTE:\n");
    for i = 1:grau
        printf("   a_%d - %.6f\n", i-1, M(i));
    end

    Pol_ajuste = poly(M, 'x', 'c');
    printf("\n[5] POLINÔMIO DE AJUSTE:\n");
    disp(Pol_ajuste);

    // Cálculo de SSR e R^2
    Ybar = mean(Y);
    SSR = 0;
    SST = 0;

    for i = 1:n
        ajuste = horner(Pol_ajuste, X(i));
        SSR = SSR + (Y(i) - ajuste)^2;
        SST = SST + (Y(i) - Ybar)^2;
    end

    R2 = 1 - SSR/SST;
    printf("\n[6] SOMA DOS QUADRADOS DOS RESÍDUOS (SSR): %.6f\n", SSR);
    printf("[7] COEFICIENTE DE DETERMINAÇÃO R²: %.6f\n", R2);

    // Plotagem
    xx = linspace(min(X), max(X), 300);
    yy = horner(Pol_ajuste, xx);

    clf();
    plot(X, Y, 'ro', xx, yy, 'b', 'LineWidth', 3);
    xgrid();
    xtitle("Ajuste Polinomial por MOM", "x", "y(x)");
    legend(["Dados observados", "Curva ajustada"], 2);

    printf("\n******** FIM DO AJUSTE POLINOMIAL POR MOM ********\n");
endfunction

// Problema 11 - Modelagem da dinâmica de absorção de nitrato de sódio por fungos em videiras
// Objetivo: Ajustar modelos polinomiais de 1ª e 2ª ordem aos dados experimentais de concentração de NaNO2 ao longo do tempo.
// Avaliar o coeficiente de determinação (R²) e discutir o comportamento de estabilização da concentração.
// Aplicação importante para entender a cinética de absorção de compostos antifúngicos em videiras.

//TESTANDO COM ORDEM 1
//X = [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13];
//Y = [0.64, 0.64, 0.64, 1.17, 2.31, 3.33, 5.08, 6.06, 7.05, 7.50, 7.78, 7.83, 7.97, 8.00];
//ordem = 1;
//TESTANDO COM ORDEM 2
//ordem = 2;
//ajuste_polinomial_mom(X, Y, ordem);

// Problema 12 - Influência do teor de umidade na densidade de biomassa para biodiesel
// Objetivo: Ajustar modelos polinomiais de 2ª e 3ª ordem aos dados relacionando teor de umidade (base seca) e massa específica.
// Analisar o grau de não linearidade entre os parâmetros, fundamental para transporte e rendimento na produção de biodiesel.

//X = [0.08, 0.14, 0.244, 0.35, 0.43, 0.53, 0.57];
//Y = [933, 1011, 988, 1025, 1018, 1012, 963];
//ordem = 2;
//ordem = 3;
//ajuste_polinomial_mom(X, Y, ordem);


// Problema 13 - Simulação térmica da parede de concreto exposta a fonte de calor constante
// Objetivo: Ajustar modelos polinomiais de 2ª e 3ª ordem para descrever a variação de temperatura no centro de uma parede de concreto ao longo de 7 horas.
// Avaliar o regime de aquecimento e discutir a possibilidade de saturação térmica (estabilização da temperatura).

//X = [0, 1, 2, 3, 4, 5, 6, 7];
//Y = [20.0, 22.5, 26.8, 31.0, 36.5, 42.0, 45.5, 47.2];
//ordem = 2
//ajuste_polinomial_mom(X, Y, ordem);
//ordem = 3
//ajuste_polinomial_mom(X, Y, ordem);

// Problema 14 - Modelagem do assentamento do solo por adensamento ao longo do tempo
// Objetivo: Ajustar modelos polinomiais de 2ª e 3ª ordem para os dados de assentamento do solo medido em diferentes dias.
// Interpretar o comportamento de longo prazo, verificando tendências de estabilização ou continuidade no adensamento.

// Dados do experimento
//X = [0, 5, 10, 20, 30, 45, 60];
//Y = [0.0, 2.8, 4.9, 7.6, 9.0, 9.8, 10.2];
// Ajuste polinomial de 2ª ordem
//ordem = 2;
//ajuste_polinomial_mom(X, Y, ordem);
//ordem = 3;
//ajuste_polinomial_mom(X, Y, ordem);

// Problema 15 - Evolução da resistência à compressão do concreto com o tempo de cura
// Objetivo: Ajustar modelos polinomiais de 2ª e 3ª ordem aos dados de resistência à compressão em função dos dias de cura.
// Estimar o ganho de resistência ao longo do tempo e analisar a curva de evolução para prever o desempenho do concreto em estruturas.

// Dias de cura (X) e Resistência (MPa) (Y)
//X = [1, 3, 7, 14, 21, 28, 56];
//Y = [6.2, 10.3, 18.7, 25.5, 28.1, 30.2, 32.0];
// Ajuste polinomial de 2ª ordem
//ordem = 2;
//ajuste_polinomial_mom(X, Y, ordem);
// Ajuste polinomial de 3ª ordem
//ordem = 3;
//ajuste_polinomial_mom(X, Y, ordem);





