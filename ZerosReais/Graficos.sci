//-------TRABALHO 1 - ZEROS REAIS DE FUNÇÕES REAIS----------------
//Alunos: Pedro Miotto Mujica, Thiago Oliveira Dupim, Vinicius Castaman, Gabriel Costa
//Gerando os gráficos das funções e suas raízes aproximadas

/*
Fazendo um estudo de sinal no intervalo [-7, +2] ⊂ ℝ obtém-se:
Como no subintervalo [1; 2] a função muda de sinal, ele é candidato a conter as raízes
 Plotando a função no intervalo [1, 2] marcado em vermelho obtém-se:
(imagem do grafico)
que corrobora que as eventuais raízes pertencem aos subintervalos indicados no item 1.)
(analise derivadas)
Para mostrar a existência de uma raiz da função f(x) no intervalo [1; 2], aplicamos o Teorema do Valor Intermediário. Primeiro calculamos f(1) = 1² - 3 = -2 e f(2) = 2² - 3 = 1. Como f(1) é negativo e f(2) é positivo, e a função é contínua, pelo teorema existe pelo menos uma raiz nesse intervalo, pois a função muda de sinal (f(1)*f(2) = -2 < 0).

Para verificar se a raiz é única no intervalo [1; 2], analisamos a derivada f'(x) = 3x² - 9. Calculamos f'(1) = -6 e f'(2) = 3. Aqui observamos que f'(1)*f'(2) = -18, que é menor que zero. Isso indica que a derivada muda de sinal no intervalo, o que significa que a função não é estritamente crescente ou decrescente em todo o intervalo. Portanto, não podemos garantir a unicidade da raiz apenas com esse critério. Seria necessário uma análise mais detalhada do comportamento da derivada em todo o intervalo para confirmar se há apenas uma raiz ou possivelmente mais de uma.
Para o subintervalo [1, 2] obtém-se, via métodos de refinamento, que:
(imagem print scilab)
(verifica raiz)
Como o valor médio das raízes é 1,732051, então f(1,732051) = (1,732051)^2 − 3 = 2,999999 − 3 =
−1,0 ⋅ 10⁻⁶ ≈ 0, o que mostra que a solução aproximada é suficientemente boa para os mais
diversos propósitos.

clear();clc();
h = 300; F = 0.8; D = 14; C = 1200; //constantes exercicio 2.2
d = 10 //constante exercicio 2.3
O = 5 //constante exercicio 2.4

//x0, x1: intervalo total do gráfico
//a, b: intervalo de destaque
//raiz_aprox: valor da raiz aproximada
//func_expr: string com a expressão da função para título e legendas
function gerarGrafico(minha_func, x0, x1, a, b, raiz_aprox, func_expr)
   
    //Geração dos pontos do gráfico completo
    x_total = linspace(x0, x1, 1000);
    y_total = minha_func(x_total);

    //Intervalo destacado
    x_destacado = linspace(a, b, 300);
    y_destacado = minha_func(x_destacado);

    //Plotagem iniciada
    clf();
    plot(x_total, y_total, "b-", "LineWidth", 2); // Função em azul
    xgrid();

    //Título perfumado
    titulo = "f(x) = " + func_expr + " com intervalo [" + string(a) + "; " + string(b) + "] destacado";
    xtitle(titulo, "x", "f(x)");

    //Intervalo destacado
    plot(x_destacado, y_destacado, "r-", "LineWidth", 3); // Intervalo em vermelho

    //Marcando raiz apoximada
    plot(raiz_aprox, minha_func(raiz_aprox), "ko", "MarkerSize", 8, "MarkerFaceColor", "k"); // pequeno círculo preto, não preenchido

    //linha horizontal y = 0
    plot(x_total, zeros(x_total), "k--");

    //legenda
    legend(["Função f(x)", "Intervalo destacado [" + string(a) + "; " + string(b) + "]", "Raiz aproximada"]);
endfunction

function gerarGraficoRad()

    clc;
    clear;
    funcprot(0);

    //Constantes
    h = 300;
    F = 0.8;
    D = 14;
    C = 1200;

    // Função com operações elemento a elemento
    deff('y = f(A)', 'y = (%pi*(h./cos(A)).^2 .* F) ./ (0.5*%pi*D^2*(1 + sin(A) - 0.5*cos(A))) - C');

    // Intervalo amplo para visualizar toda a curva
    A_full = linspace(-0.2, 0.2, 1000);
    Y_full = f(A_full);

    // Intervalo específico [0, π/25] para destacar
    A_dest = linspace(0, %pi/25, 200);
    Y_dest = f(A_dest);

    // Plot da função completa
    plot(A_full, Y_full, 'b-');
    xlabel("A (radianos)");
    ylabel("f(A)");
    title("Gráfico da função f(A) com destaque no intervalo [0, π/25]");
    xgrid();

    // Adiciona linha horizontal y = 0
    plot([-0.2, 0.2], [0, 0], 'r--');

    // Adiciona destaque sobre o intervalo [0, π/25]
    plot(A_dest, Y_dest, 'r-', 'LineWidth', 2); // linha vermelha mais grossa
    //legenda
    legend(["Função f(x)", "Intervalo destacado [" + string(a) + "; " + string(b) + "]", "Raiz aproximada"]);

endfunction

//-------------Problema 1.1: Obter uma aproximação às raízes das funções----------------
//1. 𝐟(𝐱) = 𝐱^𝟐 − 𝟑 no intervalo [𝟏; 𝟐], com 𝛜 = 𝟏𝟎**-6
printf("PROBLEMA 1.1 NÚMERO 1\n");
//deff('y=f(x)', 'y=x^2 - 3');
//gerarGrafico(f, -3, 3, 1, 2, 1.732051, "x^2 - 3");

//2. g(𝐱) = 𝐱^𝟐 + 𝐥𝐧(𝐱) no intervalo [𝟎,𝟓; 𝟏], com 𝛜 = 𝟏𝟎^−𝟓
//printf("PROBLEMA 1.1 NÚMERO 2\n");
//deff('y = g(x)', 'y = x^2 + log(x)');
//gerarGrafico(g, 0.2, 1.2, 0.5, 1, 0.652919, "y = x^2 + log(x)");


//-------------Problema 1.2: Obter uma aproximação para primeira raiz positiva da função:----------------
//1. 𝐟(𝐱) = 𝐞^−𝐱 − 𝐬𝐞𝐧(𝐱), com 𝛜 = 𝟏𝟎^−𝟓
printf("PROBLEMA 1.2 NÚMERO 1\n");
//deff('y = f(x)', 'y = exp(-x) - sin(x)');
//gerarGrafico(f, 0, 4.5, 0.5, 1.0, 0.588533, "exp(-x) - sin(x)");

//2. 𝐟(𝐱) = 𝐱 𝐥𝐧(𝐱) − 𝟑.𝟐 no intervalo [𝟐, 𝟑], com 𝛜 = 𝟏𝟎^−𝟔
printf("PROBLEMA 1.2 NÚMERO 2\n");
//deff('y = f(x)', 'y = x .* log(x) - 3.2');
//gerarGrafico(f, 0, 6, 2.0, 3.0, 2.954165, "x * log(x) - 3.2");


//-------------Problema 1.3: Obter uma aproximação às raízes das funções:---------------------------------
//1. 𝐟(𝐱) = 𝐜𝐨𝐬(𝐱) + 𝐱 no intervalo [−𝟏, 𝟎], com 𝛜 = 𝟏𝟎^−𝟓
printf("PROBLEMA 1.3 NÚMERO 1\n");
//deff('y = f(x)', 'y = cos(x) + x');
//gerarGrafico(f, -2, 4, -1.0, 0.0, -0.739085, "cos(x) + x");
//2. g(𝐱) = 𝐞^𝐱 + 𝐱 no intervalo [−𝟏, 𝟎], com 𝛜 = 𝟏𝟎^−𝟓
printf("PROBLEMA 1.3 NÚMERO 2\n");
//deff('y = g(x)', 'y = exp(x) + x');
//gerarGrafico(g, -2, 2, -1.0, 0.0, -0.567143, "exp(x) + x");

//-------------Problema 1.4: Obter uma aproximação às raízes----------------
//1. A raiz cúbica de 𝐟(𝐱) = 𝐱^𝟑 − 𝟓, com 𝛜 = 𝟏𝟎^−𝟔
printf("PROBLEMA 1.4 NÚMERO 1\n");
//deff('y = f(x)', 'y = x^3 - 5');
//gerarGrafico(f, 0, 3, 1.0, 2.0, 1.709976, "x^3 - 5");

//2. A raiz negativa de g(𝐱) = 𝐱^𝟑 − 𝟓𝐱^𝟐 + 𝐱 + 𝟑, com 𝛜 = 𝟏𝟎^−𝟔
printf("PROBLEMA 1.4 NÚMERO 2\n");
//deff('y = g(x)', 'y = x^3 - 5*x^2 + x + 3');
//gerarGrafico(g, -3, 5, -2.0, 0.0, -0.645751, "x^3 - 5*x^2 + x + 3");

//-------------Problema 1.5: Obter uma aproximação à raiz de----------------
//1. 𝐟(𝐱) = 𝐬𝐞𝐧(𝐱) − 𝐭𝐠(𝐱) no intervalo [𝟑, 𝟒], com 𝛜 = 𝟏𝟎^−𝟓
printf("PROBLEMA 1.5 NÚMERO 1\n");
//deff('y = f(x)', 'y = sin(x) - tan(x)');
//gerarGrafico(f, 2.5, 4.5, 3.0, 4.0, 3.141593, "sin(x) - tan(x)");


//2. 𝐟(𝐱) = 𝐞^−𝐱^𝟐 − 𝐜𝐨𝐬(𝐱) no intervalo [𝟏, 𝟐], com 𝛜 = 𝟏𝟎^−𝟓
printf("PROBLEMA 1.5 NÚMERO 2\n");
//deff('y = f(x)', 'y = exp(-x^2) - cos(x)');
//gerarGrafico(f, 0, 2.6, 1.0, 2.0, 1.570796, "exp(-x^2) - cos(x)");



//-------------Problema 1.6: Obter uma aproximação às raízes das funções----------------
//1. 𝐠(𝐱) = 𝐱^𝟑 − 𝐱 − 𝟏 no intervalo [𝟏, 𝟐], com 𝛜 = 𝟏𝟎^−𝟔
printf("PROBLEMA 1.6 NÚMERO 1\n");
//deff('y = g(x)', 'y = x^3 - x - 1');
//gerarGrafico(g, 0, 3, 1.0, 2.0, 1.324718, "x^3 - x - 1");

//2. 𝐡(𝐱) = 𝟒𝐬𝐞𝐧(𝐱) − 𝐞^𝐱 no intervalo [𝟎, 𝟏], com 𝛜 = 𝟏𝟎^−𝟓
printf("PROBLEMA 1.6 NÚMERO 2\n");
//deff('y = h(x)', 'y = 4*sin(x) - exp(x)');
//gerarGrafico(h, -2, 4, 0.0, 1.0, 0.370558, "4*sin(x) - exp(x)");
//////////////////////////////////////////////////////////////////////////////////////
//------------------------------ PARTE 2 --------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////

//-------------Problema 2.1: Discuta a função 𝐟(𝐱) = 𝟐𝟑𝟎𝐱^𝟒 + 𝟏𝟖𝐱^𝟑 + 𝟗𝐱^𝟐 − 𝟐𝟐𝟏𝐱 − 9----------------
//Intervalo: [-0.3, 1.1]
printf("PROBLEMA 2.1\n");
//deff('y = f(x)', 'y = 230*x^4 + 18*x^3 + 9*x^2 - 221*x - 9');
//gerarGrafico(f, -0.5, 1.5, -0.3, 0.0, -0.040659, "230*x^4 + 18*x^3 + 9*x^2 - 221*x - 9");


//-------------Problema 2.2: Função de captação de energia solar----------------
//y = f(A)', 'y = (%pi*(h/cos(A))^2 * F / (0.5*%pi*D^2*(1 + sin(A) - 0.5*cos(A))) - C
//𝐡 = 𝟑𝟎𝟎𝒎; 𝐅 = 𝟎.𝟖; 𝐃 =𝟏𝟒𝒎; 𝐂 = 𝟏𝟐𝟎0
// Intervalo: 0 ≤ A ≤ %pi/25 (~0.1257 rad)
printf("PROBLEMA 2.2\n");
//gerarGraficoRad();

//-------------Problema 2.3: Movimento de material perigoso----------------
//d=10; 'y = p(t)', 'y = 7*(2.0 - 0.9^t) - d'
printf("PROBLEMA 2.3\n");
//deff('y = p(t)', 'y = 7*(2.0 - 0.9^t) - d');
//gerarGrafico(p, -2, 20, 0, 10, 5.311436, "7*(2.0 - 0.9^t) - d");

//-------------Problema 2.4: Nível de oxigênio em rio----------------
//O = 5; deff('y = C(d)', 'y = 10 - 20*(exp(-0.2*d) - exp(-0.75*d)) - O');
printf("PROBLEMA 2.4\n");
//deff('y = C(d)', 'y = 10 - 20*(exp(-0.2*d) - exp(-0.75*d)) - O');
//gerarGrafico(C, -2, 10, 0, 5, 1.0, "10 - 20*(exp(-0.2*d) - exp(-0.75*d)) - O");
