% Assigning variables
f0 = 5;
T = 2;
phi = pi/4;
fs = 100;
t = 0 : 1/fs : T;

X = -2*sin(2*pi*f0*t) + 4*cos(pi*f0*t + phi);

% Printing the size of array X
lengthX = length(X);
fprintf('3a.) Length of X: %d \n', lengthX);

% Printing the maximum value in array X
maxX = max(X);
fprintf('3b.) Max of X: %d \n', maxX);

% Printing the minimum value of array X
minX = min(X);
fprintf('3c.) Min of X: %d \n', minX);

% Printing the sum of all values in array X
sumX = sum(X);
fprintf('3d.) Sum of X: %d \n', sumX);

% Printing the mean value of array X
meanX = mean(X);
fprintf('3e.) Mean of X: %d \n', meanX);

% Printing the variance of array X
varianceX = var(X);
fprintf('3f.) Variance of X: %d \n', varianceX);

% Printing the value of X at t=0.1s and t=0.51s
f = @(t) -2*sin(2*pi*f0*t) + 4*cos(pi*f0*t + phi);
t1 = 0.1;
t2 = 0.51;

G1 = f(t1);
G2 = f(t2);
fprintf('3g.) Value of X at t=0.1 sec: %d \n    Value of X at t=0.51 sec: %d \n', G1, G2);
