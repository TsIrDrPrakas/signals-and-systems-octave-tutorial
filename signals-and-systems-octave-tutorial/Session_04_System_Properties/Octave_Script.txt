% Define input signal
n = 0:10;
x = sin(0.2*pi*n);

% Example 1: Linear System
y1 = 2 * x;

% Example 2: Non-linear System
y2 = x.^2;

% Example 3: Time-invariant check
x_delayed = [0 0 x(1:end-2)];
y3 = x_delayed;

% Example 4: Non-causal System
x_future = [x(2:end), 0];
y4 = x + x_future;

% Plot one example
subplot(2,1,1); stem(n,x); title('Input x[n]'); xlabel('n'); ylabel('Amplitude');
subplot(2,1,2); stem(n,y4); title('Output y[n] = x[n] + x[n+1]'); xlabel('n'); ylabel('Amplitude');