% Session 1 Exercises: Introduction to GNU Octave

% Clear workspace
clear; clc;

% Create a time vector
t = 0:0.1:10;

% Unit Step Signal
u = ones(size(t));
figure;
stem(t, u);
title('Unit Step Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Impulse Signal (only one non-zero element)
imp = zeros(size(t));
imp(1) = 1;
figure;
stem(t, imp);
title('Impulse Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Ramp Signal
ramp = t;
figure;
plot(t, ramp);
title('Ramp Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Task: Try plotting a decaying exponential signal using exp(-t)
% Hint: Use y = exp(-t);