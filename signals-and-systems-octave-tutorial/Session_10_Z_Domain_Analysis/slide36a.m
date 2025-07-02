% Slide 36: Inverse Z-Transform using power series (long division)

clear; clc;

% Parameters
a = 0.5;             % Set a value of 'a', e.g., 0.5
N = 10;              % Number of terms to expand
syms z n

% Define X(z)
X_z = 1 / (1 - a * z^(-1));

% Generate the power series manually
x_n_terms = sym('x', [1 N]);  % Pre-allocate symbolic array
for k = 0:N-1
    x_n_terms(k+1) = a^k;     % Coefficient of z^(-k)
end

% Display the result
disp('Power Series Expansion of X(z):');
for k = 0:N-1
    fprintf('x[%d] = %.4f\n', k, double(x_n_terms(k+1)));
end

% Optional: plot the sequence
stem(0:N-1, double(x_n_terms), 'filled');
xlabel('n'); ylabel('x[n]');
title(['Inverse Z-transform: x[n] = a^n u[n], with a = ', num2str(a)]);
grid on;
