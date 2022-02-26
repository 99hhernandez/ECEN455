% Create a .wav file from the .mat file
load ecen455_lab1_sound.mat
filename = 'lab1_sound.wav';
Fs = 48000;                 % sampling frequency of audio file
audiowrite(filename,y,Fs);  % read data from the .wav file
clear y Fs                  % clear from workspace to free up system memory

% Read the data back into MATLAB
[y,Fs] = audioread('lab1_sound.wav');
N = length(y);      % number of the data samples in the audio file
t = 0:N-1;          % array of audio samples
%N/Fs               % length of audio file (in seconds)

wavplay(y,Fs)       % play audio file

% Plot signal as a function of time-discrete
stem(t,y)
grid('on')
xlabel('nth Sample of the Signal')
ylabel('Amplitude')
title('Original Signal x[n]')