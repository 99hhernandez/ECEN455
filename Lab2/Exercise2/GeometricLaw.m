% Telephone Calling Example
disp('A fax machine dials a phone number that is typically busy 80% of the time.');
disp('The machine dials it every 5 minutes until the line is clear and the fax is transmitted.');
disp('What is the probability that the fax machine will have to dial the number 9 times?');
% The phone is busy 80% of the time (1-p = 0.8)
% The number is dialed 9 times before it is answered
prob = GeometricProbability(0.2,9);
fprintf('The probability of the phone answering the first time on the 9th call is:');
disp(prob);


% Assigning initial values for plots
k = 10;
p1 = 0.25;
p2 = 0.5;
plotData1 = zeros(k, 1);
plotData2 = zeros(k, 1);

% Iterate through the trials k=10
for i = 1:k
    x = GeometricProbability(p1,i);
    x2 = GeometricProbability(p2,i);
    plotData1(i,1) = x;
    plotData2(i,1) = x2;
end
sequence = 1:k;

% Plot the graphs for p=0.25 and p=0.5
plot(sequence,plotData1)
grid("on")
xlabel('Number of Trials')
ylabel('Probability')
title('Geometric Probability Law')
hold("on")
plot(sequence,plotData2)
legend('p=0.25','p=0.5')
hold("off")