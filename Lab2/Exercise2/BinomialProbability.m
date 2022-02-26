function prob = BinomialProbability(M, p, k)
    M_choose_k = factorial(M) / (factorial(M-k) * factorial(k));
    prob = M_choose_k * (p^k) * ((1-p)^(M-k));
end
