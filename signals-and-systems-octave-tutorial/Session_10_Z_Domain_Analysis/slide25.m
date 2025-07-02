% Slide 25: Z-Plane ROC for causal signal x[n] = a^n u[n]
clear; clc; close all;

%% Define test cases
a_values = [0.5, 1.5, -0.5, -1.5];
titles = {'a) 0 < a < 1', 'b) a > 1', 'c) -1 < a < 0', 'd) a < -1'};
% Defines the 4 values of a and corresponding titles for each subplot.
%% Create figure
figure('Name','Slide 25 - ROC for Causal Signals','NumberTitle','off');
theta = linspace(0, 2*pi, 300); 
%Creates a new figure and defines the angle θ to draw circles in polar form.

%% Main Loop: One Plot per Case
for i = 1:4
    a = a_values(i);  % Select the current value of 'a'
    r = abs(a); % Radius = magnitude of pole location
    subplot(2,2,i);  % 2x2 grid of subplots
    hold on; axis equal; grid on;
    %% Draw Unit Circle and Pole
    % Plot unit circle
    plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1.2);
    % Plots the unit circle ∣z∣=1 as a dashed line (black).

    % Plot pole at z = a
    plot(real(a), imag(a), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
    % Plots the pole at z=a using a red "x".
    
    %%  Shade the ROC for Causal Case
    % Plot ROC: |z| > |a|
    roc_r = linspace(r + 0.01, 2.2, 100); % Wider, smoother ROC
        % Generate ROC radius values for causal signals
        % 
        % roc_r = linspace(r + 0.01, 2.2, 100);
        %
        % Explanation:
        %
        % - r = abs(a);  % This is the magnitude of the pole |a|
        %
        % - r + 0.01: We start slightly outside the pole to avoid drawing at the
        %   exact pole location (Z-transform is undefined at poles). The +0.01 is
        %   a small offset to ensure numerical separation.
        %
        % - 2.2: This is the outer limit for the ROC shading. It’s a plotting boundary
        %   to give the region enough width for visualization. You can adjust this value
        %   depending on how zoomed-in or zoomed-out you want the ROC area.
        %
        % - linspace(start, end, N): Generates N evenly spaced radii from just
        %   outside the pole (r + 0.01) up to 2.2. These radii are used to draw 
        %   concentric ROC circles (light blue lines) to visualize the ROC.
        %
        % - For causal signals, ROC is |z| > |a| → i.e., outside the outermost pole.

    for rr = roc_r
        x = rr * cos(theta);
        y = rr * sin(theta);
        plot(x, y, 'b', 'LineWidth', 0.3);
    end
    % Loops through concentric circles outside the pole to show the ROC ∣z∣>∣a∣.
    % Each ROC circle is plotted in light blue.

    %% Add Title and Axes Labels
    title(['Case ', titles{i}, ' → ROC: |z| > |a|']);
    xlabel('Re'); ylabel('Im');
    xlim([-2.5 2.5]); ylim([-2.5 2.5]);
end


%% What Students Should Learn from This Plot:
% 
% For causal signals, the ROC is always outside the outermost pole.
%
% The unit circle is used to check for stability:
%
% - If |a| < 1, the unit circle lies inside the ROC ⇒ the system is **stable**
% - If |a| > 1, the unit circle is outside the ROC ⇒ the system is **not stable**
%
% This visualizes how causality and stability are linked through the
% pole location and the ROC in the Z-plane.
