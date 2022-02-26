## Overview
Many systems designed by electrical engineers involve elements that either have inherent ran-
domness or cannot be characterized precisely. One example is that ampli ers in communication
systems are subject to thermal noise caused by molecular vibrations. Another is that the fabrica-
tion of CMOS circuits is affected by very small shifts in the mask and imperfections in the silicon.
While the effect of these impairments might be exactly computable, it is more effective to treat
them as random quantities and evaluate the average number of parts (on a silicon wafer) that meet
the performance speci cations.
Before building such a system, one generally likes estimate how that system will perform. To
do this, engineers typically run simulations of the system using randomly chosen values for the
unknown quantities. By repeating the simulations multiple times, one obtains a \Monte Carlo"
estimate of the system performance. In this lab, you will use MATLAB to perform a number
experiments involving probability. This will allow you to develop a hands-on feel for the simulation
of random events.

## Exercises
1) **Birthday Problem**: This problem uses combinatorics (study of counting) for the purpose of
calculating probability. A probability class has N students enrolled. What is the probability
that at least two of the students have the same birthday? Assume that each student in the
class is equally likely to be born on any day of the year.
    
    a) Plot this probablity for total number of students ranging from 1-50. If you feel the
iterations take a long time to run, reduce the total no. of iterations.
    
    b) For how many students is the probability close to 0.5? Does the answer seem intuitive
to you? Explain.
    
    c) Also give the mathematical expression for this probability for N students.
    
2) **Bernoulli Sequence**: Any sequence of M independent subexperiments with each subexper-
iment producing two possible outcomes is called a Bernoulli sequence.

    **Binomial Probability Law**: The binomial probability law is used for determining the
probability of ksuccesses among Mindependent Bernoulli trials. The probability can be
calculated using the formula

![Bernoulli](<img src="https://latex.codecogs.com/png.image?\dpi{110}&space;\bg_black&space;Pr[k]=\binom{M}{k}p^{k}(1-p)^{M-k}&space;&space;&space;&space;&space;&space;&space;;k=0,1,...,M&space;" title="\bg_black Pr[k]=\binom{M}{k}p^{k}(1-p)^{M-k} ;k=0,1,...,M " />)



