//https://www.wolframalpha.com/widgets/view.jsp?id=9951be8e8e72897baea23b49e96829d9
// SE INTEGRAL EXATA NÃO É DADA: jogar no link amigo ali em cima e resolver
// SE A FUNÇÃO NÃO É DADA: interpolar o polinômio usando os dados da tabela

clear(); clc()

//exec("01-trapezio_dados.sce", -1)
function Trapezio_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (h/2) * [f(x0) + 2*Σ f(xk) + f(xn)]\n")
    
    somatorio = sum(Y(2:num_pontos-1))
    integral_numerica = (h/2) * (Y(1) + 2*somatorio + Y(num_pontos))
    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
endfunction

//exec("02-simpson_1_3_dados.sce", -1)
function Simpson_1_3_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (h/3) * [f(x0) + 4*Σ impares + 2*Σ pares + f(xn)]\n")
    
    somatorio_pares = sum(Y(3:2:num_pontos-1))
    somatorio_impares = sum(Y(2:2:num_pontos-1))
    integral_numerica = (h/3) * (Y(1) + 4*somatorio_impares + 2*somatorio_pares + Y(num_pontos))
    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
endfunction

//exec("03-simpson_3_8_dados.sce", -1)
function Simpson_3_8_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (3h/8) * [f(x0) + 3*Σ grupo1 + 2*Σ grupo2 + f(xn)]\n")
    
    somatorio1 = 0
    somatorio2 = 0

    for i = 2:3:num_pontos-1
        somatorio1 = somatorio1 + Y(i) + Y(i+1)
    end

    for i = 4:3:num_pontos-1
        somatorio2 = somatorio2 + Y(i)
    end

    integral_numerica = (3*h/8) * (Y(1) + 3*somatorio1 + 2*somatorio2 + Y(num_pontos))
    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
endfunction

//exec("04-trapezio_funcao.sce", -1)
function Trapezio_Funcao(f, x0, xn, n, integral_exata)
    h = (xn - x0) / n
    soma_interna = 0
    for i = 1:(n-1)
        soma_interna = soma_interna + f(x0 + i*h)
    end
    integral_numerica = (h/2) * (f(x0) + 2*soma_interna + f(xn))

    printf("\n   Intervalo de %g a %g com %d subintervalos (n=%d)\n", x0, xn, n+1, n)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
endfunction

function integracao_completa(X, Y, integral_exata, f, x0, xn, n)
    // Executa todos os métodos de integração para um problema específico
    
    printf("\n***** INTEGRAÇÃO NUMÉRICA - MÓDULO COMPLETO *****\n")
    
    printf("\n>> Método do Trapézio Generalizado (dados tabulados):")
    Trapezio_Dados(X, Y, integral_exata)
    
    printf("\n>> Método de Simpson 1/3 Generalizado (dados tabulados):")
    Simpson_1_3_Dados(X, Y, integral_exata)
    
    printf("\n>> Método de Simpson 3/8 Generalizado (dados tabulados):")
    Simpson_3_8_Dados(X, Y, integral_exata)
    
    printf("\n>> Método do Trapézio Generalizado (função dada ou calculada):")
    Trapezio_Funcao(f, x0, xn, n, integral_exata)
    
    printf("\n***** FIM INTEGRAÇÃO NUMÉRICA *****\n")
endfunction

// PROBLEMA 1 DO TRABALHO!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [5.04,5.93,12.08,26.01,44.91,70.21,100.87]
//integral_exata = 210
//deff('y=f(x)', 'y = 3*x^2 - 2*x + 5')
//x0 = 0.0; xn = 6.0; n = 1000
//integracao_completa(X, Y, integral_exata, f, x0, xn, n)

// PROBLEMA 2 DO TRABALHO!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [0.01,0.69,1.09,1.40,1.60,1.79,1.95]
//integral_exata = 7.6214
//deff('y=f(x)', 'y = log(x+1)')
//x0 = 0.0; xn = 6.0; n = 1000
//integracao_completa(X, Y, integral_exata, f, x0, xn, n)

// PROBLEMA 3 DO TRABALHO!!!!!
//X = [0,0.1667,0.3333,0.5,0.6667,0.8333,1]
//Y = [0,0.515,0.866,1,0.866,0.515,0.01]
//integral_exata = 0.63662
//deff('y=f(x)', 'y = sin(%pi*x)')
//x0 = 0.0; xn = 1.0; n = 1000
//integracao_completa(X, Y, integral_exata, f, x0, xn, n)

// PROBLEMA 4 DO TRABALHO!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [1,0.49,0.2,0.099,0.06,0.038,0.027]
//integral_exata = 1.405647
//deff('y=f(x)', 'y = 1/(1 + x^2)')
//x0 = 0.0; xn = 6.0; n = 1000
//integracao_completa(X, Y, integral_exata, f, x0, xn, n)

// PROBLEMA 5 DO TRABALHO!!!!!
// não tem solução analitica, erros relativos 300%, só o último método da certo
//X = [0,1,2,3,4,5,6]
//Y = [1,0.44,-0.23,-0.47,-0.24,0.13,0.27]
//integral_exata = 0.0557713
//deff('y=f(x)', 'y = exp(-0.2*x)*cos(x)')
//deff('y=f(x)', 'y = 1 - 0.2073333*x - 0.5322222*x^2 + 0.1904167*x^3 - 0.0080556*x^4 - 0.0030833*x^5 + 0.0002778*x^6')
//x0 = 0.0; xn = 6.0; n = 1000
//integracao_completa(X, Y, integral_exata, f, x0, xn, n)