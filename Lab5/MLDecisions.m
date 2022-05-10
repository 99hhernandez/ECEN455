function [x_hat,index_] = MLDecisions(const,y)
    index = 1;
    distance_min = abs((const(1)-y)^2);

    for i = 1:length(const)     %iterate through constellations
        distance = abs((const(i)-y)^2);
        if distance < distance_min      %replace min. distance if calculated is less
            distance_min = distance;
            index = i;
        end
    end
    x_hat = const(index);
    index_ = index;
end