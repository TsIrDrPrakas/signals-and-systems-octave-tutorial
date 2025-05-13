% Session 3: Signal Operations and Convolution

% Define discrete signals
n = 0:10;
x1 = sin(0.2 * pi * n);
x2 = cos(0.2 * pi * n);

% Signal Addition
y_add = x1 + x2;
figure; stem(n, y_add);
title('Signal Addition: x1[n] + x2[n]');

% Signal Multiplication
y_mult = x1 .* x2;
figure; stem(n, y_mult);
title('Signal Multiplication: x1[n] * x2[n]');

% Signal Scaling
a = 2;
y_scale = a * x1;
figure; stem(n, y_scale);
title('Signal Scaling: 2 * x1[n]');

% Convolution Example
x = [1 2 1];
h = [1 -1 2];
y_conv = conv(x, h);
n_conv = 0:length(y_conv)-1;
figure; stem(n_conv, y_conv);
title('Convolution: y[n] = x[n] * h[n]');
xlabel('n'); ylabel('Amplitude');
