function [E] = huffEncode(codeWord,A)
    [E] = "";
    for i = 1:numel(A)
        E = E + codeWord(char(A(i)+0));
        if length(E) ~= 1
            break;
        end
    end
end