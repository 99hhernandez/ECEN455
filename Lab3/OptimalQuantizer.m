% Delcaring and initializing variables
n = 3;
M = 2^n;
qs = zeros(0,M);
bs = zeros(0,M+1);
bs(1) = -10;
bs(M+1) = 10;
N = 100000;

% Initialize quantizer
for i=1:M
    qs(i) = -10 + n*i;
end

% Iterate through algorithm 100 times
for i=1:(n*100)
    % Calculate boundary points
    for j=2:M
        bs(j) = (qs(j-1) + qs(j)) / 2;
    end
    % Update qs(i)
    for k=1:M
        topInterval = 0;
        bottomInterval = 0;
        for j=1:N
            u = (bs(k)*(j/N)) + bs(k+1) * ((N-j)/N);
            topInterval = topInterval + (1/N) * u * normpdf(u);
            bottomInterval = bottomInterval + (1/N) * normpdf(u);
        end
        qs(k) = topInterval / bottomInterval;
    end
end

% Computing the mean square error
MSE = 0;
for k=1:M
    tempMSE = 0;
    for j=1:N
        u = (bs(k)*(j/N)) + bs(k+1) * ((N-j)/N);
        tempMSE = tempMSE + (u - qs(k))^2 * normpdf(u);
    end
    MSE = MSE + tempMSE * (bs(k+1) - bs(k)) / N;
end

% Computing the mean square error empirically
EmpiricalMSE = 0;
count = 0;
for k=1:N
    x = normrnd(0,1);
    if (x > bs(1)) && (x < bs(2))
        x_hat = qs(1);
    elseif (x > bs(2)) && (x < bs(3))
        x_hat = qs(2);
    elseif (x > bs(3)) && (x < bs(4))
        x_hat = qs(3);
    elseif (x > bs(4)) && (x < bs(5))
        x_hat = qs(4);
    else 
        count = count + 1;
        x_hat = x;
    end
    EmpiricalMSE = EmpiricalMSE + (x - x_hat)^2;
end
EmpiricalMSE = EmpiricalMSE / (N-count);
