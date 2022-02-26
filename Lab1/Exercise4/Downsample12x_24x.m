% Create a .wav file from the .mat file
load ecen455_lab1_sound.mat
filename = 'lab1_sound.wav';
Fs = 48000;                 % sampling frequency of audio file
audiowrite(filename,y,Fs);  % read data from the .wav file
clear y Fs                  % clear from workspace to free up system memory

[y,Fs] = audioread('lab1_sound.wav');   % Read the data back into MATLAB

% Downsample signal by factor of 12
M = 12;
Fs1 = Fs / M;
y_down12 = y(1:M:end);

% Downsample signal by factor of 24
M2 = 24;
Fs2 = Fs / M2;
y_down24 = y(1:M2:end);

wavplay(y_down12,Fs1)       % play audio downsampled by factor 12
wavplay(y_down24,Fs2)       % play audio downsampled by factor 24 