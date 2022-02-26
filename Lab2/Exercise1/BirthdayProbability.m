function prob = BirthdayProbability(N)
    event = zeros(10000,1);     % initialize to no successful event
    %N = 10;                    % number of students 
    for ntrial = 1:10000
        for i = 1:N
            x(i,1) = ceil(365*rand(1,1));   % choose birthdays at random
        end
        y = sort(x);    % arrange birthdays in ascending order
        z = y(2:N) - y(1:(N-1));   % compares successive birthdays
        w = find(z==0);     % flags same birthdays
        if length(w) > 0
            event(ntrial) = 1;  % event occurs if one or more birthdays is same
        end
    end
    prob = sum(event) / 10000;
end
