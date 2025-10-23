clc
clear
close all

[x, fs] = audioread('music_test_fayrouz1.mp3'); % You can use any wav file you have

disp('Playing original sound...')
sound(x, fs);
pause(length(x)/fs + 1);

% Add white Gaussian noise to the signal
noisy_signal = x + 0.05*randn(size(x));

disp('Playing noisy sound...')
sound(noisy_signal, fs);
pause(length(noisy_signal)/fs + 1);

% Moving average filter parameters
windowSize = 30; % Number of samples to average over(10,50)
b = (1/windowSize)*ones(1, windowSize); % numerator coefficients of the filter 
a = 1; % denominator coefficients

% Apply moving average filter
filtered_signal = filter(b, a, noisy_signal);

% Play filtered sound
disp('Playing filtered sound...')
sound(filtered_signal, fs);

