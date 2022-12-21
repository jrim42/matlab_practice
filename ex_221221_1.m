clc;
clear;
close all;

title('exercise1');

t = 0: pi / 20: 2 * pi;
plot(t, sin(t), '-.r*');
hold on;
plot(t, sin(t) * 2, '--mo');
plot(t, cos(t), ':bs');
plot(t, atan(t), 'ks', ...
    'LineWidth', 1, ...
    'MarkerEdgeColor', 'k', ...
    'MarkerFaceColor', [.5, .8, .8], ...
    'MarkerSize', 5);
% background color
set(gcf, 'Color', [.8, .8, .8]);