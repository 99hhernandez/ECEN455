## OVERVIEW

Computing the relationship between the reliability of a communication system and the available
physical resources, such as energy and time, is one of the main challenges in digital communications.
For relatively simple communication systems, such a relationship can be obtained analytically and
precisely. For example, suppose we want to transmit one bit information using two voltages across
an additive Gaussian noise channel. The average error probability for the maximum-likelihood
(ML) receiver can be derived analytically and expressed using the Gaussian Q-Function.

If, however, either the communication scheme or the channel model is too complicated to
allow for the precise performance analysis, computer simulations become a valuable alternative. In
this lab, we start with BPSK, the simplest possible example, and learn how to simulate a digital
communication system. We also learn that it is important to verify that our simulation is correct by
comparing with known analytical bounds. The same ideas are also extended to more complicated
constellation diagrams, such as QPSK, 16-QAM and 8-PSK. Once again the simulation results
are then compared to the theoretical results. While QPSK and 16-QAM both have closed form
expressions for the exact probability of error, the 8-PSK expression is only an upper bound.

## EXERCISES

1. Prepare a generic MATLAB function: x̂ = mlDecisions(const, y), which returns the ML
estimate of x for a given constellation and the received voltage y. The decoder will make a
decision in favor of any signal point if its distance from the received point is minimum.

2. Write a MATLAB program to simulate a communication system: which produces complex
signal at the transmitter, passes it through an additive complex Gaussian noise channel and
makes a decision based on the ML decision rule at the receiver. Randomly transmit one out
of M points on the signal constellation. Estimate the probability of error P<sub>e</sub> by counting the
frequency of the error events out a total of N = 10<sup>4</sup> simulations. For communication systems,
the SNR is typically stated as E<sub>s</sub>/N<sub>0</sub> where E<sub>s</sub> is the energy per symbol and the N<sub>0</sub> is the
noise spectral density. In this case, E<sub>s</sub> is the second moment (average absolute value squared)
of the constellation and N<sub>0</sub> = 2σ<sup>2</sup> (where σ<sup>2</sup> is variance of the AWGN in each dimension).
Plot the estimated error probabilities as a function of E<sub>s</sub>/N<sub>0</sub> = 10<sup>(-1:0:1:1)</sup>. Compare your
simulation results with the analytical expressions given on the next page.

3. The results obtained in part 2 give the symbol error rate (SER) versus E<sub>s</sub>/N<sub>0</sub>. Now, we will
compute similar results for the bit error rate (BER). First, use Gray mapping to label the
constellations. Gray mapping is a technique for assigning binary labels to integer sequences
so that the binary labels of adjacent integers differ only in 1 bit. For example, the Gray
mappings, for 4 and 8 elements, are given by

<p align="center">{0, 1, 2, 3} → {00, 01, 11, 10}</p>

<p align="center">{0, 1, 2, 3, 4, 5, 6, 7} → {000, 001, 011, 010, 110, 111, 101, 100}</p>

<ul>
Modify your program to use Gray mapping and count both bit errors and symbol errors. Now, repeat your simulations (for N = 10<sup>4</sup> symbols) to estimate the BER. Finally, plot the results to show the relationship between the BER and E<sub>b</sub>/N<sub>0</sub>, where E<sub>b</sub> is energy transmitted per bit (i.e., E<sub>s</sub> normalized by the number of bits).
</ul>

---
## CONSTELLATION DATA

1. Signal Constellation:
    1. QPSK: <img src="https://latex.codecogs.com/png.image?\large&space;\dpi{110}\bg{white}\left\{1&plus;j,&space;1-j,&space;-1-j,&space;-1&plus;j\right\}">
    2. 16-QAM: <img src="https://latex.codecogs.com/png.image?\large&space;\dpi{110}\bg{white}\left\{a&plus;bj|a,&space;b&space;\epsilon&space;\left\{&space;-3,&space;-1,&space;1,&space;3\right\}\right\}">
    3. 8-PSK: <img src="https://latex.codecogs.com/png.image?\large&space;\dpi{110}\bg{white}\left\{1,-1,j,-j,\frac{1}{\sqrt{2}}\left&space;(&space;-1-j&space;\right&space;),\frac{1}{\sqrt{2}}\left&space;(&space;-1&plus;j&space;\right&space;),\frac{1}{\sqrt{2}}\left&space;(&space;1-j&space;\right&space;),\frac{1}{\sqrt{2}}\left&space;(&space;1&plus;j&space;\right&space;)\right\}">
2. Probability of Error
    1. QPSK: <img src="https://latex.codecogs.com/png.image?\large&space;\dpi{110}\bg{white}P(e)=2Q\left(\sqrt{\frac{E_{s}}{N_{0}}}\right)-Q^{2}\left(\sqrt{\frac{E_{s}}{N_{0}}}\right)">
    2. 16-QAM: <img src="https://latex.codecogs.com/png.image?\large&space;\dpi{110}\bg{white}P(e)=3Q\left(\sqrt{\frac{E_{s}}{5N_{0}}}\right)-\frac{9}{4}Q^{2}\left(\sqrt{\frac{E_{s}}{5N_{0}}}\right)">
    3. 8-PSK: <img src="https://latex.codecogs.com/png.image?\large&space;\dpi{110}\bg{white}P(e)\leq&space;2Q\left(\sqrt{\frac{2E_{s}}{N_{0}}sin^{2}\frac{\pi&space;}{8}}\right)">
