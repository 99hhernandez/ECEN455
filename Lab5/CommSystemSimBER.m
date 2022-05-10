SNR = 10.^(-1:0.1:1);

%QPSK
const = [1+1i, 1-1i, -1-1i, -1+1i];
grayMap = ['00', '01', '10', '11'];
simBitProbError = BitProbError(const,grayMap);
plot(SNR,simBitProbError);
title('Simulated Bit Error Rate for QPSK');


%16-QAM
const = [-3-3i, -3-1i, -3+1i, -3+3i, -1-3i, -1-1i, -1+1i, -1+3i, 1-3i, 1-1i, 1+1i, 1+3i, 3-3i, 3-1i, 3+1i, 3+3i];
grayMap = ['0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111', '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111'];
figure
simBitProbError = BitProbError(const,grayMap);
plot(SNR,simBitProbError);
title('Simulated Bit Error Rate for 16-QAM');

%8-PSK
const = [1, -1, 1i, -1i, (-1-1i)/(sqrt(2)), (-1+1i)/(sqrt(2)), (1-1i)/(sqrt(2)), (1+1i)/(sqrt(2))];
grayMap = ['000', '001', '010', '011', '100', '101', '110', '111'];
figure
simBitProbError = BitProbError(const,grayMap);
plot(SNR,simBitProbError);
title('Simulated Bit Error Rate for 8-PAK');


% Probability of bit error function
function prob = BitProbError(const,grayMap)
    s = length(grayMap(1));
	Eb = mean(abs(const.^2))/s;
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
			[~, index] = MLDecisions(const, simValue);
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



% function prob = greycommunication(const, greycode)
% 	s = length(greycode(1));
% 	Eb = mean(abs(const.^2))/s;
% 	N = 10000;
% 	len = length(const);
% 	cnt = 1;
% 	for i = -1:0.1:1
% 		No = Eb/10^i;
% 		errors = 0;
% 		for j = 1:N
% 			l = randi(len);
% 			real = const(l);
% 			awgn = normrnd(0,sqrt(No/2)) + normrnd(0,sqrt(No/2)) * 1i;
% 			sim = real + awgn;
% 			[sim, index] = mlDecisions(const, sim);
% 			greySim = greycode(index);
% 			greyReal = greycode(l);
% 			for k = 1:length(greySim)
% 				if(greySim(k) ~= greyReal(k))
% 					errors = errors + 1;
% 				end
% 			end
% 		end
% 		prob(cnt) = errors/N;
% 		cnt = cnt + 1;
% 	end
% end