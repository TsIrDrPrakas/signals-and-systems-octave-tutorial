%% Session 5: Impulse and Step Response Analysis
clear all
clc
%pkg load control; % add this for GNU
num = [1];
den = [1, 4, 5];
sys = tf(num, den);
figure(1)
impulse(sys);  % Impulse response plot
figure(2)
step(sys);     % Step response plot

