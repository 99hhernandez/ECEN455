% Assigning and initializing values
M1 = 10;
M2 = 20;
p1 = 0.5;
p2 = 0.7;
plotData1 = zeros((5*M1)+1,1);  % mulitply by 5 for more precise graph
plotData2 = zeros((5*M2)+1,1);

% Iterate throgh number of sequences for M=10
for i = 0:(5*M1)
    x = BinomialProbability(5*M1, p1, i);
    plotData1(i+1,1) = x*2;     % double the values to accomodate for additional iterations
    clear x                     % clear x values from workspace to save memory 
end
sequence1 = 0:(5*M1);

% Iterate through number of sequences for M=20
for j = 0:(5*M2)
    x2 = BinomialProbability(5*M2, p2, j);
    plotData2(j+1,1) = x2*2;
end
sequence2 = 0:(5*M2);

%{
%============ ORIGINAL CODE ===================
% Assigning and initializing values for second plot
M1 = 10;
p1 = 0.5;
plotData1 = zeros(M1+1,1);

for i = 0:M1
    x = BinomialProbability(M1, p1, i);
    plotData1(i+1,1) = x;
end
sequence1 = 0:M1;

M2 = 20;
p2 = 0.7;
plotData2 = zeros(M2+1,1);

for j = 0:M2
    x2 = BinomialProbability(M2, p2, j);
    plotData2(j+1,1) = x2;
end
sequence2 = 0:M2;
%==============================================
%}

% Plotting both binomial probability laws
plot(sequence1,plotData1)
grid("on")
xlabel("Sequence of M")
% Adjust x-axis ticks for additional iterations
xticks([0 10 20 30 40 50 60 70 80 90 100])
xticklabels({'0','2','4','6','8','10','12','14','16','18','20'})
ylabel("Probability")
title("Binomial Probability Law")
hold on
plot(sequence2,plotData2)
legend("M=10 and p=0.5","M=20 and p=0.7")
hold off