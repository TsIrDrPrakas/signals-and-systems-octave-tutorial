% Slide 26: Z-Plane ROC for anti-causal signal x[n] = a^n u[-n - 1]
clear; clc; close all;

% Define test cases
a_values = [0.5, 1.5, -0.5, -1.5];
titles = {'a) 0 < a < 1', 'b) a > 1', 'c) -1 < a < 0', 'd) a < -1'};

% Create figure
figure('Name','Slide 26 - ROC for Anti-Causal Signals','NumberTitle','off');
theta = linspace(0, 2*pi, 300);

for i = 1:4
    a = a_values(i);
    r = abs(a);
    subplot(2,2,i);
    hold on; axis equal; grid on;

    % Plot unit circle
    plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1.2);

    % Plot pole at z = a
    plot(real(a), imag(a), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

    % Plot ROC: |z| < |a| (anti-causal)
    roc_r = linspace(0.01, r - 0.01, 100);
    for rr = roc_r
        x = rr * cos(theta);
        y = rr * sin(theta);
        plot(x, y, 'b', 'LineWidth', 0.3);
    end

    title(['Case ', titles{i}, ' → ROC: |z| < |a|']);
    xlabel('Re'); ylabel('Im');
    xlim([-2.5 2.5]); ylim([-2.5 2.5]);
end
