% Session 00: Getting Started with GNU Octave


%% 1. Elementary Calculations
a = 5 + 3;
b = 12 / 4;
c = sqrt(16);
d = sin(pi/2);

%% 2. Creating a Matrix
A = [1 2 3; 4 5 6; 7 8 9];

%% 3. Matrix Arithmetic
B = A + 2;
C = A * A; % matrix multiplication
D = A .* A; % element-wise multiplication

%% 4. Solving a System of Linear Equations
% Solve Ax = b where A is a matrix and b is a vector
A_sys = [3, 2; 1, 2];
b_sys = [5; 5];
x = A_sys \ b_sys;

%% 5. Integrating a Differential Equation (Simple example)
% dy/dt = -y, y(0) = 1
t = linspace(0, 5, 100);
y = exp(-t);
plot(t, y);
title('Solution to dy/dt = -y');
xlabel('Time (t)');
ylabel('y(t)');

%% 6. Help and Documentation
% Use help to learn more about functions
help plot
help sqrt

%% 7. Editing and History
% Use up/down arrow keys in Octave CLI to scroll through previous commands

% End of Session 01 Exercises
