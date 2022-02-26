% Create a .wav file from the .mat file
load ecen455_lab1_sound.mat
filename = 'lab1_sound.wav';
Fs = 48000;                 % sampling frequency of audio file
audiowrite(filename,y,Fs);  % read data from the .wav file
clear y Fs                  % clear from workspace to free up system memory

[y,Fs] = audioread('lab1_sound.wav');   % Read the data back into MATLAB

y_up = reshape([y';zeros(size(y'))],[],1);  % Insert zero between each element
N = length(y_up);       % number of data samples in new array
newFs = 2*Fs;           % upsampling the original sampling frequency
t = 0:N-1;              % array of new audio samples

wavplay(y_up,newFs)       % Play audio file

% Plot signal as a function of time-discrete
stem(t,y_up)
grid('on')
xlabel('nth Sample of the Signal')
ylabel('Amplitude')
title('Signal Upsample 2x')
