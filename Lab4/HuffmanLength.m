function L = HuffmanLength(p)
    tmp = 0;                        % Temporary variable for length
    m = numel(p);                   % Number of elements in array
    p = sort(p,"ascend");           % Sort array in ascending order
    while (m >= 2)                  % Iterate until 2 elements are left in array
        tmp = tmp + p(1) + p(2);    % Add two lowest probabilities
        p(2) = p(1) + p(2);         % Replace second elemtns with sum of two lowest values
        p = p(2:length(p));         % Replace array values
        m = numel(p);               % Update number of elements in new array
        p = sort(p,"ascend");       % Sort new array in ascending order
    end
    L = tmp;                        % Set variable L with tmp value
end