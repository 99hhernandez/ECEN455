function prob = GeometricProbability(p, k)
    a = (1-p) ^ (k-1);
    prob = a * p;
end