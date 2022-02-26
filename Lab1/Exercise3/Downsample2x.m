% Create a .wav file from the .mat file
load ecen455_lab1_sound.mat
filename = 'lab1_sound.wav';
Fs = 48000;                 % sampling frequency of audio file
audiowrite(filename,y,Fs);  % read data from the .wav file
clear y Fs                  % clear from workspace to free up system memory

[y,Fs] = audioread('lab1_sound.wav');   % Read the data back into MATLAB

% Downsample signal by factor of 2
newFs = Fs / 2;
y_down = y(1:2:end);    % copying every other sample into new array
N = length(y_down);     % number of the data samples in new array
t = 0:N-1;              % array of new audio samples

wavplay(y_down,newFs)       % Play audio file

% Plot signal as a function of time-discrete
stem(t,y_down)
grid('on')
xlabel('nth Sample of the Signal')
ylabel('Amplitude')
title('Signal Downsample 2x')
