% Declare and assign probability vector
p = [0.2 0.15 0.13 0.12 0.1 .09 0.08 0.07 0.06];

length = HuffmanLength(p);      % Call HuffmanLength function

fprintf('Average Code Length: %i\n',length);