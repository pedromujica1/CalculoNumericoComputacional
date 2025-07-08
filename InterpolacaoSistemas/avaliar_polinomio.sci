function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_real)
    // Avalia o polinômio POL no ponto especificado
    // POL: vetor de coeficientes do polinômio
    // ponto: valor onde o polinômio será avaliado
    // valor_real: valor real esperado para comparação
    
    // Calcula o valor aproximado do polinômio no ponto
    valor_aprox = horner(POL, ponto);
    //verifica se valor real fo fornecido (terceiro argumento)
    if argn(2) == 3 then
        // se sim, calcula o erro percentual relativo
        erro_percentual = abs((valor_aprox - valor_real) / valor_real) * 100;
    else
        //caso contrário, atribui Nan AO ERRO
        erro_percentual = %nan;
    end
endfunction
//=====================================================
        
