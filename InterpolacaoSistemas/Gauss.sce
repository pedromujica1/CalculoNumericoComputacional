function [COEF] = Gauss(mat_vander, vetor_Y)
    // Resolução de sistemas lineares por eliminação de Gauss
    // A: Matriz dos coeficientes
    // B: Vetor dos termos independentes
    // COEF: Vetor dos coeficientes da solução
    n = length(vetor_Y);
    COEF = zeros(n, 1);

    //[1] ETAPA DE ELIMINAÇÃO DE GAUSS
    for k = 1:n-1
        for i = k+1:n  
            m = mat_vander(i, k) / mat_vander(k, k); //multiplicador
            mat_vander(i,k) = 0; //Zerando o elemento abaixo do pivô
            for j = k+1:n
                mat_vander(i, j) = mat_vander(i, j) - m * mat_vander(k, j);
            end
            vetor_Y(i) = vetor_Y(i) - m * vetor_Y(k);
        end
    end
    //[2] ETAPA DE SUBSTITUIÇÃO REVERSA
    for k = n:-1:1
        soma = 0;
        for j = k+1:n  
            soma = soma + COEF(j) * mat_vander(k, j);
        end
        COEF(k) = (vetor_Y(k) - soma) / mat_vander(k, k);
    end
endfunction
//=====================================================    
//[7] FIM DO CÓDIGO