%% Type of Integration 
%% int — Symbolic Integration
syms x
int_result = int(sin(x), 0, pi);  % returns 2
%% integral — Numerical Integration of Functions
f = @(x) sin(x);
result = integral(f, 0, pi);  
% accurate integral using adaptive quadrature
%% trapz — Trapezoidal Numerical Integration
x = 0:0.1:10;
y = sin(x);
total_area = trapz(x, y);  
% approximate integral of sin(x) over x
%% cumtrapz — Cumulative Integration Using Trapezoidal Rule
area_cumulative = cumtrapz(x, y);  
% cumulative integral of sin(x)
