% Part A
Fs = 8000;
% Reading and collecting data from first audio file
data0 = audioread('speech0.wav');
speech0 = data0;
player = audioplayer(speech0,Fs);
play(player);
% Reading and collecting data from second audio file
data1 = audioread('speech1.wav');
speech1 = data1;
player = audioplayer(speech1,Fs);
play(player);

% Graph parameters
hold on
stem(data0);
stem(data1);
hold off
xlabel('Time');
ylabel('Voltage');
title('speech0.wav vs. speech1.wav');
legend('speech0.wav','speech1.wav');


% Part B
fmax = 1;
fmin = 0;
L = 2^8;
Q = (fmax - fmin) / L;      % quantization interval

% speech0 quantization
speech0New = zeros(24882,1);
for i=1:24882
    speech0New(i) = (floor((speech0(i)-fmin) / Q)) * Q + (Q/2) + fmin;
end
player = audioplayer(speech0New,Fs);
play(player);

% speech1 quantization
speech1New = zeros(21418,1);
for i=1:21418
    speech1New(i) = (floor((speech1(i)-fmin) / Q)) * Q + (Q/2) + fmin;
end
player = audioplayer(speech1,Fs);
play(player);

% SQNR speech0
px0 = 0;
pz0 = 0;
for i=1:24882
    px0 = px0 + (1/24882) * (abs(speech0(i)))^2;
    pz0 = pz0 + (1/24882) * (abs(speech0(i)-speech0New(i)))^2;
end
SQNR0 = 10*log10(px0/pz0);

% SQNR speech1
px1 = 0;
pz1 = 0;
for i=1:21418
    px1 = px1 + (1/21418) * (abs(speech1(i)))^2;
    pz1 = pz1 + (1/21418) * (abs(speech1(i)-speech1New(i)))^2;
end
SQNR1 = 10*log10(px1/pz1);


% Part C
% RMS for speech0
RMS0 = sqrt(length(speech0) / sum(speech0.*speech0));
figure
histogram(abs(speech0)/RMS0,8);
xlabel('Range');
ylabel('Frequency');
title('Histogram for speech0.wav');

% RMS for speech1
RMS1 = sqrt(length(speech1) / sum(speech1.*speech1));
figure
histogram(abs(speech1)/RMS1,8);
xlabel('Range');
ylabel('Frequency');
title('Histogram for speech1.wav');


% Part D
mu = 255;       % L = 256
% mu-Law Compressor
Fx = sign(speech0).*((log(1+mu*abs(speech0))) / log(1+mu));
figure
stem(Fx);
sound(Fx);
xlabel('Time');
ylabel('Voltage');
title('Graph of F(x) for speech0.wav');
% Expander
y = zeros(24882,1);
for i=1:24882
    y(i) = (floor((speech0(i)-fmin) / Q)) * Q + (Q/2) + fmin;
end
Fy = sign(y)/mu.*((1+mu).^abs(y)-1);
figure
stem(Fy);
xlabel('Time');
ylabel('Voltage');
title('Non-Uniform PCM System ');


% Part E
px = 0;
pz = 0;
for i=1:24882
    px = px + (1/24882) * (abs(speech0(i)))^2;
    pz = pz + (1/24882) * (abs(speech0(i)-Fy(i)))^2;
end
SQNR_Fy = 10*log10(px/pz);