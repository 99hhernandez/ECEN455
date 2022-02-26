% Assign and initialize values
M = 10;
p = 0.5;
a1 = 3;
a2 = -5;
b1 = 2;
b2 = 7;

% Initializing additional variables
plotData1 = zeros(10000,1);
plotData2 = zeros(10000,1);
meanSum1 = 0;
meanSum2 = 0;
varSum1 = 0;
varSum2 = 0;

% Array for Z=3X+2Y
for i = 0:10000
    x = sum(rand(1,M)<p);
    y = sum(rand(1,M)<p);
    z = (a1*x) + (b1*y);
    plotData1(i+1,1) = z;
    meanSum1 = meanSum1 + z;
end

% Array for z=-5X+7Y
for j = 0:10000
    x2 = sum(rand(1,M)<p);
    y2 = sum(rand(1,M)<p);
    z2 = (a2*x2) + (b2*y2);
    plotData2(j+1,1) = z2;
    meanSum2 = meanSum2 + z2;
end

% Calculating mean of linear functions
%{ 
(a) The mean of Z=3X+2Y is equivalent to its expected value
E[Z] = aE[X] + bE[Y] = 3E[X] + 2E[Y]. Since both random variables X and Y
are binomial, they have the same expected value E[X] = E[Y] = Mp = 5
Based from the calculations, E[Z] should be 25.

(b) The mean of Z=-5X+7Y can be derived using the same methods as
that of part a. E[Z] = -5E[X] + 7E[Y], with E[X] = E[Y] = 5.
E[Z] should be 10 for part b.
%}
mean1 = meanSum1 / 10000;
mean2 = meanSum2 / 10000;

% Calculating variance of linear functions
for k = 0:10000
    varSum1 = varSum1 + (plotData1(k+1,1)-mean1)^2;
    varSum2 = varSum2 + (plotData2(k+1,1)-mean2)^2;
end 
var1 = varSum1 / 10000;
var2 = varSum2 / 10000;

fprintf('Part A: \n');
fprintf('Mean:%f \n',mean1);
fprintf('Variance:%f \n', var1);
fprintf('\n Part B:\n');
fprintf('Mean:%f \n', mean2);
fprintf('Variance:%f \n', var2);
