clc;
clear;

syms x

% Define the symbolic function
f_sym = sin(x) + x^2;

% -------------------------------
% 1. Symbolic Indefinite Integration
fprintf('1. Symbolic Indefinite Integration:\n');
indef_integral = int(f_sym, x);
disp(indef_integral);

% -------------------------------
% 2. Symbolic Definite Integration from 0 to pi
fprintf('\n2. Symbolic Definite Integration from 0 to pi:\n');
def_integral = int(f_sym, x, 0, pi);
disp(def_integral);

% -------------------------------
% 3. Numerical Integration using integral() (Anonymous Function)
fprintf('\n3. Numerical Integration using integral() from 0 to pi:\n');
f_numeric = @(x) sin(x) + x.^2;
num_integral = integral(f_numeric, 0, pi);
disp(num_integral);

% -------------------------------
% 4. Numerical Integration using Trapezoidal Rule
fprintf('\n4. Numerical Integration using trapz():\n');
x_vals = linspace(0, pi, 100);           % 100 sample points
y_vals = sin(x_vals) + x_vals.^2;
trap_integral = trapz(x_vals, y_vals);
disp(trap_integral);

% -------------------------------
% 5. Cumulative Trapezoidal Integration using cumtrapz()
fprintf('\n5. Cumulative Trapezoidal Integration using cumtrapz():\n');
cum_trap_integral = cumtrapz(x_vals, y_vals);
disp(['Final value: ', num2str(cum_trap_integral(end))]);

% Plot cumulative integral
figure;
plot(x_vals, cum_trap_integral, 'LineWidth', 2);
title('Cumulative Integral using cumtrapz');
xlabel('x');
ylabel('Cumulative \int f(x) dx');
grid on;

% -------------------------------
% 6. Numerical Integration using Simpson's Rule (custom)
fprintf('\n6. Numerical Integration using Simpson''s Rule:\n');
n = 100;  % Must be even
a = 0; b = pi;
h = (b - a) / n;
x_simpson = a:h:b;
y_simpson = sin(x_simpson) + x_simpson.^2;
simpson_integral = (h/3) * (y_simpson(1) + ...
    4 * sum(y_simpson(2:2:end-1)) + ...
    2 * sum(y_simpson(3:2:end-2)) + ...
    y_simpson(end));
disp(simpson_integral);
