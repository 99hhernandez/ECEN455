**Approximation of the Binomial PMF by Poisson PMF**: This exercise will help you
understand that the binomial and Poisson PMFs are related to each other under certain
conditions. This relationship helps to explain why the Poisson PMF is used in various applications, 
primarily in traffic modelling. The relationship is as follows. For a binomial PMF,
suppose we let M → ∞ and p → 0 such that the product Mp → λ is a constant. Then, the
sequence of binomial distributions converges a Poisson distribution with parameter λ gives by

![Poisson](https://latex.codecogs.com/png.image?\dpi{110}&space;\bg_black&space;Pr[k]=\frac{\lambda^{k}}{k!}e^{-\lambda})

Using Matlab plot the Binomial PMF for M = 20, 40, 60 and Mp = 3 and its approximation using Poisson PMF.
