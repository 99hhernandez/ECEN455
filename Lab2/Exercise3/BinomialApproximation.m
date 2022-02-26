% Assigning and initializing values for first plot
M1 = 20;
p1 = 0.15;
plotData1 = zeros(M1+1,1);
plotData1_2 = zeros(M1+1,1);
% Iterate throgh number of sequences
for i = 0:M1
    x = BinomialProbability(M1, p1, i);
    z = PoissonProbability(3,i);
    plotData1(i+1,1) = x;
    plotData1_2(i+1,1) = z;
end
sequence1 = 0:M1;

% Assigning and initializing values for second Binomial plot
M2 = 40;
p2 = 0.075;
plotData2 = zeros(M2+1,1);
plotData2_2 = zeros(M2+1,1);
% Iterate throgh number of sequences
for j = 0:M2
    x2 = BinomialProbability(M2, p2, j);
    z2 = PoissonProbability(3,j);
    plotData2(j+1,1) = x2;
    plotData2_2(j+1,1) = z2;
end
sequence2 = 0:M2;

% Assigning and initializing values for third Binomial plot
M3 = 60;
p3 = 0.05;
plotData3 = zeros(M3+1,1);
plotData3_2 = zeros(M3+1,1);
% Iterate throgh number of sequences
for k = 0:M3
    x3 = BinomialProbability(M3, p3, k);
    z3 = PoissonProbability(3,k);
    plotData3(k+1,1) = x3;
    plotData3_2(k+1,1) = z3;
end
sequence3 = 0:M3;

% Plotting Binomial and Poisson MPF M=20
figure
plot(sequence1,plotData1)
grid("on")
xlabel("Sequence of M")
ylabel("Probability")
title("Binomial PMF vs. Poisson PMF for M=20")
hold on
plot(sequence1,plotData1_2)
legend("Binomial PMF", "Poisson PMF")
hold off

% Plotting Binomial and Poisson MPF M=40
figure
plot(sequence2,plotData2)
grid("on")
xlabel("Sequence of M")
ylabel("Probability")
title("Binomial PMF vs. Poisson PMF for M=40")
hold on
plot(sequence2,plotData2_2)
legend("Binomial PMF", "Poisson PMF")
hold off

% Plotting Binomial and Poisson MPF M=60
figure
plot(sequence3,plotData3)
grid("on")
xlabel("Sequence of M")
ylabel("Probability")
title("Binomial PMF vs. Poisson PMF for M=60")
hold on
plot(sequence3,plotData3_2)
legend("Binomial PMF", "Poisson PMF")
hold off