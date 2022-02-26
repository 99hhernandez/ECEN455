function prob = PoissonProbability(lambda,k)
    prob = (power(lambda,k) / factorial(k))* exp(-lambda);
end
