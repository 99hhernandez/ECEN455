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

    ![Bernoulli](https://latex.codecogs.com/png.image?\dpi{110}&space;\bg_black&space;Pr[k]=\binom{M}{k}p^{k}(1-p)^{M-k}&space;&space;&space;&space;&space;&space;&space;;k=0,1,...,M&space;)

    where pis the probability of success. Write a MATLAB code and plot the binomial probability
law for
    
    a) M = 10 and p = 0.5,
    
    b) M = 20 and p = 0.7.

    **Geometric Probability Law**: This law helps in determining the probability that the rst
sucess will occur at trial k.

    ![Geometric](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D%20%5Cbg_black%20Pr%5Bk%5D=(1-p)%5E%7Bk-1%7Dp%20%20%20%20%20%20%20;k=1,2,...,%20)

    For kup to 10, plot the geometric probability law for
    
    a) p = 0.25,

    b) p = 0.5.

    **Telephone Calling Example**: A fax machine dials a phone number that is typically busy
80% of the time. The machine dials it every 5 minutes until the line is clear and the fax is
transmitted. What is the probability that the fax machine will have to dial the number 9
times?

3) **Approximation of the Binomial PMF by Poisson PMF**: This exercise will help you
understand that the binomial and Poisson PMFs are related to each other under certain
conditions. This relationship helps to explain why the Poisson PMF is used in various appli-
cations, primarily in traffic modelling. The relationship is as follows. For a binomial PMF,
suppose we let M → ∞ and p → 0 such that the product Mp → λ is a constant. Then, the
sequence of binomial distributions converges a Poisson distribution with parameter λ gives
by

    ![Poisson](https://latex.codecogs.com/png.image?\dpi{110}&space;\bg_black&space;Pr[k]=\frac{\lambda^{k}}{k!}e^{-\lambda})

    Using Matlab plot the Binomial PMF for M = 20,40,60 and Mp = 3 and its approximation
using Poisson PMF.

4) **Mean and Variance of Linear Functions of Random Variables**: Generate a linear
function of two random variables of the form Z = aX+ bY, where aand bare constants.
For simplicity, we assume that the random variables Xand Yare binomial with p = 0.5 and
M = 10. Therefore, they can be obtained by using x=sum(rand(1,M)<p) in MATLAB. Then,
use a simulation to estimate the mean and variance of Z. Do this exercise for

    a) a= 3 and b= 2

    b) a= −5 and b= 7.

    What do you expect the answers to be and what answers do you obtain through simulations?
How can you make both the answers tally to a precision of 2nd decimal place? Use help
command to understand more about the sum and rand functions.
