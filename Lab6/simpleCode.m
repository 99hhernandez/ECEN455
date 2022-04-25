P = [1 1 0; 0 1 1; 1 0 1];          % declare code matrix
G = cat(2,P,eye(3));                % declare generator matrix
H = cat(2,eye(3),transpose(P));     % declare parity-check matrix

% 1. All possible 3-bit messages
u = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1];

% 2. Generate codebook
C = mod(u*G,2);
% Find d_min
d_min = gfweight(H,'par');

% 3. Construct syndrome table
rowIndex = [1 2 3 4 5 6 7 8];
syndromeDec = dec2base(rowIndex-1,2);           % convert row index to respective syndrome
t = syndtable(H);
rowIndexTable = array2table(rowIndex');         % convert row index matrix to table
syndromeCell = cellstr(syndromeDec);            % convert syndrome string to cell array
syndromeCellTable = array2table(syndromeCell);  % convert syndrome array to table
errorCell = mat2cell(t,[1 1 1 1 1 1 1 1]);      % break error codes into rows
errorTable = array2table(errorCell);            % convert error array to table
% conmbine all tables into syndrome table
syndromeTable = [rowIndexTable, syndromeCellTable, errorTable]; 
syndromeTable = renamevars(syndromeTable,["Var1","syndromeCell","errorCell"],["Row Index","Syndrome","Error"]);

% 4. Decode received vector
v = [1 0 1 1 1 1];
syndrome = mod(v*transpose(H),2);
syndromeInt = bit2int(syndrome',3) + 1;
decodedMessage = mod(v-t(syndromeInt,:),2);
% disp(decodedMessage)

% 5. Simulate code over BSC
numError = 0;
for i = 0:10^4
    randCodeword = C(randi(8),:);
    bscVector = bsc(randCodeword(1,:),0.05);
    syndrome = mod(bscVector*transpose(H),2);
    syndromeInt = bit2int(syndrome',3) + 1;
    if(randCodeword ~= t(syndromeInt,:))
        numError = numError + 1;
    end
end
errorRateSim = (numError/(10^4)) * 100;

numError = 0;
for i = 0:10^4
    randCodeword = C(randi(8),:);
    bscVector = bsc(randCodeword(1,:),0.1);
    syndrome = mod(bscVector*transpose(H),2);
    syndromeInt = bit2int(syndrome',3) + 1;
    if(randCodeword ~= t(syndromeInt,:))
        numError = numError + 1;
    end
end
errorRateSim2 = (numError/(10^4)) * 100;

numError = 0;
for i = 0:10^4
    randCodeword = C(randi(8),:);
    bscVector = bsc(randCodeword(1,:),0.15);
    syndrome = mod(bscVector*transpose(H),2);
    syndromeInt = bit2int(syndrome',3) + 1;
    if(randCodeword ~= t(syndromeInt,:))
        numError = numError + 1;
    end
end
errorRateSim3 = (numError/(10^4)) * 100;

t_star = floor((d_min-1)/2);
errorRateTheo1 = bscTheoretical(t_star,8,0.05);
errorRateTheo2 = bscTheoretical(t_star,8,0.10);
errorRateTheo3 = bscTheoretical(t_star,8,0.15);

% Print results
fprintf("1.) All possible messages:\n");
disp(u)
fprintf("2.) All codewords:\n");
disp(C)
fprintf("    d_min = %f\n\n",d_min);
fprintf("3.) Syndrome table:\n");
disp(syndromeTable)
fprintf("4.) Decoded received vector:\n");
disp(decodedMessage)
fprintf("5.) p=0.05\n");
fprintf("    Simulated Error Rate: %f%%\n",errorRateSim);
fprintf("    Theoretical Error Rate: %f%%\n",errorRateTheo1);
fprintf("\n    p=0.10\n");
fprintf("    Simulated Error Rate: %f%%\n",errorRateSim2);
fprintf("    Theoretical Error Rate: %f%%\n",errorRateTheo2);
fprintf("\n    p=0.15\n");
fprintf("    Simulated Error Rate: %f%%\n",errorRateSim3);
fprintf("    Theoretical Error Rate: %f%%\n",errorRateTheo3);
