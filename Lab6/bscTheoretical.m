function prob = bscTheoretical(t_star,n,p)
    sum = 0;
    for i=t_star+1:n
        prod1 = nchoosek(n,i);
        prod2 = power(1-p,n-i);
        sum = sum + prod1 * prod2 * power(p,i);
    end
    prob = sum;
end
