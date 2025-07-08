function V = vander_matrix(x)
    // This function generates a Vandermonde matrix from the vector x.
    // The Vandermonde matrix is defined such that each column corresponds to
    // increasing powers of the elements in x.
    
    n = length(x);
    V = zeros(n, n);
    
    for i = 1:n
        for j = 1:n
            V(i, j) = x(i)^(j-1);
        end
    end
endfunction
//=====================================================
