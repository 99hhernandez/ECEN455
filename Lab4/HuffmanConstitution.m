% Extract the characters from the file
fp = fopen('constitution.txt','r');
[A] = fread(fp,'*char');
fclose(fp);

symbols = unique(A);            % Isolate the characters in the file into array
symbolProb = zeros(1,numel(symbols));   % Create array for character probability

for i = 1:numel(symbols)        % Iterate through the array of symbols
   for j = 1:numel(A)           % Iterate through the chracters from the file
        if(A(j,1) == symbols(i,1))
            symbolProb(1,i) = symbolProb(1,i) + 1;  % Increment repeating symbols
        end
   end
end

% Convert array to probability decimal valye
for i = 1:numel(symbolProb)
    symbolProb(1,i) = symbolProb(1,i) / numel(A);
end

[L,code] = huffcode(symbolProb);    % call huffcode function

% Iterate through symbol probability to print its codeword
for i = 1:numel(symbolProb)
    if symbolProb(i) > 0
        fprintf('Symbol: %s, Codeword: %s \n',symbols(i),code(i));
    end
end
fprintf('Average Length: %.4f \n\n',L);

% Encode the 'constitution.txt' file
encode = huffEncode(code,symbols);
fprintf('Encoded: %s \n', encode);