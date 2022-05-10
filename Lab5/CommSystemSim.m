SNR = 10.^(-1:0.1:1);

%QPSK
const = [1+1i, 1-1i, -1-1i, -1+1i];     %Signal constellation
simProbError = ProbError(const);        %Call probability of error function
realError = 2*qfunc(sqrt(SNR)) - qfunc(sqrt(SNR)).^2;   %Real probability of error
grayMap = ['00', '01', '10', '11'];     %Gray mapping
simBitProbError = BitProbError(const,grayMap);  %Call probability of bit error
tiledlayout(2,1)
nexttile
plot(SNR, simProbError)
title('SER vs SNR for QPSK')
xlabel('SNR')
ylabel('Symbol Error Rate')
hold on
plot(SNR, realError)
legend('Simulated','Actual')
hold off
nexttile
plot(SNR,simBitProbError);
title('Bit Error Rate for QPSK')
xlabel('Eb/N0')
ylabel('Bit Error Rate');

%16-QAM
const = [-3-3i, -3-1i, -3+1i, -3+3i, -1-3i, -1-1i, -1+1i, -1+3i, 1-3i, 1-1i, 1+1i, 1+3i, 3-3i, 3-1i, 3+1i, 3+3i];
simProbError = ProbError(const);
realError = 3*qfunc(sqrt(SNR/5)) - (9/4)*qfunc(sqrt(SNR/5)).^2;
grayMap = ['0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111', '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111'];
simBitProbError = BitProbError(const,grayMap);
figure
tiledlayout(2,1)
nexttile
plot(SNR, simProbError)
title('SER vs SNR for 16-QAM')
xlabel('SNR')
ylabel('Symbol Error Rate')
hold on
plot(SNR, realError)
legend('Simulated','Actual')
hold off
nexttile
plot(SNR,simBitProbError);
title('Bit Error Rate for 16-QAM')
xlabel('Eb/N0')
ylabel('Bit Error Rate');

%8-PSK
const = [1, -1, 1i, -1i, (-1-1i)/(sqrt(2)), (-1+1i)/(sqrt(2)), (1-1i)/(sqrt(2)), (1+1i)/(sqrt(2))];
simProbError = ProbError(const);
realError = 2*qfunc(sqrt(2*SNR*sin(pi/8)^2));
grayMap = ['000', '001', '010', '011', '100', '101', '110', '111'];
simBitProbError = BitProbError(const,grayMap);
figure
tiledlayout(2,1)
nexttile
plot(SNR, simProbError)
title('SER vs SNR for 8-PAK')
xlabel('SNR')
ylabel('Symbol Error Rate')
hold on
plot(SNR, realError)
legend('Simulated','Actual')
hold off
nexttile
plot(SNR,simBitProbError);
title('Bit Error Rate for 8-PAK')
xlabel('Eb/N0')
ylabel('Bit Error Rate');

% Probability of error function
function prob = ProbError(const)
    Es = mean(abs(const.^2));   %Calculate energy per symbol
    N = 10000;
    constLength = length(const);    %Length of constellation array
    count = 1;

    for i = -1:0.1:1
        N0 = Es/(10^i);
        errorCount = 0;
        for j = 1:N
            randLength = randi(constLength);    %return random index
            realPart = const(randLength);       %assign constellation from random index
            awgn = normrnd(0,sqrt(N0/2)) + normrnd(0,sqrt(N0/2)) * 1i;  %generate dditive white gaussian noise
            simValue = realPart + awgn;     %add noise to constellation
            simValue = MLDecisions(const,simValue);     %recursively call ML function
            if(realPart ~= simValue)
                errorCount = errorCount + 1;
            end
        end
        prob(count) = errorCount/N;
        count = count + 1;
    end
end

% Probability of bit error function
function prob = BitProbError(const,grayMap)
    s = length(grayMap(1));     %returns codelength of gray mapping
	Eb = mean(abs(const.^2))/s; %Calculate energy transmitted per bit
	N = 10000;
	constLength = length(const);
	count = 1;

	for i = -1:0.1:1
		N0 = Eb/(10^i);
		errors = 0;
		for j = 1:N
			randLength = randi(constLength);
			realPart = const(randLength);
			awgn = normrnd(0,sqrt(N0/2)) + normrnd(0,sqrt(N0/2)) * 1i;
			simValue = realPart + awgn;
			[simValue, index] = MLDecisions(const, simValue);
			graySim = grayMap(index);
			grayReal = grayMap(randLength);
			for k = 1:length(graySim)
				if(graySim(k) ~= grayReal(k))
					errors = errors + 1;
				end
			end
		end
		prob(count) = errors/N;
		count = count + 1;
	end
end