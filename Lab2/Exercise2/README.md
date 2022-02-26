**Bernoulli Sequence**: Any sequence of M independent subexperiments with each subexperiment producing two possible outcomes is called a Bernoulli sequence.

**Binomial Probability Law**: The binomial probability law is used for determining the
probability of k successes among M independent Bernoulli trials. The probability can be calculated using the formula

![Bernoulli](https://latex.codecogs.com/png.image?\dpi{110}&space;\bg_black&space;Pr[k]=\binom{M}{k}p^{k}(1-p)^{M-k}&space;&space;&space;&space;&space;&space;&space;;k=0,1,...,M&space;)

where p is the probability of success. Write a MATLAB code and plot the binomial probability law for
    
a) M = 10 and p = 0.5,
    
b) M = 20 and p = 0.7.

**Geometric Probability Law**: This law helps in determining the probability that the first sucess will occur at trial k.

![Geometric](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D%20%5Cbg_black%20Pr%5Bk%5D=(1-p)%5E%7Bk-1%7Dp%20%20%20%20%20%20%20;k=1,2,...,%20)

For k up to 10, plot the geometric probability law for
    
a) p = 0.25,

b) p = 0.5.

**Telephone Calling Example**: A fax machine dials a phone number that is typically busy
80% of the time. The machine dials it every 5 minutes until the line is clear and the fax is
transmitted. What is the probability that the fax machine will have to dial the number 9
times?
