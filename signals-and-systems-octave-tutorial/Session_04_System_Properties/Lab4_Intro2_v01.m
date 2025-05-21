% MATLAB Code Examples for Signals and Systems (Sessions 1–4)
%% 1. Plotting Basic Signals
% Time vector
t = -2:0.01:2;

% Sine and cosine
x1 = sin(2*pi*1*t); % 1 Hz sine
x2 = cos(2*pi*1*t); % 1 Hz cosine

% Plotting
figure;
subplot(2,1,1); plot(t, x1); title('Sine Wave'); xlabel('t'); ylabel('Amplitude');
subplot(2,1,2); plot(t, x2); title('Cosine Wave'); xlabel('t'); ylabel('Amplitude');

%% 2. Exponential and Step Signal
% Time vector
t = 0:0.01:5;
x = exp(-2*t);

% Step function
u = t >= 0;

figure;
plot(t, x.*u);
title('Exponential Decay with Step Function');
xlabel('Time (s)'); ylabel('Amplitude');

%% 3. Signal Manipulation (Time Shifting and Scaling)
t = -5:0.01:5;
x = sin(t);

% Time shifting and scaling
x_shifted = sin(t - 2);   % Delay
x_scaled = sin(2*t);      % Compressed

figure;
plot(t, x, 'b', t, x_shifted, 'r--', t, x_scaled, 'g:');
legend('Original', 'Shifted (t-2)', 'Scaled (2t)');
title('Signal Manipulation');
xlabel('Time'); ylabel('Amplitude');

%% 4. Convolution (Zero-State Response)
% Discrete signals
x = [1 2 3];
h = [1 0.5];

% Convolution (Zero-State Response)
y = conv(x, h);

stem(y);
title('Convolution of x[n] and h[n]');
xlabel('n'); ylabel('y[n]');

%% 5. Solving an ODE (Zero-Input Response)
% Solve: y'' + 2y' + y = 0, with y(0)=1, y'(0)=0

% Define the system as a function
ode_func = @(t, y) [y(2); -2*y(2) - y(1)];

% Initial conditions: y(0) = 1, y'(0) = 0
y0 = [1; 0];

% Time span
tspan = [0 10];

% Solve using ode45
[t, y] = ode45(ode_func, tspan, y0);

plot(t, y(:,1));
title('Zero-Input Response');
xlabel('Time (s)'); ylabel('y(t)');

%% 6. Impulse Response via `impulse()` (Control Toolbox Required)
% Define transfer function: H(s) = 1 / (s^2 + 2s + 1)
num = [1];
den = [1 2 1];

sys = tf(num, den);
impulse(sys);
title('Impulse Response');

%% 7. Total Response (Zero-Input + Zero-State)
% Define the input function
x = @(t) exp(-t);

% Define the system of ODEs for total response:
% y1 = y, y2 = y'
% y1' = y2
% y2' = -2*y2 - y1 + x(t)

ode_func_total = @(t, y) [y(2); -2*y(2) - y(1) + x(t)];

% Initial conditions
y0 = [1; 0];  % y(0) = 1 (non-zero), y'(0) = 0

% Time span
tspan = [0 10];

% Solve using ode45
[t, y] = ode45(ode_func_total, tspan, y0);

% Plot Total Response
figure;
plot(t, y(:,1), 'b', 'LineWidth', 1.5);
title('Total Response of the System');
xlabel('Time (s)'); ylabel('y(t)');
grid on;
