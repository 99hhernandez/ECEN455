function [L,c] = huffcode(p)
    if length(p) > 2        % While there are at least 2 elements in the array
        [sortP,sortIndex] = sort(p,'ascend');   % Sort the array in ascending order
        [anL,anC] = huffcode([(sortP(1)+sortP(2)),sortP(3:length(sortP))]);
        L = anL+sortP(1)+sortP(2);      % Update the average huffman code length
        c = strings(1,length(p));
        c(sortIndex(1)) = anC(1)+"0";   % Append 0 when updating dictionary
        c(sortIndex(2)) = anC(1)+"1";   % Append 1 when updating dictionary
        c(sortIndex(3:length(p))) = anC(2:length(anC));
    else
        L = 1;
        c = ["0","1"];
    end
end