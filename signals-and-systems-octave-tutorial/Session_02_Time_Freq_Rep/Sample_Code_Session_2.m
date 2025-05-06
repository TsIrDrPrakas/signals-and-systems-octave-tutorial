% Sample_Code.m for Session 2: Time and Frequency Domain Representations

% Time vector
n = -20:20;
f = 0.05;  % frequency

% 1. Sine and Cosine Signals
x_sin = sin(2*pi*f*n);
x_cos = cos(2*pi*f*n);

figure;
subplot(2,1,1);
stem(n, x_sin);
title('Sine Signal'); xlabel('n'); ylabel('sin(2πfn)');

subplot(2,1,2);
stem(n, x_cos);
title('Cosine Signal'); xlabel('n'); ylabel('cos(2πfn)');

% 2. Exponential Signal
a = 0.9;
x_exp = a.^n;
figure;
stem(n, x_exp);
title('Exponential Signal'); xlabel('n'); ylabel('a^n');

% 3. Time-shifting
x_shift_right = sin(2*pi*f*(n-5));
x_shift_left = sin(2*pi*f*(n+5));

figure;
plot(n, x_sin, 'b', n, x_shift_right, 'r--', n, x_shift_left, 'g-.');
legend('Original', 'Shift Right (n-5)', 'Shift Left (n+5)');
title('Time Shifting');

% 4. Time-scaling (Downsampling)
x_downsampled = sin(2*pi*f*(2*n));
figure;
stem(n, x_downsampled);
title('Downsampled Signal (x[2n])');
xlabel('n'); ylabel('Amplitude');
